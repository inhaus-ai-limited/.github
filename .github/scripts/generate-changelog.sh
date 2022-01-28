#!/bin/bash

# This script generates a changelog based of git tags
# Usage:
# ./generate-changelog.sh

previous_tag=0
for current_tag in $(git tag --sort=-creatordate); do

    if [ "$previous_tag" != 0 ]; then
        tag_date=$(git log -1 --pretty=format:'%ad' --date=short ${previous_tag})
        printf "## ${previous_tag} (${tag_date})\n\n"
        git log ${current_tag}...${previous_tag} --pretty=format:"* %h %s [View](https://${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/commits/%H)%n%b" --reverse | grep -v Merge
        printf "\n"
    fi

    previous_tag=${current_tag}
done

exit 0
