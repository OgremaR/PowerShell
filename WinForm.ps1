#############################################################
# Имя: WinForm.ps1
# Язык: PoSH 1.0
# Описание: Создание графической формы из сценария PowerShell
#############################################################
#Загружаем сборку System.Windows.Forms
[void][System.Reflection.Assembly]::LoadWithPartialName(
"System.Windows.Forms")
#Создаем главную форму - объект Windows.Forms.Form
$form = New-Object Windows.Forms.Form
#Заполняем заголовок формы
$form.Text = "Первая форма"
#Создаем объект-кнопку
$button = New-Object Windows.Forms.Button
#Задаем текст кнопки
$button.Text = "Нажми!"
#Определяем расположение кнопки
$button.Dock = "fill"
#Определяем обработчик нажатия кнопки
$button.Add_Click({$form.Close()})
#Добавляем кнопку на форму
$form.Controls.Add($button)
#Определяем обработчик события Shown для активизации формы
$form.Add_Shown({$form.Activate()})
#Выводим кнопку на экран
$form.ShowDialog()
### Конец сценария ########################