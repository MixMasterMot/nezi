$folderPath = "C:\Users\Mot\Desktop\nezi\nezi\imgs"  # Change this to your target folder

# Get all files in the specified folder and subfolders
Get-ChildItem -Path $folderPath -Recurse -File | ForEach-Object {
    $fileName = $_.Name
    $filePath = $_.FullName
    
    # Check for files containing ".jpg.jpg" and rename them
    if ($fileName -match "\.jpg\.jpg") {
        $correctedFileName = $fileName -replace "\.jpg\.jpg", ".jpg"
        $correctedFilePath = Join-Path (Split-Path $filePath) $correctedFileName
        
        Rename-Item -Path $filePath -NewName $correctedFilePath -Force
        Write-Output "Fixed: $fileName -> $correctedFileName"
    }
}