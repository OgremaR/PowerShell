$ExcelObj = New-Object -comobject Excel.Application


$ExcelWorkBook = $ExcelObj.Workbooks.Add()
$ExcelWorkSheet = $ExcelWorkBook.Worksheets.Item(1)
$ExcelWorkSheet.Name = 'VPN'

$ExcelWorkSheet.Cells.Item(1,1) = 'DisplayName'
$ExcelWorkSheet.Cells.Item(1,2) = 'EmailAddress'
$ExcelWorkSheet.Cells.Item(1,3) = 'Description'
$ExcelWorkSheet.Columns.Item(1).ColumnWidth=25
$ExcelWorkSheet.Columns.Item(2).ColumnWidth=25
$ExcelWorkSheet.Columns.Item(3).ColumnWidth=25

#$test2 = get-aduser -Filter {ObjectClass -eq "user" -and Enabled -eq $true} -properties PasswordExpired, PasswordLastSet, PasswordNeverExpires
$test1 = Get-ADUser -SearchBase "OU=Щит,OU=Workers,DC=R1,DC=pak,DC=ru" -Filter * -Properties * | select Name,EmailAddress, DisplayName, Description, Enabled
$i=2
foreach ($t in $test1)
{



$ExcelWorkSheet.Columns.Item(1).Rows.Item($i) = $t.DisplayName
$ExcelWorkSheet.Columns.Item(2).Rows.Item($i) = $t.EmailAddress
$ExcelWorkSheet.Columns.Item(3).Rows.Item($i) = $t.Description
$ExcelWorkSheet.Columns.Item(4).Rows.Item($i) = $t.Enabled

$i++
}


$ExcelWorkBook.Saveas('C:\Temp\test23.xlsx')
$ExcelWorkBook.close($true)