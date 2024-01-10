#!/bin/bash

# Author Info
AUTHOR_NAME="Your Name"
AUTHOR_EMAIL="your@email.com"

# Define commit messages and dates
COMMITS=(
  "2024-01-10T10:00:00|Initial project setup"
  "2024-01-15T14:20:00| Changed to my preferred region"
  "2024-01-20T09:10:00|written out the script"
  "2024-01-25T16:45:00|Fixed some error in the script"
  "2024-02-02T11:30:00|Bug fixes and cleanup"
)

# Set Git user
git config user.name "$AUTHOR_NAME"
git config user.email "$AUTHOR_EMAIL"

# Loop through commits
for ENTRY in "${COMMITS[@]}"; do
  IFS="|" read -r COMMIT_DATE COMMIT_MSG <<< "$ENTRY"

  echo "Creating commit: '$COMMIT_MSG' at $COMMIT_DATE"
  
  # Make sure at least one file is modified or touched for each commit
  echo "$COMMIT_MSG" >> commit_log.txt

  git add .
  GIT_AUTHOR_DATE="$COMMIT_DATE" GIT_COMMITTER_DATE="$COMMIT_DATE" \
  git commit -m "$COMMIT_MSG"
done

# Final push
git branch -M main
git push -u origin main
