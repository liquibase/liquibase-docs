Get-ChildItem "C:\Users\CatherineMayFulton\Documents\My Projects\LiquibasePro\Output\CatherineMayFulton\HTML5" *.htm -recurse |
    Foreach-Object {
        # Note:
        #  * the use of -Encoding Utf8 to first try to read the file as UTF-8.
        #  * the use of -Raw to read the entire file as a *single string*.
        $c = Get-Content -Raw -Encoding Utf8 $_.FullName  

        # If the replacement char. is found in the content, the implication
        # is that the file is NOT UTF-8, so read it again *without -Encoding*,
        # which interprets the files as "ANSI" encoded (Windows-1251, in your case).
        if ($c.Contains([char] 0xfffd)) {
          $c = Get-Content -Raw $_.FullName  
        }
        
        $c = $c -replace 'meta rel','link rel'
        [IO.File]::WriteAllText($_.FullName, ($c -join "`r`n"))
    }