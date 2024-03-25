#!/bin/bash

# Define the base version number
BASE_VERSION="0.0.1"

# Get the latest tag in the repository
latest_tag=$(git describe --tags --abbrev=0)

# Extract the version number from the latest tag
latest_version=$(echo "$latest_tag" | grep -oP '(?<=0\.0\.)\d+')

# Increment the version number
next_version=$((latest_version + 1))

# Create the new tag
new_tag="V.0.0.${next_version}_QA"
git tag "$new_tag"

# Push the new tag to remote repository
git push origin "$new_tag"

echo "New tag created: $new_tag"
