
[string]$finput = Read-Host "Source extension" 
[string]$foutput = Read-Host "Output extension"
[string]$dsource = Read-Host "Source Directory"
[string]$dtarget = Read-Host "Target directory" #"C:\Users\Ferdinand Kamuzora\BBIH_LOGO_REVISED" 

"`t"

$all_files = $(Get-ChildItem -Path:$dsource\*.$finput -Recurse | % {$_.Name})
[int]$fcount = 0

foreach ($i in $all_files){
    
    $fname = $($i -split ".$finput")
    
    Write-Host "File no.: $($fcount+1) of $($all_files.Length)"
    Write-Host "Converting $dsource\$i to .$foutput"

    $start=Get-Date

    & "C:\Program Files\Inkscape\bin\inkscape" -p "$dsource\$i" -o "$dtarget\$fname.$foutput"
    
    

    if ( $? ) {
        $end=Get-Date
        Write-Host "`t$dtarget\$fname.$foutput SUCCESSFULLY CREATED in $($end-$start | %{$_.TotalSeconds}) seconds"
    }
    else {
        Write-Host "CONVERSION FAILED"
        break
    }
    "`n"
    $fcount+=1
}

