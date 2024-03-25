#!/bin/bash

# Check if the current branch is QA
current_branch=$(git rev-parse --abbrev-ref HEAD)
if [ "$current_branch" == "QA" ]; then
    # Get the latest tag version
    latest_tag=$(git describe --tags --abbrev=0)

    # Extract the version number from the latest tag
    latest_version=$(echo "$latest_tag" | grep -oP '(?<=0\.0\.)\d+')

    # Increment the version number
    next_version=$((latest_version + 1))

    # Create the new tag
    new_tag="V0.0.${next_version}_QA"
    git tag "$new_tag"

    # Push the new tag to the remote repository
    git push origin "$new_tag"

    echo "New tag created: $new_tag"
fi
