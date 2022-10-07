#############################################################
# Имя: PrintInExcel.ps1
# Язык: PoSH 1.0
# Описание: Управление приложением Microsoft Excel
#############################################################

#Создаем объект-приложение Microsoft Excel
$excel = New-Object -ComObject excel.Application

#Делаем окно Microsoft Excel видимым
$excel.Visible = $True

#Открываем новую рабочую книгу
$excel.Workbooks.add() > $null

#Устанавливаем нужную ширину колонок
$excel.Columns.Item(1).ColumnWidth = 40
$excel.Columns.Item(2).ColumnWidth = 40
$excel.Columns.Item(3).ColumnWidth = 40

#Печатаем в ячейках текст
$excel.Cells.Item(1,1).value="Фамилия"
$excel.Cells.Item(1,2).value="Имя"
$excel.Cells.Item(1,3).value="Телефон"
#Выделяем три ячейки
$excel.range("A1:C1").select()>$null

#Устанавливаем полужирный текст для выделенного диапазона
$excel.selection.font.bold=$True

#Печатаем в ячейках текст
$excel.Cells.Item(2,1).value="Иванов"
$excel.Cells.Item(2,2).value="Иван"
$excel.Cells.Item(2,3).value="5-555-3-55"
### Конец сценария ########################