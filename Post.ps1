#############################################################
# Имя: Post.ps1
# Язык: PoSH 5.1
# Описание: Формирование и отсылка сообщения по протоколу SMTP
#############################################################
#Задаем адрес отправителя
$sender = "sender@somedomain.com"
#Задаем адрес получателя
$recipient = "recipient@somedomain.com"
#Задаем имя сервера
$server = "SMTPServer"
#Определяем заголовок сообщения
$subject = "Сообщение от PowerShell"
#Формируем тело сообщения
$body = "Это сообщение создано сценарием PowerShell"
#Создаем экземпляр класса System.Net.Mail.MailMessage, соответствующий
#сообщению
$msg = New-Object System.Net.Mail.MailMessage $sender, $recipient,
$subject, $body
#Создаем экземпляр класса System.Net.Mail.SmtpClient, соответствующий
#клиенту SMTP для указанного сервера SMTP
$client = New-Object System.Net.Mail.SmtpClient $server
#Указываем имя и пароль для подключения к серверу SMTP
$client.Credentials = New-Object System.Net.NetworkCredential "popov-av",
"password"
#Отсылаем сообщение
$client.Send($msg)
### Конец сценария ########################