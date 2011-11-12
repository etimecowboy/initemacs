;;; Commentary:

;; ERT is a tool for automated testing in Emacs Lisp.  Its main
;; features are facilities for defining and running test cases and
;; reporting the results as well as for debugging test failures
;; interactively.
;;
;; The main entry points are `deftest', which is similar to `defun'
;; but defines a test, and `ert-run-tests-interactively', which runs
;; tests and offers an interactive interface for inspecting results
;; and debugging.  There is also `ert-run-tests-batch' for
;; non-interactive use.
;;
;; The body of `deftest' forms resembles a function body, but the
;; additional operators `should', `should-not' and `should-error' are
;; available.  `should' is similar to cl's `assert', but signals a
;; different error when its condition is violated that is caught and
;; processed by ERT.  In addition, it analyzes its argument form and
;; records information that helps debugging (`assert' tries to do
;; something similar when its second argument SHOW-ARGS is true, but
;; `should' is more sophisticated).  For information on `should-not'
;; and `should-error', see their docstrings.
;;
;; For example,
;;
;;     ;; Define a test named `foo'.
;;     (deftest foo ()
;;       (should (= (+ 1 2) 4)))
;;
;;     ;; Run it.
;;     (ert-run-tests-interactively 'foo)
;;
;; generates the following output (in addition to some statistics) in
;; the *ert* results buffer:
;;
;;     F foo
;;         (ert-test-failed
;;          ((should
;;            (=
;;             (+ 1 2)
;;             4))
;;           :form
;;           (= 3 4)
;;           :value nil))
;;
;; This indicates that the test failed.  The `should' form that failed
;; was (should (= (+ 1 2) 4)), because its inner form, after
;; evaluation of its arguments, was the function call (= 3 4), which
;; returned nil.
;;
;; Obviously, this is a bug in the test case, not in the functions `+'
;; or `='.  In the results buffer, with point on the test result, the
;; key "." can be used to jump to the definition of the test to modify
;; it to correct the bug.  After evaluating the modified definition
;; and switching back to the results buffer, the key "r" will re-run
;; the test and show the new result.


;; Test selectors
;;
;; Functions like `ert-run-tests-interactively' accept a test
;; selector, which is a Lisp expression specifying a set of tests.
;; Each test name is a selector that refers to that test, the selector
;; `t' refers to all tests, and the selector `:failed' refers to all
;; tests that failed; but more complex selectors are available.  Test
;; selector syntax is similar to cl's type specifier syntax.  See the
;; docstring of `ert-select-tests' for details.


;; Comparison with other testing tools
;;
;; ERT allows test-driven development similar to *Unit frameworks for
;; other languages.  However, two common *Unit features are notably
;; absent from ERT: fixtures and test suites.
;;
;; Fixtures, as used e.g. in SUnit or JUnit, have two main purposes:
;; Setting up (and tearing down) an environment for a set of test
;; cases, and making that environment accessible through object
;; attributes that can be used like local variables.
;;
;; While fixtures are a great syntactic simplification in other
;; languages, they are not very useful in Lisp, where higher-order
;; functions and `unwind-protect' are available.  One way to implement
;; and use a fixture in ERT is
;;
;;    (defun my-fixture (body)
;;      (unwind-protect
;;          (progn ...set up...
;;                 (funcall body))
;;        ...tear down...))
;;
;;    (deftest my-test ()
;;      (my-fixture
;;       (lambda ()
;;         ...test code...)))
;;
;; (Another way would be a `with-my-fixture' macro.)  This solves the
;; set-up and tear-down part, and additionally allows any test case to
;; use any combination of fixtures, so it is more general than what
;; other tools typically allow.
;;
;; If the test case needs access to the environment the fixture sets
;; up, the fixture can be modified to pass arguments to the body.
;;
;; These are standard Lisp idioms.  Special syntax for them could be
;; added easily enough, but would provide only a minor simplification.
;;
;; (Note that splitting set-up and tear-down into separate functions,
;; like *Unit tools usually do, makes it impossible to establish
;; dynamic `let' bindings as part of the fixture.  So, blindly
;; imitating the way fixtures are implemented in other languages would
;; be counter-productive in Lisp.)
;;
;;
;; The purpose of test suites is to group related test cases together.
;; The most common use of this is to run just the tests for one
;; particular module.  Since symbol prefixes are the usual way of
;; separating module namespaces in Emacs Lisp, test selectors already
;; solve this by allowing regexp matching on test names; e.g., the
;; selector "^ert-" selects ERT's self-tests.
;;
;; If test suites containing arbitrary sets of tests are found to be
;; desirable, it would be easy to add a `define-test-selector'
;; mechanism that introduces a new selector, defined in terms of
;; existing ones; e.g.
;;
;;     ;; Note that `define-test-selector' does not exist yet.
;;     (define-test-selector my-test-suite () `(member foo-test bar-test))
;;
;; would define a test suite named `my-test-suite' consisting of
;; `foo-test' and `bar-test'.  See also `deftype' in Common Lisp.


;; TODO: Add `skip' feature for tests that can't run in current environment.


