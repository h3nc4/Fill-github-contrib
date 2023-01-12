#!/bin/bash

# See README.md for instructions
source config.sh

# The total number of commits, leave it unchanged
TOTAL_COMMITS=0
# For better code readability, the START_DATE is duplicated into a new variable
CURRENT_DATE="$START_DATE"

function makeCommits() {
    ## Generate a random number as given by the user between the max and min number of commits per day
    RANDOM_NUMBER=$((RANDOM % (MAX_COMMITS_PER_DAY - MIN_COMMITS_PER_DAY + 1) + MIN_COMMITS_PER_DAY))
    ## Increment the total number of commits
    TOTAL_COMMITS=$((TOTAL_COMMITS + RANDOM_NUMBER))
    ## Print the date and the random number
    echo "$CURRENT_DATE - $RANDOM_NUMBER"
    ## Keep creating commits until the random number is 0
    while [[ "$RANDOM_NUMBER" -gt 0 ]]; do
        ## Create commit
        GIT_AUTHOR_DATE="$CURRENT_DATE 12:00:00" GIT_COMMITTER_DATE="$CURRENT_DATE 12:00:00" git commit --allow-empty -m "$COMMIT_MESSAGE"
        ## Decrement the random number
        ((RANDOM_NUMBER--))
    done
}

# Main function
function fillGithubContributions() {
    ## Loop through the dates
    while [[ ! "$CURRENT_DATE" > "$END_DATE" ]]; do
        ## Check if there will be no commits on that day and skip it if so
        [[ $((RANDOM % 100)) -gt $NO_COMMITS_CHANCE ]] && makeCommits || echo "$CURRENT_DATE - Skipped"
        ## Increment the date
        CURRENT_DATE=$(date -d "$CURRENT_DATE + 1 day" +"%Y-%m-%d")
    done
}

function askPush() {
    read -p "Do you want to push $TOTAL_COMMITS commits to the remote repository? (y/N) " answer
    [[ "$answer" == "y" ]] && git push origin $BRANCH_NAME
}

# If the user has provided an invalid path, warn him and exit
cd "$REPO_PATH" || exit 1

# If the user has not provided a branch name, get the current branch name
[[ -z "$BRANCH_NAME" ]] && BRANCH_NAME=$(git branch --show-current) && echo "No branch name provided, using $BRANCH_NAME" || echo "Using branch $BRANCH_NAME"

# If there is no branch at the given directory, exit
git checkout "$BRANCH_NAME" || exit 1
git pull origin "$BRANCH_NAME"

# Call the main function
fillGithubContributions

# If no commits were made, exit. Otherwise, ask the user if he wants to push the commits
[[ "$TOTAL_COMMITS" -eq 0 ]] && echo "No commits were made, exiting..." || askPush

# Exit successfully
exit 0
