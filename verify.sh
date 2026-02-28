#!/usr/bin/env zsh
# verify.sh — Mojo Miji Tutorial Syntax Verification
#
# Runs all .mojo files under src/{start,move,basic,advanced} to check
# whether they still work with the current version of Mojo.
#
# Usage:  pixi run verify
#
# Exit code:
#   0  — no unexpected failures
#   1  — at least one file that should pass actually failed

setopt NO_ERR_EXIT  # don't exit on error

# ── Colours ──────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

# ── Timeout setup (portable) ────────────────────────────────────────
TIMEOUT_SEC=60
if (( $+commands[timeout] )); then
    run_mojo() { timeout "$TIMEOUT_SEC" mojo run -D ASSERT=all "$1" 2>&1 }
elif (( $+commands[gtimeout] )); then
    run_mojo() { gtimeout "$TIMEOUT_SEC" mojo run -D ASSERT=all "$1" 2>&1 }
else
    print -P "${YELLOW}Warning:${NC} 'timeout' command not found. Add files with infinite loops to SKIP list."
    run_mojo() { mojo run -D ASSERT=all "$1" 2>&1 }
fi

# ── Expected failures ────────────────────────────────────────────────
# Files that are *intentionally* broken (compilation or runtime errors)
# to demonstrate error scenarios in the tutorial.
typeset -A EXPECT_FAIL
EXPECT_FAIL=(
    [src/basic/copy/implicit_copy_between_variables_errors.mojo]=1
    [src/basic/copy/move_between_variables_errors.mojo]=1
    [src/basic/types/incompatible_literal_type_and_annotation.mojo]=1
    [src/basic/types/integer_exercise_fix_operations.mojo]=1
    [src/basic/types/integer_operations_on_incompatible_types.mojo]=1
    [src/basic/control/non_exhaustive_conditional.mojo]=1
    [src/basic/errors/unhandled_error.mojo]=1
    [src/basic/errors/raise_a_string.mojo]=1
    [src/basic/errors/unhandled_error_with_raises_keyword.mojo]=1
    [src/basic/variables/variable_creation_without_var_but_with_types.mojo]=1
    [src/basic/functions/keywords_deprecation.mojo]=1
    [src/basic/composite/list_iteration_before_mojo_v25d4.mojo]=1
    [src/advanced/ownership/transfer_ownership_via_reference.mojo]=1
    [src/advanced/ownership/transfer_value_and_use_again.mojo]=1
    [src/advanced/ownership/lifetime_owner_reference.mojo]=1
    [src/advanced/lifetimes/combined_lifetime_wrong.mojo]=1
)

# ── Skip list ────────────────────────────────────────────────────────
# Files that cannot be run in an automated (non-interactive) setting:
#   - uses input()        → hangs waiting for stdin
#   - infinite loop       → never terminates
#   - no main function    → package / module file
typeset -A SKIP
SKIP=(
    [src/basic/control/value_not_converging.mojo]=1
    [src/basic/control/print_calendar.mojo]=1
    [src/basic/control/give_commands.mojo]=1
    [src/basic/control/give_commands_with_while.mojo]=1
    [src/basic/errors/propagate_errors.mojo]=1
    [src/basic/packages/point_type/__init__.mojo]=1
    [src/basic/packages/point_type/point.mojo]=1
    [src/advanced/lifetimes/combined_lifetime_string.mojo]=1
    [src/advanced/lifetimes/combined_lifetime.mojo]=1
    [src/advanced/parameterization/print_sentences.mojo]=1
    [src/advanced/parameterization/print_sentences_argument.mojo]=1
    [src/advanced/parameterization/print_sentences_parameter.mojo]=1
    [src/advanced/simd/simd_performance_benchmark.mojo]=1
)

# ── Discover files ───────────────────────────────────────────────────
mojo_files=("${(@f)$(find ./src/start ./src/move ./src/basic ./src/advanced \
    -name '*.mojo' -type f | sort)}")
total=${#mojo_files[@]}

print -P "${BOLD}══════════════════════════════════════════${NC}"
print -P "${BOLD}  Mojo Miji — Tutorial Syntax Verification${NC}"
print -P "${BOLD}══════════════════════════════════════════${NC}"
print -P "  Files found:   ${total}"
print -P "  Mojo version:  $(mojo --version 2>&1 || echo 'unknown')"
print -P "  Timeout:       ${TIMEOUT_SEC}s per file"
print -P "${BOLD}══════════════════════════════════════════${NC}"
echo

# ── Counters ─────────────────────────────────────────────────────────
pass_count=0
expected_fail_ok_count=0
skip_count=0
unexpected_fail_count=0
unexpected_pass_count=0

typeset -a unexpected_failure_files=()
typeset -a unexpected_failure_outputs=()
typeset -a unexpected_pass_files=()

# ── Run each file ────────────────────────────────────────────────────
index=0
for file in "${mojo_files[@]}"; do
    ((index++))
    rel_path="${file#./}"
    progress="[${index}/${total}]"

    # --- Skip? ---
    if (( ${+SKIP[$rel_path]} )); then
        print -P "${DIM}${progress}${NC} ${CYAN}SKIP${NC}     ${rel_path}"
        ((skip_count++))
        continue
    fi

    is_expect_fail=0
    (( ${+EXPECT_FAIL[$rel_path]} )) && is_expect_fail=1

    # --- Run ---
    output=$(run_mojo "$file")
    exit_code=$?

    if [[ $exit_code -eq 0 ]]; then
        if (( is_expect_fail )); then
            print -P "${DIM}${progress}${NC} ${YELLOW}UNEXPECTED PASS${NC}  ${rel_path}"
            unexpected_pass_files+=("$rel_path")
            ((unexpected_pass_count++))
        else
            print -P "${DIM}${progress}${NC} ${GREEN}PASS${NC}     ${rel_path}"
            ((pass_count++))
        fi
    else
        if (( is_expect_fail )); then
            print -P "${DIM}${progress}${NC} ${BLUE}XFAIL${NC}    ${rel_path}"
            ((expected_fail_ok_count++))
        else
            print -P "${DIM}${progress}${NC} ${RED}FAIL${NC}     ${rel_path}  ${DIM}(exit ${exit_code})${NC}"
            unexpected_failure_files+=("$rel_path")
            unexpected_failure_outputs+=("$output")
            ((unexpected_fail_count++))
        fi
    fi
done

# ── Summary ──────────────────────────────────────────────────────────
echo
print -P "${BOLD}══════════════════════════════════════════${NC}"
print -P "${BOLD}  Summary${NC}"
print -P "${BOLD}══════════════════════════════════════════${NC}"
printf "  ${GREEN}%-22s %3d${NC}\n" "Passed:"            "$pass_count"
printf "  ${BLUE}%-22s %3d${NC}\n" "Expected failures:"  "$expected_fail_ok_count"
printf "  ${CYAN}%-22s %3d${NC}\n" "Skipped:"            "$skip_count"
printf "  ${YELLOW}%-22s %3d${NC}\n" "Unexpected passes:" "$unexpected_pass_count"
printf "  ${RED}%-22s %3d${NC}\n" "Unexpected failures:" "$unexpected_fail_count"
printf "  %-22s %3d\n"            "Total:"               "$total"
print -P "${BOLD}══════════════════════════════════════════${NC}"

# ── Details for unexpected failures ──────────────────────────────────
if (( ${#unexpected_failure_files[@]} > 0 )); then
    echo
    print -P "${RED}${BOLD}Unexpected failures (syntax may be outdated):${NC}"
    echo
    for i in {1..${#unexpected_failure_files[@]}}; do
        print -P "  ${RED}❌ ${unexpected_failure_files[$i]}${NC}"
        echo "${unexpected_failure_outputs[$i]}" | tail -6 | sed 's/^/     /'
        echo
    done
fi

if (( ${#unexpected_pass_files[@]} > 0 )); then
    echo
    print -P "${YELLOW}${BOLD}Unexpected passes (previously expected to fail — review needed):${NC}"
    echo
    for f in "${unexpected_pass_files[@]}"; do
        print -P "  ${YELLOW}⚠  ${f}${NC}"
    done
    echo
fi

# ── Exit code ────────────────────────────────────────────────────────
if (( unexpected_fail_count > 0 )); then
    print -P "${RED}${BOLD}RESULT: FAIL${NC} — ${unexpected_fail_count} file(s) need attention"
    exit 1
elif (( unexpected_pass_count > 0 )); then
    print -P "${YELLOW}${BOLD}RESULT: WARNING${NC} — ${unexpected_pass_count} expected-failure file(s) now pass, review the EXPECT_FAIL list"
    exit 0
else
    print -P "${GREEN}${BOLD}RESULT: OK${NC} — all files behave as expected"
    exit 0
fi
