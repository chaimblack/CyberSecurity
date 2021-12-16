<#
.SYNOPSIS
Converts from and to Base64.
 
.DESCRIPTION
Converts from and to Base64.

.PARAMETER Decode
Specifies to decode the base64 string. This is the default action.

.PARAMETER Encode
Specifies to encode the string to Base64.

.PARAMETER String
Specifies the data to decode or encode.

.PARAMETER InputFile
Specifies location of input text file.

.PARAMETER OutputFile
Specifies location of the output data. If not specified, will not save to file

.EXAMPLE
Convert-Base64Data -Decode -String 'dGVzdA=='
Conversts Base64 data into string.

.NOTES
Created on 12/15/2021 by Chaim Black
#>
function Convert-Base64Data {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [switch]$Decode,
        [Parameter()]
        [switch]$Encode,
        [Parameter(ValuefromPipeline=$True)]
        [string]$String,
        [Parameter()]
        [string]$InputFile,
        [Parameter()]
        [string]$OutputFile
    )
    begin {

        if (!($Encode)) { $Decode = $True }

        if ($InputFile) {
            $String = Get-Content -Path $InputFile
            if (!($String)) {Write-Host "Failed to import data" -ForegroundColor Red; Break}
        }
    }
    Process{
        if ($Decode) {        
            $decodedBytes = [System.Convert]::FromBase64String($String)
            $OutData      = [System.Text.Encoding]::Utf8.GetString($decodedBytes)
        }

        if ($Encode) {
            $encodedBytes = [System.Text.Encoding]::UTF8.GetBytes($String)
            $OutData      = [System.Convert]::ToBase64String($encodedBytes)
        }
    }
    End {
        if ($OutputFile) {
            if ($OutData) {
                $OutData | Out-File -FilePath $OutputFile
            }
        }
        Else { $OutData }
    }
}