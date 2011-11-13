function Test-Win64(){
    $Processor = Get-WmiObject Win32_Processor | where {$_.DeviceID -eq "CPU0"} | select AddressWidth
    return $Processor.AddressWidth -eq 64
}

function Get-ProgramFilesDir() {
  if (Test-Win64 -eq $true) {
    (Get-Item "Env:ProgramFiles(x86)").Value
  }
  else {
    (Get-Item "Env:ProgramFiles").Value
  }
}