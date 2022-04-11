# Rapid_SW_team
Course project for Rapid Prototyping of Computer System for [Team Personal Devices - SW] (https://rapidprototyp-mak7891.slack.com/archives/C031VSUDHPU)
first attempt
| Team Member | Email |
| :---: | :---: |
| [@Zitan Chen](https://18-749fall2021.slack.com/archives/D02CPSL0UHG) | zitanchen@cmu.edu |
| [@Zhuoran Cheng](https://18-749fall2021.slack.com/archives/D02C979QJJ3) |zcheng3@andrew.cmu.edu|
| [@Xinyue Xie]
| [@Alexandra Poltorak]
| [@Yifan Wu]

## How to contribute on Jira

```shell
git clone {REPO_URL}

# Create a new branch
git checkout -b RPP-10-<branch-name>
# e.g.
# git checkout -b RPP-10-udpate-README'

# Addition Steps to connect to the remote repository:
# Push local branch to remote
git push origin new-branch-name
# Connect the branch to remote branch
git branch --set-upstream-to=origin/new-branch-name
# Check if the branch push succeeded
git branch -a

# Coding

# Commit changes to branch
git commit -m "JIRA_NO <Summary of commit>"
# e.g.
# git checkout -b "RPP-10 Add README.md"

# Push to the branch with your name
git push


# Pull request(PR)
# Title: [JIRA_NO] description
# e.g. title: [RPP-10] Add Zitan Chen to team members in README.md
# Content Format:
# Description: Summary what you've done in the PR
# Changelog: List the part you edit or change
# Fixes: List the bugs(if have) you change

# Wait for CI/CD. 
# Request for review after your code passes all the tests

# Resolve conflicts
# Modify your code if requested by reviewer
# Pull request again if all issues resolved

# Pull request is approved
# Merge your code to main branch
# Delete your branch
```

----
## Jira Part
- Labels Type
   1. `Bug`
   2. `Hard`
   3. `Medium`
   4. `Easy`
