#!/usr/bin/env bash
# run_folder_tests.sh — Run all .mojo and .py files in a folder and report results.
#
# Usage:  bash .github/scripts/run_folder_tests.sh <folder_path>
#
# Exit codes:
#   0 — no unexpected failures
#   1 — at least one file that should pass actually failed

FOLDER="${1:?Usage: $0 <folder_path>}"

# ── Timeout setup ────────────────────────────────────────────────────
# coreutils is a pixi dependency, so `timeout` should be available
# in the activated pixi environment.
TIMEOUT_SEC=120
if command -v timeout &>/dev/null; then
    run_cmd() { timeout "$TIMEOUT_SEC" "$@" 2>&1; }
elif command -v gtimeout &>/dev/null; then
    run_cmd() { gtimeout "$TIMEOUT_SEC" "$@" 2>&1; }
else
    echo "::warning::timeout command not found; files with infinite loops may hang"
    run_cmd() { "$@" 2>&1; }
fi

# ── Expected failures ────────────────────────────────────────────────
# Files intentionally broken for tutorial / demo purposes.
EXPECT_FAIL=(
    # basic/copy
    "src/basic/copy/implicit_copy_between_variables_errors.mojo"
    "src/basic/copy/move_between_variables_errors.mojo"
    # basic/types
    "src/basic/types/incompatible_literal_type_and_annotation.mojo"
    "src/basic/types/integer_exercise_fix_operations.mojo"
    "src/basic/types/integer_operations_on_incompatible_types.mojo"
    # basic/control
    "src/basic/control/non_exhaustive_conditional.mojo"
    # basic/errors
    "src/basic/errors/unhandled_error.mojo"
    "src/basic/errors/raise_a_string.mojo"
    "src/basic/errors/unhandled_error_with_raises_keyword.mojo"
    # basic/variables
    "src/basic/variables/variable_creation_without_var_but_with_types.mojo"
    # basic/functions
    "src/basic/functions/keywords_deprecation.mojo"
    # basic/composite
    "src/basic/composite/list_iteration_before_mojo_v25d4.mojo"
    # advanced/references
    "src/advanced/references/transfer_ownership_via_reference.mojo"
    # advanced/ownership
    "src/advanced/ownership/transfer_value_and_use_again.mojo"
    "src/advanced/ownership/lifetime_owner_reference.mojo"
    # advanced/lifetimes
    "src/advanced/lifetimes/combined_lifetime_wrong.mojo"
)

# ── Skip list ────────────────────────────────────────────────────────
# Files that cannot run in automated CI:
#   - requires user input (stdin)
#   - infinite loop / never terminates
#   - package module (no main function)
#   - temporary / generated file
SKIP=(
    # basic/control — interactive or infinite loop
    "src/basic/control/value_not_converging.mojo"
    "src/basic/control/print_calendar.mojo"
    "src/basic/control/give_commands.mojo"
    "src/basic/control/give_commands_with_while.mojo"
    # basic/errors — requires stdin
    "src/basic/errors/propagate_errors.mojo"
    # basic/packages — module files (no main)
    "src/basic/packages/point_type/__init__.mojo"
    "src/basic/packages/point_type/point.mojo"
    # basic/py4mojo — temp file
    "src/basic/py4mojo/tempCodeRunnerFile.mojo"
    # advanced/lifetimes — interactive or long-running
    "src/advanced/lifetimes/combined_lifetime_string.mojo"
    "src/advanced/lifetimes/combined_lifetime.mojo"
    # advanced/parameterization — interactive
    "src/advanced/parameterization/print_sentences.mojo"
    "src/advanced/parameterization/print_sentences_argument.mojo"
    "src/advanced/parameterization/print_sentences_parameter.mojo"
    # advanced/simd — long-running benchmark
    "src/advanced/simd/simd_performance_benchmark.mojo"
)

# ── Helpers ──────────────────────────────────────────────────────────
in_list() {
    local needle="$1"; shift
    for item in "$@"; do
        [[ "$item" == "$needle" ]] && return 0
    done
    return 1
}

# ── Discover files ───────────────────────────────────────────────────
files=()
while IFS= read -r f; do
    files+=("$f")
done < <(find "$FOLDER" -type f \( -name '*.mojo' -o -name '*.py' \) | sort)

total=${#files[@]}
if (( total == 0 )); then
    echo "::warning::No .mojo or .py files found in $FOLDER"
    exit 0
fi

echo "========================================"
echo "  Testing folder: $FOLDER"
echo "  Files found:    $total"
echo "========================================"
echo

# ── Counters ─────────────────────────────────────────────────────────
pass=0
xfail=0
skip=0
fail=0
xpass=0

failed_files=()
xpass_files=()

# ── Run each file ────────────────────────────────────────────────────
index=0
for file in "${files[@]}"; do
    ((index++))
    progress="[$index/$total]"

    # Skip?
    if in_list "$file" "${SKIP[@]}"; then
        echo "$progress  SKIP     $file"
        ((skip++))
        continue
    fi

    # Expected failure?
    is_xfail=0
    in_list "$file" "${EXPECT_FAIL[@]}" && is_xfail=1

    # Run
    rc=0
    if [[ "$file" == *.mojo ]]; then
        output=$(run_cmd mojo run -D ASSERT=all "$file") || rc=$?
    elif [[ "$file" == *.py ]]; then
        output=$(run_cmd python "$file") || rc=$?
    else
        continue
    fi

    # Handle timeout (exit code 124)
    if (( rc == 124 )); then
        output="TIMEOUT: file did not complete within ${TIMEOUT_SEC}s"
    fi

    if (( rc == 0 )); then
        if (( is_xfail )); then
            echo "$progress  XPASS    $file  (expected to fail but passed)"
            xpass_files+=("$file")
            ((xpass++))
        else
            echo "$progress  PASS     $file"
            ((pass++))
        fi
    else
        if (( is_xfail )); then
            echo "$progress  XFAIL    $file"
            ((xfail++))
        else
            echo "$progress  FAIL     $file  (exit $rc)"
            echo "    --- last 6 lines of output ---"
            echo "$output" | tail -6 | sed 's/^/    /'
            echo "    ---"
            failed_files+=("$file")
            ((fail++))
        fi
    fi
done

# ── Summary ──────────────────────────────────────────────────────────
echo
echo "========================================"
echo "  Summary: $FOLDER"
echo "========================================"
printf "  %-22s %3d\n" "Passed:"             "$pass"
printf "  %-22s %3d\n" "Expected failures:"  "$xfail"
printf "  %-22s %3d\n" "Skipped:"            "$skip"
printf "  %-22s %3d\n" "Unexpected passes:"  "$xpass"
printf "  %-22s %3d\n" "Unexpected failures:" "$fail"
printf "  %-22s %3d\n" "Total:"              "$total"
echo "========================================"

# ── GitHub Actions annotations ───────────────────────────────────────
if (( ${#failed_files[@]} > 0 )); then
    echo
    for f in "${failed_files[@]}"; do
        echo "::error file=$f::$f failed unexpectedly"
    done
fi

if (( ${#xpass_files[@]} > 0 )); then
    echo
    for f in "${xpass_files[@]}"; do
        echo "::warning file=$f::$f was expected to fail but passed — review the EXPECT_FAIL list"
    done
fi

# ── Exit ─────────────────────────────────────────────────────────────
if (( fail > 0 )); then
    exit 1
fi
