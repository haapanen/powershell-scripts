$uncrustifyPath = ''
$uncrustifyCfg = ''

function git-uncrustify-changed-files {
    $files = Invoke-Expression 'git diff --name-only --relative | Get-ChildItem'

    foreach ($file in $files) {
        Start-Process $uncrustifyPath -ArgumentList @('-c', $uncrustifyCfg, '--no-backup', $file.FullName) -Wait -NoNewWindow 
    }
}
