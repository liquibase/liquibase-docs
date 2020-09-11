Get-ChildItem "C:\Users\nmelny\Documents\My Projects\LiquibasePro\Output\nmelny\HTML5" *.html -recurse |
    Foreach-Object {
        $c = ($_ | Get-Content) 
        $c = $c -replace 'meta rel','link rel'
        [IO.File]::WriteAllText($_.FullName, ($c -join "`r`n"), System.Text.UTF8Encoding)
    }