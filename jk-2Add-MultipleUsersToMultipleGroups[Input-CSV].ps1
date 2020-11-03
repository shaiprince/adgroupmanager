<#	
	.NOTES
	===========================================================================
	 Created with: 	PowerShell ISE
	 Created on:   	09/10/2020
	 Created by:   	Jin
	 Filename:     	jk-2Add-MultipleUsersToMultipleGroups[Input-CSV].ps1
	===========================================================================
	.DESCRIPTION
		A PowerShell script to manage creation of AD Security group and it's members
#>

Import-Module activedirectory
Import-Csv "$Home\AD Group management\2MembersToAdd.csv" | Group-Object Group | % {
    #Foreach Group, get ADUser object for users and add members
    $users = $_.Group | % { Get-ADUser $_.Accountname }
    Add-ADGroupMember -Identity $_.Name -Members $users -Verbose
}
