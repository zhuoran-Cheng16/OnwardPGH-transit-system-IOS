# Rapid_SW_team
Course project for Rapid Prototyping of Computer System for [Team Personal Devices - SW](https://rapidprototyp-mak7891.slack.com/archives/C031VSUDHPU)
first attempt
| Team Member | Email |
| :---: | :---: |  
| [@Zitan Chen](https://18-749fall2021.slack.com/archives/D02CPSL0UHG) | zitanchen@cmu.edu |
| [@Zhuoran Cheng](https://18-749fall2021.slack.com/archives/D02C979QJJ3) |zcheng3@andrew.cmu.edu|
| [@Xinyue Xie] | xinyuex@andrew.cmu.edu |
| [@Alexandra Poltorak] | apoltora@andrew.cmu.edu |
| [@Yifan Wu]

## Project Introduction 

###Main Page:<br> 

Get Permission            |  Home Page
:-------------------------:|:-------------------------:
![alt text](https://github.com/zhuoran-Cheng16/Rapid_SW_team/blob/main/IMG/home.png?raw=true) |  ![alt text](https://github.com/zhuoran-Cheng16/Rapid_SW_team/blob/main/IMG/home1.png?raw=true)


###Bus Page:<br>
Main page             |  Bus Route
:-------------------------:|:-------------------------:
![alt text](https://github.com/zhuoran-Cheng16/Rapid_SW_team/blob/main/IMG/bus.png?raw=true)  |  ![alt text](https://github.com/zhuoran-Cheng16/Rapid_SW_team/blob/main/IMG/bus1.png?raw=true)

###Ride Page:<br>
Main page             |  Feedback page
:-------------------------:|:-------------------------:
![alt text](https://github.com/zhuoran-Cheng16/Rapid_SW_team/blob/main/IMG/ride.png?raw=true)  |  ![alt text](https://github.com/zhuoran-Cheng16/Rapid_SW_team/blob/main/IMG/ride1.png?raw=true)

###Park Page:<br>
Main page             |  Parking Time page
:-------------------------:|:-------------------------:
![alt text](https://github.com/zhuoran-Cheng16/Rapid_SW_team/blob/main/IMG/park.png?raw=true)  |  ![alt text](https://github.com/zhuoran-Cheng16/Rapid_SW_team/blob/main/IMG/park1.png?raw=true)
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