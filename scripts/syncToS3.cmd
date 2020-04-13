@ECHO OFF
SETLOCAL
:: Script to sync to S3 based on your branch.  The staging branch will sync to staging-docs.liquibase.org whereas
:: the Master branch will sync to docs.liquibase.org.
:: Script requires 1 argument: source folder

:: If no arguments are passed, show usage and exit
IF [%1]==[] GOTO usage

:: Check if the directory exists. By using the FOR syntax to convert the directiry name to an 8.3 name we can work around bugs in cmd shell with spaces.
FOR %%i IN (%1) DO IF NOT EXIST %%~si\NUL (
  ECHO The directory '%1' specified does not exist.
  GOTO usage  
)

:: Get the branch name and assign it to the variable called BRANCH
FOR /F "tokens=*" %%a in ('git rev-parse --symbolic-full-name --abbrev-ref HEAD') do SET BRANCH=%%a
echo Detected that current git branch is %BRANCH%

:: If the branch is staging, the site is staging-docs.liquibase.org
:: If the branch is master, the site is docs.liquibase.org
IF /I "%BRANCH%"=="staging" (
    SET SITE=s3://staging-docs.liquibase.org
) else (
  IF /I "%BRANCH%"=="master" (
      SET SITE=s3://docs.liquibase.org
  ) else (
    ECHO The current git branch is '%BRANCH%' and that is not master or staging. Not syncing. Switch to master or staging to sync to S3.
    goto usage
  )
)

:: call aws cli cmd to sync the specified folder to the s3 bucket
echo Syncing local directory '%1' with %SITE%
CALL aws s3 sync %1 %SITE% --delete
EXIT /B 0

:usage
ECHO Usage: %0 ^<folder_to_upload^>
EXIT /B 1