function Test-Win64(){
    $Processor = Get-WmiObject Win32_Processor | where {$_.DeviceID -eq "CPU0"} | select AddressWidth
    return $Processor.AddressWidth -eq 64
}