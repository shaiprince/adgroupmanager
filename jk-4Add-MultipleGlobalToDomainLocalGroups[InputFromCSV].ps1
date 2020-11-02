<#	
	.NOTES
	===========================================================================
	 Created with: 	PowerShell ISE
	 Created on:   	09/10/2020
	 Created by:   	Jin
	 Organization: 	MQ Uni
	 Filename:     	jk-3Add-MultipleGlobalDomainLocalGroups[Input].ps1
	===========================================================================
	.DESCRIPTION
		A PowerShell script to manage creation of AD Security group and it's members
#>

$csvfile = Import-Csv -path ".\4InsertGlobalGroupToDomainLocalGroups.csv" -delimiter ';'
Write-Host $csvfile

foreach ($item in $csvfile) {
    $GlobalGroup = $item.GlobalGroup
    $DomainLocalGroup = $item.DomainLocalGroup.split(',')

    foreach ($Group in $DomainLocalGroup) {
        $ListOfGroupMembers = Get-ADGroupMember -Identity $Group |
        Select-Object -ExpandProperty SamAccountGroup
        if ($ListOfGroupMembers -notcontains $GlobalGroup) {
        Add-ADGroupMember $Group -Members $GlobalGroup -Verbose
        }
    }
}