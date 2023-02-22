﻿<# События в аудит логах контроллеров доменов
Event ID — (Категория) — Описание
1) 675 или 4771
(Аудит событий входа в систему)
Событие 675/4771 на контроллере домена указывает на неудачную попытку войти через Kerberos на рабочей станции с доменной учетной записью. Обычно причиной этого является несоответствующий пароль, но код ошибки указывает, почему именно аутентификация была неудачной. Таблица кодов ошибок Kerberos приведена ниже.
2)4768 (Аудит событий входа в систему) - Событие 676/4768 логгируется для других типов неудачной аутентификации. Таблица кодов Kerberos приведена ниже.
3)4776 (Аудит событий входа в систему) - Событие 681/4776 на контроллере домена указывает на неудачную попытку входа в систему черезNTLM с доменной учетной записью.
Код ошибки указывает, почему именно аутентификация была неудачной.
4)4738 (Аудит управления учетными записями) - Событие 642/4738 указывает на изменения в указанной учетной записи, такие как сброс пароля или активация 
деактивированной до этого учетной записи. Описание события уточняется в соответствие с типом изменения.
5)4728; 4732; 4756 (Аудит управления учетными записями) - Все три события указывают на то, что указанный пользователь был добавлен в определенную группу. 
Обозначены Глобальная (Global), Локальная (Local) и Общая (Universal) соответственно для каждого ID.
6)4720 (Аудит управления учетными записями) - Была создана новая учетная запись пользователя
7)4740 (Аудит управления учетными записями) - Учетная запись указанного пользователя была заблокирована после нескольких попыток входа
8)1102 (Аудит системных событий) - Указанный пользователь очистил журнал безопасности #>
Get-EventLog -ComputerName rst-dc6 Security -InstanceId 4771, 675, 4740, 644, 4771 | Select-Object -Property EventID, TimeGenerated, @{e={$_.ReplacementStrings[0]}} | 
    Out-File -FilePath C:\Users\_sidorov\Desktop\EventLogAD.txt