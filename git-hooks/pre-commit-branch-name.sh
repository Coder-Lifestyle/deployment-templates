#!/bin/sh

local_branch="$(git rev-parse --abbrev-ref HEAD)"

valid_branch_regex="^(feature|epic|hotfix|poc|release)\/SE3-.+$"

message="There is something wrong with your branch name. Branch names in this project must adhere to this contract: $valid_branch_regex. Your commit will be rejected. You should rename your branch to a valid name and try again."

if ! (echo $local_branch | grep -Eq $valid_branch_regex)
then
    echo "$message"
    exit 1
fi
