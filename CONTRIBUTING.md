# docs.liquibase.io

Documentation for the liquibase website.

***Please send pull requests!***

Project Overview - How to apply changes to https://docs.liquibase.com
========================================================================

git clone https://github.com/Datical/liquibase-docs.git
1. git checkout staging
2. git branch [newBranchName] (to create a local branch)
3. git checkout [newBranchName]
4. Make some changes to the desired html file/s or/and create new html file/s
5. Open the modified html file/s on your browser to review the new changes
6. git add <file/s> or git add . (to add all)
7. git commit -m <message> (put a meaningful message that clearly explains the changes)
8. git push -u origin [newBranchName] - to create the remote branch
9. make a pull request  staging <-- [newBranchName]  and request a review. You do this using the github.com website UI.
10. When approved, the staging branch will be merged to master.
11. Your branch will be deleted.  In this example: git checkout master && git branch -D [newBranchName] && git branch -d [newBranchName] && git push

Where and how to find and modify the required html file from the url
====================================================================
The file system hierarchy in the https://github.com/Datical/liquibase-docs.git repository will store the html files with the same way they are presented in the https://docs.liquibase.com website.
For example: For the file residing in liquibase-docs/Content/commands/pro/rollbackonechangeset.html repository, the corresponding url would be: https://docs.liquibase.com/commands/pro/rollbackonechangeset.html
