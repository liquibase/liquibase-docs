Get-ChildItem "C:\Users\Datical\Documents\MadCap Flare Projects\LiquibasePro\Output\Datical\HTML5" *.html -recurse |
    Foreach-Object {
        $c = ($_ | Get-Content) 
        $c = $c -replace 'meta rel','link rel'
        [IO.File]::WriteAllText($_.FullName, ($c -join "`r`n"))
    }