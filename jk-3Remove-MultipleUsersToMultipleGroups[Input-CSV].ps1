<#
	.NOTES
	===========================================================================
	 Created with: 	PowerShell ISE
	 Created on:   	09/10/2020
	 Created by:   	Jin Kim
	 Filename:     	jk-3Remove-MultipleUsersToMultipleGroups[Input-CSV].ps1
	===========================================================================
	.DESCRIPTION
		A PowerShell script to manage creation of AD Security group and it's members
#>

Import-Module activedirectory
Import-Csv "$Home\AD Group management\3MembersToRemove.csv" | Group-Object Group | % {
    #Foreach Group, get ADUser object for users and add members
    $users = $_.Group | % { Get-ADUser $_.Accountname }
    Remove-ADGroupMember -Identity $_.Name -Members $users -Confirm:$false -Verbose
}