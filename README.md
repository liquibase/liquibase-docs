# docs.liquibase.io

Documentation for the liquibase website.

***Please send pull requests!***

Project Overview - How to apply changes to https://docs.liquibase.com
========================================================================

1. **Clone/checkout docs.liquibase.com repository**
    1. git clone https://github.com/Datical/liquibase-docs.git
    2. git checkout staging
    3. git branch [newBranchName] (to create a local branch)
    4. git checkout [newBranchName]
2. **Make Desired Documentation Changes**
    1. Make some changes to the desired html file/s or/and create new html file/s
    2. Open the modified html file/s on your browser to review the new changes
3. **Commit Your Doc Changes**
    1. git add <file(s)> or git add . (to add all)
    2. git commit -m <message> (put a meaningful message that clearly explains the changes)
    3. git push -u origin [newBranchName] - to create the remote branch
4. **Create a Pull Request**
    1. Make a pull request to the **staging** branch <-- [newBranchName]  and request a review. You do this using the github.com website UI.
    2. Thank you for your submission!
5. **Await approval of your changes**
    1. When approved, the staging branch will be merged to master.
    2. Your branch will be deleted. In this example: git checkout master && git branch -D [newBranchName] && git branch -d [newBranchName] && git push
    3. Your changes will be visible on https://docs.liquibase.com
                                                         
Where and how to find and modify the required html file from the url
====================================================================

The file system hierarchy in the https://github.com/Datical/liquibase-docs.git repository mirrors the way they are presented in the https://docs.liquibase.com website.

For example: 
- For the file residing in **liquibase-docs/Content/commands/pro/rollbackonechangeset.html** repository
- the corresponding url would be: **https://docs.liquibase.com/commands/pro/rollbackonechangeset.html**
