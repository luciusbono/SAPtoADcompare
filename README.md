SAPtoADcompare
==============

A script that dumps the entire Active Directory contents of a particular organization, filters for service accounts, admin accounts and test accounts, and exports to an XML file. Step one of a procedure to compare SAP and AD data for manual true-ups, but useful for just getting AD data on all employees in the directory. 

USAGE -- SAPtoADcompare [OPTIONAL: Path]

REQUIREMENTS: Powershell 2.0 or above (including in Windows 7 and Windows 8/8.1). Active Directory Users and Computers, or Remote Server Administration Tools

RSAT for Windows 8.1: http://www.microsoft.com/en-us/download/details.aspx?id=39296

RSAT for Windows 8: http://www.microsoft.com/en-us/download/details.aspx?id=28972

RSAT for Windows 7: http://www.microsoft.com/en-us/download/details.aspx?id=7887

This script was designed to output a specific set of users so that our Human Resources team could compare our AD data to the current master-data in SAP and ensure that everything was in sync. It is also useful for outputting all the users in a specific organization, although the filtering would need to be tuned to meet your specific needs. 