$BaseDir = "https://raw.githubusercontent.com/hugomd/parrot.live/master/frames/"
$TmpDir = "C:\Temp\parrot_frames"

# Create the temporary directory if it doesn't exist
if (-not (Test-Path $TmpDir)) {
    New-Item -ItemType Directory -Path $TmpDir | Out-Null
}

while ($true) {
    0..9 | ForEach-Object {
        $FrameFile = Join-Path $TmpDir "frame_$_.txt"

        if (-not (Test-Path $FrameFile)) {
            Invoke-WebRequest -Uri "$BaseDir$_" -OutFile $FrameFile -UseBasicParsing -DisableKeepAlive | Out-Null
        }

        Get-Content $FrameFile
        Start-Sleep -Milliseconds 100
    }
}