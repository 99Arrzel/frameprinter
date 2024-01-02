$BaseDir="https://raw.githubusercontent.com/hugomd/parrot.live/master/frames"
#$TmpDir = "C:\Temp\parrot_frames"
$TmpDir = "/tmp/parrot_frames"
# Create the temporary directory if it doesn't exist
if (-not (Test-Path $TmpDir)) {
    New-Item -ItemType Directory -Path $TmpDir | Out-Null
}
while ($true) {
    0..9 | ForEach-Object {
        $FrameFile = Join-Path $TmpDir "frame_$_.txt"
        # echo frame name
        if (-not (Test-Path $FrameFile)) {
            echo "Fetching parrot..."
            echo "$BaseDir/$_.txt"
            Invoke-WebRequest -URI "$BaseDir/$_.txt" -OutFile $FrameFile -UseBasicParsing -DisableKeepAlive | Out-Null

        } else{
            #clear
            clear
            Get-Content $FrameFile
            Start-Sleep -Milliseconds 100
        }

        
    }
}