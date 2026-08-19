#!/usr/bin/env bash
# verify.sh — Mojo Miji Tutorial Syntax Verification
#
# Runs every .mojo and .py file under src/ to check whether it still works with
# the current version of Mojo, and reports files that compile but emit
# deprecation warnings.
#
# Usage:  pixi run verify              # the whole src/ tree
#         bash verify.sh src/basic     # one folder (this is what CI does)
#
# Exit code:
#   0  — no unexpected failures and no unexpected warnings
#   1  — at least one file that should pass actually failed,
#        or at least one file emitted an unexpected deprecation warning
#
# This script is the single source of truth for what is expected to pass, to
# fail, or to be skipped. CI calls it too, so the lists below can never drift
# apart from what you see locally.

# ── Colours ──────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

# ── Timeout setup (portable) ─────────────────────────────────────────
# coreutils is a pixi dependency, so `timeout` is available in the environment.
TIMEOUT_SEC=120
if command -v timeout >/dev/null 2>&1; then
    TIMEOUT=timeout
elif command -v gtimeout >/dev/null 2>&1; then
    TIMEOUT=gtimeout
else
    printf "${YELLOW}Warning:${NC} 'timeout' not found. Files with infinite loops will hang.\n"
    TIMEOUT=""
fi
run_with_timeout() {
    if [[ -n "$TIMEOUT" ]]; then "$TIMEOUT" "$TIMEOUT_SEC" "$@" 2>&1
    else "$@" 2>&1; fi
}

# ── Expected failures ────────────────────────────────────────────────
# Files that are *intentionally* broken (compilation or runtime errors)
# to demonstrate error scenarios in the tutorial.
EXPECT_FAIL=(
    # basic/composite
    "src/basic/composite/list_assignment_with_only_equal_sign.mojo"
    "src/basic/composite/list_iteration_before_mojo_v25d4.mojo"
    # basic/control
    "src/basic/control/non_exhaustive_conditional.mojo"
    # basic/copy
    "src/basic/copy/implicit_copy_between_variables_errors.mojo"
    # basic/docstring
    "src/basic/docstring/docstring.mojo"
    # basic/errors
    "src/basic/errors/raise_a_string.mojo"
    "src/basic/errors/unhandled_error.mojo"
    "src/basic/errors/unhandled_error_with_raises_keyword.mojo"
    # basic/functions
    "src/basic/functions/def_read_and_modify.mojo"
    "src/basic/functions/fn_read_and_modify.mojo"
    "src/basic/functions/keywords_deprecation.mojo"
    "src/basic/functions/read_keyword_change.mojo"
    # basic/string
    "src/basic/string/f_string.mojo"
    "src/basic/string/string_len.mojo"
    "src/basic/string/string_positional_indexing.mojo"
    # basic/structs — the ZeroDivisionError traceback is printed in the Miji
    "src/basic/structs/complex_number.py"
    # basic/types
    "src/basic/types/boolean_implicit_conversion_to_int.mojo"
    "src/basic/types/incompatible_literal_type_and_annotation.mojo"
    "src/basic/types/integer_exercise_fix_operations.mojo"
    "src/basic/types/integer_operations_on_incompatible_types.mojo"
    # basic/variables
    "src/basic/variables/reassign_values_with_different_types.mojo"
    "src/basic/variables/redefinition.mojo"
    "src/basic/variables/scope_of_for_loop_variable.mojo"
    "src/basic/variables/use_variables_of_sub_scopes.mojo"
    # advanced/lifetimes
    "src/advanced/lifetimes/combined_lifetime_wrong.mojo"
    "src/advanced/lifetimes/copy_values_of_different_origins.mojo"
    # advanced/ownership
    "src/advanced/ownership/destroy_value.mojo"
    "src/advanced/ownership/lifetime_owner_reference.mojo"
    "src/advanced/ownership/transfer_value_and_use_again.mojo"
    # advanced/references
    "src/advanced/references/transfer_ownership_via_reference.mojo"
    # move — Python code pasted into Mojo unchanged, on purpose
    "src/move/sort_from_py.mojo"
    "src/move/triangle_from_py.mojo"
)

# ── Expected warnings ────────────────────────────────────────────────
# The warning gate below only looks at *deprecation* warnings, i.e. syntax that
# Mojo is phasing out. Style hints ("assignment never used", "'except' logic is
# unreachable", …) are ignored: a teaching example triggers them on purpose.
#
# Files listed here *deliberately* use deprecated syntax, because the Miji shows
# them to explain what older code looks like. They must still compile; their
# deprecation warnings are expected and are not reported.
EXPECT_WARN=(
    "src/basic/variables/variable_creation_without_var.mojo"
    "src/basic/variables/variable_creation_without_var_but_with_types.mojo"
    "src/move/sort_from_py.mojo"
    "src/move/triangle_from_py.mojo"
)

# ── Skip list ────────────────────────────────────────────────────────
# Files that cannot be *run* in an automated (non-interactive) setting:
#   - uses input()        → hangs waiting for stdin
#   - infinite loop       → never terminates
#   - too slow            → the Miji shows a truncated run
#   - no main function    → package / module file
#   - needs a build step  → imports a module that has to be compiled first
# Mojo files here are still *compiled*, and Python files are still
# *syntax-checked*, so that they cannot silently rot when the language changes.
SKIP=(
    # basic/control — interactive, infinite loop, or too slow
    "src/basic/control/give_commands.mojo"
    "src/basic/control/give_commands_with_while.mojo"
    "src/basic/control/is_prime_number.py"
    "src/basic/control/print_calendar.mojo"
    "src/basic/control/value_not_converging.mojo"
    # basic/errors — requires stdin
    "src/basic/errors/propagate_errors.mojo"
    # basic/packages — module files (no main)
    "src/basic/packages/point_type/__init__.mojo"
    "src/basic/packages/point_type/point.mojo"
    # advanced/lifetimes — interactive
    "src/advanced/lifetimes/combined_lifetime.mojo"
    "src/advanced/lifetimes/combined_lifetime_string.mojo"
    # advanced/parameterization — interactive
    "src/advanced/parameterization/print_sentences.mojo"
    "src/advanced/parameterization/print_sentences_argument.mojo"
    "src/advanced/parameterization/print_sentences_parameter.mojo"
    # advanced/simd — long-running benchmark
    "src/advanced/simd/simd_performance_benchmark.mojo"
    # apply/snake — interactive game
    "src/apply/snake/board.mojo"
    "src/apply/snake/game.mojo"
    "src/apply/snake/snake.mojo"
    # mojo2py — a Python extension module, and the script that imports it
    "src/mojo2py/mojo_module.mojo"
    "src/mojo2py/python_program.py"
    # move — naive recursive fib to 50, never finishes
    "src/move/fibonacci_np.py"
)

# ── Helpers ──────────────────────────────────────────────────────────
in_list() {
    local needle="$1"; shift
    local item
    for item in "$@"; do
        [[ "$item" == "$needle" ]] && return 0
    done
    return 1
}

# Only *deprecation* warnings gate the build; style hints are noise here.
deprecations() {
    printf '%s\n' "$1" | grep -a 'warning:.*deprecated'
}

# ── Discover files ───────────────────────────────────────────────────
roots=("$@")
(( ${#roots[@]} == 0 )) && roots=("src")

files=()
while IFS= read -r f; do
    files+=("${f#./}")
done < <(find "${roots[@]}" -type f \( -name '*.mojo' -o -name '*.py' \) | sort)

total=${#files[@]}
if (( total == 0 )); then
    printf "${YELLOW}Warning:${NC} no .mojo or .py files found in %s\n" "${roots[*]}"
    exit 0
fi

printf "${BOLD}══════════════════════════════════════════${NC}\n"
printf "${BOLD}  Mojo Miji — Tutorial Syntax Verification${NC}\n"
printf "${BOLD}══════════════════════════════════════════${NC}\n"
printf "  Folder(s):     %s\n" "${roots[*]}"
printf "  Files found:   %s\n" "$total"
printf "  Mojo version:  %s\n" "$(mojo --version 2>&1 || echo 'unknown')"
printf "  Timeout:       %ss per file\n" "$TIMEOUT_SEC"
printf "${BOLD}══════════════════════════════════════════${NC}\n\n"

# ── Counters ─────────────────────────────────────────────────────────
pass_count=0
expected_fail_ok_count=0
skip_count=0
unexpected_fail_count=0
unexpected_pass_count=0
warn_count=0

unexpected_failure_files=()
unexpected_failure_outputs=()
unexpected_pass_files=()
warning_files=()
warning_outputs=()

record_failure() {
    unexpected_failure_files+=("$1")
    unexpected_failure_outputs+=("$2")
    (( unexpected_fail_count++ ))
}
record_warning() {
    warning_files+=("$1")
    warning_outputs+=("$2")
    (( warn_count++ ))
}

# ── Run each file ────────────────────────────────────────────────────
index=0
for file in "${files[@]}"; do
    (( index++ ))
    progress="[${index}/${total}]"

    is_expect_fail=0
    in_list "$file" "${EXPECT_FAIL[@]}" && is_expect_fail=1
    is_expect_warn=0
    in_list "$file" "${EXPECT_WARN[@]}" && is_expect_warn=1

    # --- Skip running, but still check that it compiles / parses ---
    if in_list "$file" "${SKIP[@]}"; then
        if [[ "$file" == *.py ]]; then
            # Parse only — no .pyc files left behind.
            check_out=$(python -c 'import ast,sys; ast.parse(open(sys.argv[1]).read(), sys.argv[1])' "$file" 2>&1); rc=$?
            check_kind="parses"
        elif [[ -f "$(dirname "$file")/__init__.mojo" ]]; then
            # A module inside a package cannot be compiled on its own; it is
            # compiled as part of the package by whoever imports it.
            printf "${DIM}%s${NC} ${CYAN}SKIP${NC}     %s  ${DIM}(package member)${NC}\n" "$progress" "$file"
            (( skip_count++ )); continue
        else
            check_out=$(mojo build --emit=object -o /dev/null "$file" 2>&1); rc=$?
            check_kind="compiles"
        fi

        if (( rc != 0 )) && (( ! is_expect_fail )); then
            printf "${DIM}%s${NC} ${RED}FAIL${NC}     %s  ${DIM}(%s-only)${NC}\n" "$progress" "$file" "${check_kind%s}"
            record_failure "$file" "$check_out"; continue
        fi
        check_warns=$(deprecations "$check_out")
        if [[ -n "$check_warns" ]] && (( ! is_expect_warn )); then
            printf "${DIM}%s${NC} ${YELLOW}WARN${NC}     %s  ${DIM}(%s-only)${NC}\n" "$progress" "$file" "${check_kind%s}"
            record_warning "$file" "$check_warns"; continue
        fi
        printf "${DIM}%s${NC} ${CYAN}SKIP${NC}     %s  ${DIM}(%s)${NC}\n" "$progress" "$file" "$check_kind"
        (( skip_count++ )); continue
    fi

    # --- Run ---
    rc=0
    if [[ "$file" == *.mojo ]]; then
        output=$(run_with_timeout mojo run -D ASSERT=all "$file" </dev/null) || rc=$?
    else
        output=$(run_with_timeout python "$file" </dev/null) || rc=$?
    fi
    (( rc == 124 )) && output="TIMEOUT: file did not complete within ${TIMEOUT_SEC}s"

    if (( rc == 0 )); then
        if (( is_expect_fail )); then
            printf "${DIM}%s${NC} ${YELLOW}UNEXPECTED PASS${NC}  %s\n" "$progress" "$file"
            unexpected_pass_files+=("$file")
            (( unexpected_pass_count++ ))
        else
            warns=$(deprecations "$output")
            if [[ -n "$warns" ]] && (( ! is_expect_warn )); then
                printf "${DIM}%s${NC} ${YELLOW}WARN${NC}     %s\n" "$progress" "$file"
                record_warning "$file" "$warns"
            else
                printf "${DIM}%s${NC} ${GREEN}PASS${NC}     %s\n" "$progress" "$file"
            fi
            (( pass_count++ ))
        fi
    else
        if (( is_expect_fail )); then
            printf "${DIM}%s${NC} ${BLUE}XFAIL${NC}    %s\n" "$progress" "$file"
            (( expected_fail_ok_count++ ))
        else
            printf "${DIM}%s${NC} ${RED}FAIL${NC}     %s  ${DIM}(exit %s)${NC}\n" "$progress" "$file" "$rc"
            record_failure "$file" "$output"
        fi
    fi
done

# ── Summary ──────────────────────────────────────────────────────────
echo
printf "${BOLD}══════════════════════════════════════════${NC}\n"
printf "${BOLD}  Summary${NC}\n"
printf "${BOLD}══════════════════════════════════════════${NC}\n"
printf "  ${GREEN}%-22s %3d${NC}\n"  "Passed:"               "$pass_count"
printf "  ${BLUE}%-22s %3d${NC}\n"   "Expected failures:"    "$expected_fail_ok_count"
printf "  ${CYAN}%-22s %3d${NC}\n"   "Skipped:"              "$skip_count"
printf "  ${YELLOW}%-22s %3d${NC}\n" "Deprecation warnings:" "$warn_count"
printf "  ${YELLOW}%-22s %3d${NC}\n" "Unexpected passes:"    "$unexpected_pass_count"
printf "  ${RED}%-22s %3d${NC}\n"    "Unexpected failures:"  "$unexpected_fail_count"
printf "  %-22s %3d\n"               "Total:"                "$total"
printf "${BOLD}══════════════════════════════════════════${NC}\n"

# ── Details ──────────────────────────────────────────────────────────
if (( ${#unexpected_failure_files[@]} > 0 )); then
    echo
    printf "${RED}${BOLD}Unexpected failures (syntax may be outdated):${NC}\n\n"
    for i in "${!unexpected_failure_files[@]}"; do
        printf "  ${RED}❌ %s${NC}\n" "${unexpected_failure_files[$i]}"
        printf '%s\n' "${unexpected_failure_outputs[$i]}" | tail -6 | sed 's/^/     /'
        echo
    done
fi

if (( ${#warning_files[@]} > 0 )); then
    echo
    printf "${YELLOW}${BOLD}Deprecation warnings (compiles, but the syntax is on its way out):${NC}\n\n"
    for i in "${!warning_files[@]}"; do
        printf "  ${YELLOW}⚠  %s${NC}\n" "${warning_files[$i]}"
        printf '%s\n' "${warning_outputs[$i]}" | sed 's/^.*warning: /     warning: /' | sort -u | head -5
        echo
    done
fi

if (( ${#unexpected_pass_files[@]} > 0 )); then
    echo
    printf "${YELLOW}${BOLD}Unexpected passes (previously expected to fail — review needed):${NC}\n\n"
    for f in "${unexpected_pass_files[@]}"; do
        printf "  ${YELLOW}⚠  %s${NC}\n" "$f"
    done
    echo
fi

# ── GitHub Actions annotations ───────────────────────────────────────
if [[ -n "$GITHUB_ACTIONS" ]]; then
    echo
    for f in "${unexpected_failure_files[@]}"; do
        echo "::error file=$f::$f failed unexpectedly"
    done
    for f in "${warning_files[@]}"; do
        echo "::error file=$f::$f uses deprecated syntax — update it, or add it to EXPECT_WARN in verify.sh"
    done
    for f in "${unexpected_pass_files[@]}"; do
        echo "::warning file=$f::$f was expected to fail but passed — review the EXPECT_FAIL list in verify.sh"
    done
fi

# ── Exit code ────────────────────────────────────────────────────────
if (( unexpected_fail_count > 0 )); then
    printf "${RED}${BOLD}RESULT: FAIL${NC} — %d file(s) need attention\n" "$unexpected_fail_count"
    exit 1
elif (( warn_count > 0 )); then
    printf "${YELLOW}${BOLD}RESULT: FAIL${NC} — %d file(s) use deprecated syntax\n" "$warn_count"
    exit 1
elif (( unexpected_pass_count > 0 )); then
    printf "${YELLOW}${BOLD}RESULT: WARNING${NC} — %d expected-failure file(s) now pass, review the EXPECT_FAIL list\n" "$unexpected_pass_count"
    exit 0
else
    printf "${GREEN}${BOLD}RESULT: OK${NC} — all files behave as expected\n"
    exit 0
fi
