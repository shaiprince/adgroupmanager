# adgroupmanager
Active Directory Group Membership manager PowerShell

# RunADGroupManager.ps1 -- This is the menu for running each of the 

**************** AD Group Manager ****************
* 1: Press '1' to create a AD Global Security groups
* 2: Press '2' to add a member(s) to AD Global Security groups
* 3: Press '3' to remove a member(s) to AD Global Security groups
* 4: Press '4' to insert AD Global Security group to Domain Local group
* Q: Press 'Q' to quit.

**************** AD Group Manager ****************
Please make a selection: 


# jk-1CreateMultipleADGroups[InputFromCSV].ps1 -- this will create AD group with scope and will work for multiple group creation

NAME
     jk-1CreateMultipleADGroups[InputFromCSV].ps1

SYNOPSIS
     Creates one or more security group in Active Directory.

Description

-----------

Please ensure 1ADGroups.csv file is in below format 

GroupName	        GroupType	    GroupLocation
ART-G-SE-Example	Global          OU=Security,OU=Staff,OU=ART-Groups..

 

With above example,

ART-G-SE-Example will be created in OU=Security,OU=Staff,OU=ART-Groups.. with Global security scope



Have you edited 1ADGroups.csv with the needed groups to create?

Press (y) to continue running this script, else any other key to return: 



# jk-2Add-MultipleUsersToMultipleGroups[Input-CSV].ps1 -- this will add multiple users to multiple groups

NAME
     jk-2Add-MultipleUsersToMultipleGroups[Input-CSV].ps1

SYNOPSIS
     Add multiple users to multiple groups in Active Directory.

Description

-----------

Please ensure 2MembersToAdd.csv file is in below format 

Group	            Accountname
ART-G-SE-Example	OneID

 

With above example,

Adds the user accounts with OneID to the group ART-G-SE-Example.
`
Multiple addition of users to multiple groups can be achieved by addition of roms in the csv



Have you edited 2MembersToAdd.csv with the needed groups and users to add?

Press (y) to continue running this script, else any other key to return: 



# jk-3Remove-MultipleUsersToMultipleGroups[Input-CSV].ps1 -- this will remove multiple users from multiple groups

NAME
     jk-3Remove-MultipleUsersToMultipleGroups[Input-CSV].ps1

SYNOPSIS
     Remove multiple users to multiple groups in Active Directory.

Description

-----------

Please ensure 2MembersToAdd.csv file is in below format 

Group	            Accountname
ART-G-SE-Example	OneID

 

With above example,

Removes the user accounts with OneID to the group ART-G-SE-Example.
`
Multiple addition of users to multiple groups can be achieved by addition of roms in the csv



Have you edited 3MembersToRemove.csv with the needed groups and users to add?

Press (y) to continue running this script, else any other key to return: 



#  jk-4Add-MultipleGlobalToDomainLocalGroups[InputFromCSV].ps1 -- this will remove multiple groups from AD

NAME
     jk-4Add-MultipleGlobalToDomainLocalGroups[InputFromCSV].ps1

SYNOPSIS
     Nest Global groups to Domain Local groups in Active Directory.

Description

-----------

Please ensure 3InsertGlobalGroupToDomainLocalGroups.csv file is in below format

**When editing use text and source code editor such as Notepad++ or Sublime Text. Do not use MS-Excel for this

GlobalGroup;DomainLocalGroup
ART-G-SE-Name;ART-L-SE-Name1,ART-L-SE-Name2,etc

 

With above example,

ART-G-SE-Name global group will be nested to ART-L-SE-Name1, ..Name2, etc.

Each row in csv will accept one(1) global group to multiple domain local groups



Have you edited 4InsertGlobalGroupToDomainLocalGroups.csv with the needed groups to be nested to Domain Local groups?

Press (y) to continue running this script, else any other key to return: 
