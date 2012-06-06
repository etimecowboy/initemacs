
open Unix;;
open Str;;

let verbose = ref 0;;
let eps = ref true;; (* false *)

let reuse = ref true;;
let reuse_file filename = !reuse && Sys.file_exists filename

(* lib *)
let try_finalize f x finally y =
  let res = try f x with exn -> finally y; raise exn in 
  finally y; 
  res


type cache = (string, (Digest.t * Digest.t)) Hashtbl.t

let read_cache filename =
  if reuse_file filename
  then
    let fd = open_in filename in
    let cache : cache = input_value fd in close_in fd; cache
  else Hashtbl.create 13

let open_out f = open_out f
let next_line (pos, f) =
  incr pos; input_line f

let write_cache cache filename = 
  let fd = open_out filename in
  let () = output_value fd cache in
  close_out fd

let output_line fd s = output_string fd s; output_char fd '\n';;

type env =
    { basename : string;
      mainname : string; 
      texin : int ref * in_channel;
      mutable lineno : int;
      mlout : out_channel; 
      cache : cache;
      digest : Digest.t;
      figures : string list;
    }

type figure =
    { options : string;
      name : string;
      body : string;
    }

let find_block (re_begin, re_end, re_limit) (pos, _ as fd) = 
  let rec skip_to_start() = 
    let line = next_line fd  in
    if Str.string_match re_limit line 0 then raise End_of_file;
    if Str.string_match re_begin line 0
    then line
    else skip_to_start () in

  let first = skip_to_start() in
  let pos = !pos in
  let rec collect_to_end lines = 
    let line = next_line fd  in
    if Str.string_match re_limit line 0 then raise End_of_file;
    if Str.string_match re_end line 0
    then pos, first, List.rev lines, line
    else collect_to_end (line :: lines) in
  try collect_to_end []
  with End_of_file -> failwith ("open block: " ^ first) 

let re_begin_mlpost =
  Str.regexp "^\\\\begin{mlpost}\\(\\[[^]]*\\]\\|\\){\\([^}]*\\)}"
let re_end_mlpost =
  Str.regexp "^\\\\end{mlpost}"
let re_begin_document = 
  Str.regexp "^\\\\begin{document}"
let re_end_document = 
  Str.regexp "^\\\\end{document}"
let re_EOF = 
  Str.regexp "^%%EOF"

let re_mark = Str.regexp "\001" 
let find_figure fd limit =
  try
    let pos, first, body, last =
      find_block (re_begin_mlpost, re_end_mlpost, limit) fd in
    assert (Str.string_match re_begin_mlpost first 0);
    let options = Str.matched_group 1 first in
    let arg = Str.matched_group 2 first in
    let clean s = String.concat "" (Str.split re_mark s) in
    Some (pos, options, arg, String.concat "\n" (List.map clean body))
  with End_of_file -> None
;;
      
let digest_concat t1 t2 =
  Digest.string (Digest.to_hex t1 ^ Digest.to_hex t2) 

let figname env fig = Printf.sprintf "%s:%s" env.basename fig

let output_body env pos body = 
  output_line env.mlout (Printf.sprintf "\n# %d %s" pos env.mainname);
  output_line env.mlout body

let create_figure env figure pos body =
  let name = figname env figure in
  if !verbose > 0 then prerr_endline (name ^ ".mps"); 
  output_line env.mlout "\nlet () = let module M = struct";
  output_body env pos body;
  output_line env.mlout 
    (Printf.sprintf "\nend in Metapost.emit \"%s\" M.%s" name figure) 

let rec process limit env =
  match find_figure env.texin limit with
  | Some (pos, options, figure, body) ->
      let digest = digest_concat env.digest (Digest.string body) in
      if figure = "" then
        let () = output_body env pos body in
        process limit { env with digest = digest } 
      else
        let cached =
          try 
            let cache_in, cache_out = Hashtbl.find env.cache figure in
            cache_in = digest &&
            let mps_filename = figname env figure ^ ".mps" in
            reuse_file mps_filename &&
            Digest.file mps_filename = cache_out
          with Not_found -> false in
        if cached then process limit env
        else
          let () = create_figure env figure pos body in
          (figure, digest) :: process limit env
  | None -> []

let re_begin_document = Str.regexp "^\\\\begin{document}"

let scan_prelude fd =
  let rec scan lines = 
    let line = input_line fd in
    if Str.string_match re_begin_document line 0 then
      Digest.string (String.concat "" lines)
    else scan (line :: lines)
  in scan []

let re_header = Str.regexp "^%"
let re_font_header =
   if !eps
   then Str.regexp "^%%DocumentFonts: \\(.*\\)" 
   else Str.regexp "^%\\*Font: \\([^ ]*\\)"

;;

let re_blank = Str.regexp " "

let find_needed_fonts env (figure, cache_in) =
  let mps_filename = figname env  figure ^ ".mps" in
  (* update cache *)
  let cache_out = Digest.file mps_filename in
  Hashtbl.replace env.cache figure (cache_in, cache_out);
  (* extract fonts *)
  let mps = open_in mps_filename in
  let rec scan_fonts () =
    try
      let line = input_line mps in
      if Str.string_match re_header line 0 then
        if Str.string_match re_font_header line 0
        then
          let font_list = Str.matched_group 1 line in
          let fonts = Str.split re_blank font_list in
          fonts :: scan_fonts()
        else scan_fonts()
      else []
    with End_of_file ->  [] in
  match List.map String.lowercase (List.concat (scan_fonts())) with
  | _ :: _ as all_fonts -> 
    let fonts_filename = figname env figure ^ ".fonts" in
    let fdout = open_out fonts_filename in
    List.iter
      (fun s ->
        let special = Printf.sprintf "\\special{header=%s.font}\n" s in
        output_string fdout special)
      all_fonts;
    close_out fdout;
    List.filter (fun s ->  not (reuse_file (s ^ ".font"))) all_fonts
  | [] -> []
;;


(*
let re_ps_font_start, re_font_pos, re_ps_font_end =
   Str.regexp "^%\\(%BeginFont:\\|DVIPSBitmapFont: Fd\\) \\([^ ]*\\\)", 2,
   Str.regexp "^%%EndFont"
*)

let re_ps_font_start, re_font_pos, re_ps_font_end =
  if !eps 
  then Str.regexp "^%%BeginProcSet: \\([^.]*\\)", 1, Str.regexp "^%%EndProcSet"
  else Str.regexp "^%%BeginFont: \\([^ ]*\\)", 1, Str.regexp "^%%EndFont"
;;

let create_psfont font (_, first, body, last) =
  let font_filename = font ^ ".font" in
  if !verbose > 0 then prerr_endline  font_filename;
  let font_fd = open_out font_filename in
  try_finalize
    (function () -> 
      output_line font_fd first;
      List.iter (output_line font_fd) body;
      output_line font_fd last
    ) ()
    close_out font_fd


let create_fonts needed_fonts fd =
  let next_font() = 
    let _, first, body, last as code =
      find_block (re_ps_font_start, re_ps_font_end, re_EOF) fd in
    assert (Str.string_match re_ps_font_start first 0);
    let font = String.lowercase (Str.matched_group re_font_pos first) in
    if List.mem font needed_fonts then create_psfont font code in
  try while true do next_font() done
  with End_of_file -> ()
;;

exception Log of string * string * string * string
  

let process_file mainname filename =
  let basename = Filename.chop_suffix mainname ".tex" in
  let ml_filename = basename ^ ".ml" in
  let mlout = open_out ml_filename in
  let cache_filename = basename ^ ".cache" in
  let cache = read_cache cache_filename in
  let texmain = open_in mainname in
  let digest = scan_prelude texmain in
  let () = close_in texmain in
  let texmain = ref 0, open_in mainname in
  let env =
    { basename = basename;
      mainname = mainname;
      texin = texmain;
      lineno = 0;
      mlout = mlout;
      cache = cache;
      digest = digest;
      figures = [];
    } in
  let figures = 
    match filename with
    | None ->
        try_finalize (process re_end_document) env
          close_in (snd texmain)
    | Some filename ->
        let prelude = process re_begin_document env in
        let texin = ref 0, open_in filename in
        try_finalize
          (process re_end_document) {env with texin = texin }
          close_in (snd texin)
        @ prelude in
  if figures <> [] then
    let prelude = 
      "\\\\documentclass{article}\n\\\\usepackage{mlpost}\n" in
    let postlude =
      String.concat ""
        [ "let () = Mlpost.Metapost.dump ~prelude:\""; prelude;
          "\" ~pdf:true ~eps:"; if !eps then "true" else "false";
          " ~verbose:false \""; basename; "\"\n" ] in
    let () = output_string mlout postlude in
    let () = close_out mlout in

    let call f argl =
      let args = String.concat " " argl in
      let log = Printf.sprintf "%s-%s.log" basename f in
      let err = Printf.sprintf "%s-%s.err" basename f in
      let cmd = Printf.sprintf "%s %s 1>%s 2>%s" f args log err in
      let ret = Sys.command cmd in
      if ret > 0 then raise (Log (f, args, log, err)) in

    let () =  call "ocaml" [ "-I +mlpost unix.cma mlpost.cma"; ml_filename] in
    let fonts = List.concat (List.map (find_needed_fonts env) figures) in
    write_cache cache cache_filename;
    let () =
      if fonts <> [] then
        let () = call "latex" [ mainname ] in
        let () = call "dvips" [ basename ^ ".dvi"; "-o" ] in
        let fd = open_in (basename ^ ".ps") in
        create_fonts fonts (ref 0, fd) in
    let check font =
      if not (Sys.file_exists (font ^ ".font")) then
        Printf.eprintf "Font %s missing\n%!" font in
    List.iter check fonts
      
;;

let () =
  let args = List.tl  (Array.to_list Sys.argv) in
  let rec process = function
    |  "-v" :: rest ->
        incr verbose; process rest
    |  "-f" :: rest ->
        reuse := false; process rest
    | basename :: filename :: _ ->
        process_file basename (Some filename)
    | filename :: _ ->
        process_file filename None
    | _ -> () in
  try process args with
  | Log (f, args, log, err) ->
    Printf.eprintf "%s %s failed\nSee log in %s and err in %s\n%!"
      f args log err;
    exit (match f with "ocaml" -> 1 | _ -> 2)
