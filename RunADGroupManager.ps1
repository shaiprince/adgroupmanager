<#	
	.NOTES
	===========================================================================
	 Created with: 	Visual Studio Code
	 Created on:   	16/10/2020
	 Created by:   	Jin
	 Filename:     	RunADGroupManager.ps1
	===========================================================================
	.DESCRIPTION
		A PowerShell script to manage creation of AD Security group and it's members
#>

$ErrorActionPreference = "SilentlyContinue"
$SetLocationPath = "$Home\AD Group management"
$FolderPath = "$Home\AD Group management"

Import-Module ActiveDirectory

function Show-Menu
{
	param (
		[string]$Title = 'AD Group Manager'
	)
	cls
	Write-Host "**************** $Title ****************" -ForegroundColor Cyan
	
	Write-Host "* 1: Press '1' to create a AD Global Security groups" -ForegroundColor Yellow
	Write-Host "* 2: Press '2' to add a members to AD Global Security groups" -ForegroundColor Yellow
	Write-Host "* 3: Press '3' to insert AD Global Security group to Domain Local group" -ForegroundColor Yellow
	Write-Host "* Q: Press 'Q' to quit." -ForegroundColor Gray

    Write-Host "**************** $Title ****************" -ForegroundColor Cyan
}

do
{
     Show-Menu
     $Input = Read-Host "Please make a selection"
     switch ($Input)
	{
		'1'{
			#cls
			Write-Host "You chose option 1" -ForegroundColor Gray
            Write-Host "`nNAME" -ForegroundColor Green
            Write-Host "     jk-1CreateMultipleADGroups[InputFromCSV].ps1`n" -ForegroundColor Green
            Write-Host "SYNOPSIS" -ForegroundColor Green
            Write-Host "     Creates one or more security group in Active Directory.`n" -ForegroundColor Green
            Write-Host "Description`n" -ForegroundColor Green
            Write-Host "-----------`n" -ForegroundColor Green
            Write-Host "Please ensure 1ADGroups.csv file is in below format `n" -ForegroundColor Green
            Write-Host "GroupName	        GroupType	    GroupLocation" -ForegroundColor Green
            Write-Host "ART-G-SE-Example	Global          OU=Security,OU=Staff,OU=ART-Groups..`n`n" -NoNewline -ForegroundColor Green
            Write-Host " `n" -ForegroundColor Green
            Write-Host "With above example,`n" -ForegroundColor Green
            Write-Host "ART-G-SE-Example will be created in OU=Security,OU=Staff,OU=ART-Groups.. with Global security scope`n`n`n" -ForegroundColor Green
            $Input = Read-Host "Have you edited 1ADGroups.csv with the needed groups to create?`n
Press (y) to continue running this script, else any other key to return"
            switch ($Input)
                {
                    'y'{
                    Write-Host "You chose to continue" -ForegroundColor Gray
                    Write-Host "Run powershell script 1" -BackgroundColor DarkCyan -ForegroundColor Yellow
                    Set-Location $SetLocationPath
                    .\jk-1CreateMultipleADGroups[InputFromCSV].ps1
                }
            }
		}'2'{

			#cls
			Write-Host "You chose option 2" -ForegroundColor Gray
            Write-Host "`nNAME" -ForegroundColor Green
            Write-Host "     jk-2Add-MultipleUsersToMultipleGroups[Input-CSV].ps1`n" -ForegroundColor Green
            Write-Host "SYNOPSIS" -ForegroundColor Green
            Write-Host "     Add multiple users to multiple groups in Active Directory.`n" -ForegroundColor Green
            Write-Host "Description`n" -ForegroundColor Green
            Write-Host "-----------`n" -ForegroundColor Green
            Write-Host "Please ensure 2MembersToAdd.csv file is in below format `n" -ForegroundColor Green
            Write-Host "Group	            Accountname" -ForegroundColor Green
            Write-Host "ART-G-SE-Example	OneID`n`n" -NoNewline -ForegroundColor Green
            Write-Host " `n" -ForegroundColor Green
            Write-Host "With above example,`n" -ForegroundColor Green
            Write-Host "Adds the user accounts with OneID to the group ART-G-SE-Example.`n``
Multiple addition of users to multiple groups can be achieved by addition of roms in the csv`n`n`n" -ForegroundColor Green
            $Input = Read-Host "Have you edited 2MembersToAdd.csv with the needed groups and users to add?`n
Press (y) to continue running this script, else any other key to return"
            switch ($Input)
                {
                    'y'{
                    Write-Host "You chose to continue" -ForegroundColor Gray
                    Write-Host "Run powershell script 2" -BackgroundColor DarkCyan -ForegroundColor Yellow
                    Set-Location $SetLocationPath
                    .\jk-2Add-MultipleUsersToMultipleGroups[Input-CSV].ps1
                }
            }
		}'3'{
			#cls
			Write-Host "You chose option 3" -ForegroundColor Gray
            Write-Host "`nNAME" -ForegroundColor Green
            Write-Host "     jk-3Add-MultipleGlobalToDomainLocalGroups[InputFromCSV].ps1`n" -ForegroundColor Green
            Write-Host "SYNOPSIS" -ForegroundColor Green
            Write-Host "     Nest Global groups to Domain Local groups in Active Directory.`n" -ForegroundColor Green
            Write-Host "Description`n" -ForegroundColor Green
            Write-Host "-----------`n" -ForegroundColor Green
            Write-Host "Please ensure 3InsertGlobalGroupToDomainLocalGroups.csv file is in below format`n" -ForegroundColor Green
            Write-Host "GlobalGroup;DomainLocalGroup" -ForegroundColor Green
            Write-Host "ART-G-SE-Name;ART-L-SE-Name1,ART-L-SE-Name2,etc`n`n" -NoNewline -ForegroundColor Green
            Write-Host " `n" -ForegroundColor Green
            Write-Host "With above example,`n" -ForegroundColor Green
            Write-Host "ART-G-SE-Name global group will be nested to ART-L-SE-Name1, ..Name2, etc.`n`
Each row in csv will accept one(1) global group to multiple domain local groups`n`n`n" -ForegroundColor Green
            $Input = Read-Host "Have you edited 3InsertGlobalGroupToDomainLocalGroups.csv with the needed groups to be nested to Domain Local groups?`n
Press (y) to continue running this script, else any other key to return"
            switch ($Input)
                {
                    'y'{
                    Write-Host "You chose to continue" -ForegroundColor Gray
                    Write-Host "Run powershell script 3" -BackgroundColor DarkCyan -ForegroundColor Yellow
  			        Set-Location $SetLocationPath
                    .\jk-3Add-MultipleGlobalToDomainLocalGroups[InputFromCSV].ps1
                }
            }         	  	
		}'q'{
			return
		}
	}
pause
}
until ($Input -eq 'q')