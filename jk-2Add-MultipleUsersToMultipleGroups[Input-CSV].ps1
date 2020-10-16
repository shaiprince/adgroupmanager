﻿<#	
	.NOTES
	===========================================================================
	 Created with: 	Visual Studio Code
	 Created on:   	16/10/2020
	 Created by:   	Jin
	 Organization: 	MQ Uni
	 Filename:     	jk-2Add-MultipleUsersToMultipleGroups[Input-CSV].ps1
	===========================================================================
	.DESCRIPTION
		A PowerShell script to manage creation of AD Security group and it's members
#>

Import-Module activedirectory
Set-ExecutionPolicy unrestricted
Import-Csv "$Home\AD Group management\2MembersToAdd.csv" | Group-Object Group | % {
    #Foreach Group, get ADUser object for users and add members
    $users = $_.Group | % { Get-ADUser $_.Accountname }
    Add-ADGroupMember -Identity $_.Name -Members $users -Verbose
}
