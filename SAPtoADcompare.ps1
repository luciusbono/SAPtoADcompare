��param($path = [Environment]::GetFolderPath("Desktop")+'\'+'AllADUsers-'+(Get-Date -format M-d-yyyy)+'.csv')



$(function AllValidUsers

{

$allusers = (Get-ADUser -Filter {samaccountname -notlike '*admin*' -and samaccountname -notlike 'sa-*' -and samaccountname -notlike '*test*' -and EmployeeType -like '*'} -Properties 	employeeID, GivenName, Surname, Middlename, Department, Division, Employeetype,

			manager, extensionAttribute1, extensionAttribute2, extensionAttribute3, extensionAttribute4, 

			extensionAttribute5, title, l, st, postalcode, co, company, streetAddress, samaccountname, mail, 

			telephoneNumber, enabled |? {$_.employeeID -match '^[0-9]'})

return $allusers

}



$allDolbyUsers = AllValidUsers 



Foreach ($item in $allDolbyUsers){



	Add-Member -input $item NoteProperty 'Manager Name' 'None' -Force

	

	if ($item.manager){

	

	$item.'Manager Name' = ((Get-ADUser $item.manager).GivenName + ' ' + (Get-ADUser $item.Manager).Surname)

	}



$item | select employeeID, GivenName, Surname, Middlename, Department, Division, Employeetype,

			'Manager Name', extensionAttribute1, extensionAttribute2, extensionAttribute3, extensionAttribute4, 

			extensionAttribute5, title, l, st, postalcode, co, company, streetAddress, samaccountname, mail, 

			telephoneNumber, enabled

					

}) | Export-Csv $path -NoTypeInformation



If (Test-Path $path) { Write-Host -NoNewline `n"Export of all AD users exported to the following file:" `n `n $path `n `n}
