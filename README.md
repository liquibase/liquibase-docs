# docs.liquibase.io

Documentation for the liquibase website.

***Please send pull requests!***

Project Overview - How to apply changes to https://docs.liquibase.com
========================================================================
Cloning the https://github.com/Datical/liquibase-docs.git repository.

In order to make changes and stage them locally, you will have to have a local copy of it on your machine.  To do so, first make sure you have GIT installed. Here https://git-scm.com/downloads are instructions on how to install git.
Once git is installed, go to the desired local directory where you want to copy the repository.
Open CMD or Git Bash from there, and type: 
git clone https://github.com/Datical/liquibase-docs.git
You should now have a local copy of the https://github.com/Datical/liquibase-docs.git repository on your machine.

By default, you are in the master branch.  This branch should be only accessed by the site admins.  The next step will be to create a new branch.
Create a branch
Creating a branch is an important step.  Git branches are effectively a pointer to a snapshot of your changes. When you want to add a new changes-no matter how big or how small—you spawn a new branch to encapsulate your changes. This makes it harder for unstable code to get merged into the main code base.
In this example we are going to create a branch called "newBranchName" this is just a placeholder, you can use any name, but it will be easier to track why changes are being made if branches are made to resolve Jira tickets.  In order to start working with git, from the root (should be liquibase-docs) directory open git tool (for example, git bash or tortoise git) and consider the following workflow:
1. git checkout staging
2. git branch [newBranchName] (to create a local branch)
3. git checkout [newBranchName]
4. Make some changes to the desired html file/s or/and create new html file/s
5. Open the modified html file/s on your browser to review the new changes
6. If things look good, you will want to first add the files changes to the git branch, then commit the changes, and finally push the changes to github
7. Check the status of your git repository to see what has changed: run git status
8. git add <file/s> or git add . (to add all)
9. git commit -m <message> (put a meaningful message that clearly explains the changes)
10. git push -u origin [newBranchName] - to create the remote branch
11. make a pull request  staging <-- [newBranchName]  and request a review. You do this using the github.com website UI.
12. You may need to make some changes, so do that on the same branch you have created.
13. git add <file/s> && git commit -m <message> && git push
14. Do a pull request re-review
15. If it is all good then the reviewer will merge the pull request and the staging branch will be updated.
16. Ask for another review on staging branch.
17. git checkout staging
18. git pull 
19. Make corrections if needed
20. git add <file/s> && git commit -m <message> && git push
21. Create a Pull Request
22. Request re-review.
23. When approved, the staging branch will be merged to master.
24. Delete your branch.  In this example: git checkout master && git branch -D [newBranchName] && git branch -d [newBranchName] && git push

Where and how to find and modify the required html file from the url
====================================================================
The file system hierarchy in the https://github.com/Datical/liquibase-docs.git repository will store the html files with the same way they are presented in the https://docs.liquibase.com website.
For example: For the file residing in liquibase-docs/Content/commands/pro/rollbackonechangeset.html repository, the corresponding url would be: https://docs.liquibase.com/commands/pro/rollbackonechangeset.html
