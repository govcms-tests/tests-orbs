#!/bin/sh
defined_patches=$(jq '.extra.patches | length' /app/composer.json)
number_patches_applied=$(cat /app/vendor/composer/installed.json | grep "patches_applied" | wc -l)
if [[ "$defined_patches" -ne "$number_patches_applied" ]]; then
	echo "The number of patches applied does not match the number defined in the composer.json file"
	exit 1
fi
echo "All patches were installed"
exit 0
