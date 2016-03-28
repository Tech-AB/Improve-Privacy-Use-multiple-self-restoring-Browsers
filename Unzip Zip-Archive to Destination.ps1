param(
  [string]$zippath,
  [string]$targetdir
)

# Stop old Firefox Processes

$ProcessActiveFirefox1 = Get-Process firefox -ErrorAction SilentlyContinue
$ProcessActiveFirefox2 = Get-Process Firefox -ErrorAction SilentlyContinue
$ProcessActiveLauncher = Get-Process Launcher -ErrorAction SilentlyContinue

if($ProcessActiveFirefox1 -eq $null){}
else
{
Stop-Process -processname firefox
}

if($ProcessActiveFirefox2 -eq $null){}
else
{
Stop-Process -processname Firefox
}

if($ProcessActiveLauncher -eq $null){}
else
{
Stop-Process -processname Launcher
}

# Remove Old-TargetFolder
if((Test-Path -Path $targetdir )){
   Remove-Item -Recurse -Force $targetdir
}

# Function that Unzips the Zip-Archive

function Expand-ZIPFile($file, $destination)
{
    $files = (Get-ChildItem $file).FullName

    $shell = new-object -com shell.application

    $files | %{
        $zip = $shell.NameSpace($_)

        foreach ($item in $zip.items()) {
           $shell.Namespace($destination).copyhere($item)
        }
    }
}

# Test if the TargetFolder exists -> If not create it
# After that expand the Zip File via the Expand-ZipFile Function

if(!(Test-Path -Path $targetdir )){
    New-Item -ItemType directory -Path $targetdir
    Expand-ZIPFile –File $zippath –Destination $targetdir 
}