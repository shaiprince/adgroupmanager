﻿<#	
	.NOTES
	===========================================================================
	 Created with: 	Visual Studio Code
	 Created on:   	16/10/2020
	 Created by:   	Jin
	 Filename:     	jk-3Add-MultipleGlobalDomainLocalGroups[Input].ps1
	===========================================================================
	.DESCRIPTION
		A PowerShell script to manage creation of AD Security group and it's members
#>

$csvfile = Import-Csv -path "$Home\AD Group management\3InsertGlobalGroupToDomainLocalGroups.csv" -delimiter ';'


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