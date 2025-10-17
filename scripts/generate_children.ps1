# Folder Synthea
$syntheaPath = "D:\MASTER\PRT_Vaccination tracking\PRT\synthea"

# Folder de output
$outputFolder = "$syntheaPath\output\fhir"

# Creează folderul output dacă nu există
if (-Not (Test-Path $outputFolder)) {
    New-Item -ItemType Directory -Path $outputFolder -Force
    Write-Host "Folder output creat: $outputFolder"
}

# Set parametrii pentru copii 0-18 ani și export FHIR
$patients = 50
$minAge = 0
$maxAge = 18

# Rulează Synthea cu parametri
Write-Host "Se rulează Synthea pentru $patients pacienți copii ($minAge-$maxAge ani)..."
& "$syntheaPath\run_synthea.bat" -p $patients -a $minAge -A $maxAge -f fhir -o $outputFolder

# Verifică dacă s-au creat fișiere
$files = Get-ChildItem -Path $outputFolder -Filter *.json

if ($files.Count -eq 0) {
    Write-Host "⚠️ Nu s-au generat fișiere în $outputFolder. Verificați Java și permisiunile folderului."
} else {
    Write-Host "✅ S-au generat $($files.Count) fișiere în $outputFolder"
    $files | ForEach-Object { Write-Host $_.FullName }
}
