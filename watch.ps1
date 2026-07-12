$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = "./rave/"
$watcher.Filter = "*.*"
$watcher.IncludeSubdirectories = $true

cmake -S . -B .build -G Ninja
cmake --build .build --config=Debug

Write-Output "$(Get-Date -Format "HH:mm:ss") [Compiled]"

while ($true)
{
	$result = $watcher.WaitForChanged('Changed', 1000)
	if ($result.TimedOut)
	{
		continue
	}

	Clear-Host

    cmake -S . -B .build -G Ninja
    cmake --build .build --config=Debug
	Write-Output "$(Get-Date -Format "HH:mm:ss") [Compiled]"
}
