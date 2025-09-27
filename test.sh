#!/bin/bash

# Run all Mojo files in the src directory to test
# whether they execute without errors
# particularly when there is a new release of Mojo

# Find all .mojo files in the src directory
mojo_files=($(find ./src -name "*.mojo" -type f | sort))

echo "Found ${#mojo_files[@]} Mojo files to run:"
echo

# Loop through each Mojo file and run it
for file in "${mojo_files[@]}"; do
    echo "=========================================="
    echo "Running: $file"
    echo "=========================================="
    pixi run mojo run -D ASSERT=all "$file"
    exit_code=$?
    
    if [ $exit_code -ne 0 ]; then
        echo "❌ Failed to run $file (exit code: $exit_code)"
    else
        echo "✅ Successfully ran $file"
    fi
    echo
done

echo "Finished running all Mojo files."