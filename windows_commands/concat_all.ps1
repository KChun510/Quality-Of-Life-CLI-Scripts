param(
	[string]$dir_loc,
	[string]$out_file = ".\out_file.txt"
)

$currentDir = Get-Location
$path = Join-Path $currentDir $dir_loc

if(-not (Test-Path -Path $path -PathType Container)){
	Write-Host "Dir location not valid."
	exit 1 
}

Write-Host "Concating all files in: $dir_loc"

$files = Get-ChildItem -Path $path -File

foreach($file in $files){
	Write-Host $file
	Write-Host "Processing: $($file.FullName)"
	Add-Content -Path $out_file -Value "`n--- File: $($file.Name) ---" 
	Get-Content -Path $file.FullName | Add-Content -Path $out_file
}



