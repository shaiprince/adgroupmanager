<#	
	.NOTES
	===========================================================================
	 Created with: 	Visual Studio Code
	 Created on:   	16/10/2020
	 Created by:   	Jin
	 Filename:     	jk-1CreateMultipleADGroups[InputFromCSV].ps1
	===========================================================================
	.DESCRIPTION
		A PowerShell script to manage creation of AD Security group and it's members
#>

Set-ExecutionPolicy unrestricted
Import-Module ActiveDirectory

#Import CSV 
$csv      = @() 
$csv      = Import-Csv -Path "$Home\AD Group management\1ADGroups.csv"
#$ADPath =  "OU=Security,OU=Students,OU=ART-Groups,OU=ART,OU=MQ-BusUnit-Res,DC=mqauth,DC=uni,DC=mq,DC=edu,DC=au"

#Loop through all items in the CSV and create groups in AD
ForEach ($item In $csv)
{ 
    Try 
    {

        $exists = Get-ADGroup $item.GroupName 
        Write-Host "Group $($item.GroupName) already exists! Group creation skipped!" -ForegroundColor Cyan
    }
    Catch
    {
        $CreateGroup = New-ADGroup -Name $item.GroupName -GroupScope $item.GroupType -Path $item.'GroupLocation '
        Write-Host "Group $($item.GroupName) created!" -ForegroundColor Magenta
    }
    
}

