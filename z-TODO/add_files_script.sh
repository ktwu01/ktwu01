#!/bin/bash

# Script to add TODO.md and archive.md to all subfolders
# touch command will only create files if they don't exist

echo "Adding TODO.md and archive.md to all subfolders..."

# Find all directories (excluding hidden directories and current directory)
# Use find with -mindepth 1 to exclude current directory
# Use -maxdepth 1 to only process immediate subdirectories
find . -mindepth 1 -maxdepth 1 -type d ! -name ".*" | while read -r dir; do
    echo "Processing directory: $dir"
    
    # Create TODO.md if it doesn't exist
    if [ ! -f "$dir/TODO.md" ]; then
        touch "$dir/TODO.md"
        echo "  ✓ Created TODO.md"
    else
        echo "  - TODO.md already exists"
    fi
    
    # Create archive.md if it doesn't exist
    if [ ! -f "$dir/archive.md" ]; then
        touch "$dir/archive.md"
        echo "  ✓ Created archive.md"
    else
        echo "  - archive.md already exists"
    fi
    
    echo ""
done

echo "Done! All subfolders now have TODO.md and archive.md files."