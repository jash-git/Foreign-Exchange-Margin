chcp 65001
@echo off
:s

REM 这个命令用于在Windows操作系统中，输出当前时间的分钟、秒和毫秒部分。其中，“%time%”是一个系统环境变量，表示当前时间，格式为“HH:mm:ss.sss”，即时分秒毫秒。而“:~3”是一个字符串操作符，用于截取字符串的子串。具体来说，它从字符串的第3个位置开始，截取到字符串的末尾，即截取了分、秒和毫秒部分，去掉了小时部分。
REM 因此，执行这个命令时[%time:~3%]，会输出当前时间的分钟、秒和毫秒部分，格式为“mm:ss.sss”。
REM 因此，执行这个命令时[%time:~3,5%]，会输出当前时间的分秒部分，例如：14:27:35.50会输出27:35。注意，该命令输出的时间格式是以冒号分隔的。
REM 因此，执行这个命令时[%time:~3,2%]，会输出第3個字元（即分鐘的十位數）和第4個字元（即分鐘的個位數），並將它們合併成一個分鐘數字串。請注意，這個指令會依據系統設定的時間格式而有所不同，因此可能需要微調才能取得正確的分鐘數。
REM CMD(BAT)中 IF 判斷式要用 OR 運算 https://stackoverflow.com/questions/2143187/logical-operators-and-or-in-dos-batch

set res=F
if %time:~3,2%==03 set res=T
if %time:~3,2%==33 set res=T

if "%res%"=="T" (
cls
echo This time:%time%

REM 執行外部程式
start "" "C:\\Program Files\\MetaTrader 5\\terminal64.exe"

REM 等待10分鐘
timeout /t 600

REM 關閉程式
TASKKILL /F /IM terminal64.exe

goto s

) else (

cls

echo This time:%time:~0,-3%

ping /n 2 127.1>nul

goto s

)