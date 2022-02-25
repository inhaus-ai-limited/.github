#!/bin/bash

# This script generates a changelog based of git tags
# Usage:
# ./generate-changelog.sh

previous_tag=0
index=0
for current_tag in $(git tag --sort=-creatordate -l); do

    if [ "$index" -ge "20" ]; then
        exit 0
    fi

    if [ "$previous_tag" != 0 ]; then
        tag_date=$(git log -1 --pretty=format:'%ad' --date=short ${previous_tag})
        printf "## ${previous_tag} (${tag_date})\n"
        git log ${current_tag}...${previous_tag} --pretty=format:"* [%h (%an) %s](${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/commits/%H)" --reverse | grep -v Merge
        printf "\n"
    fi

    previous_tag=${current_tag}
    let "index++"
done

exit 0
