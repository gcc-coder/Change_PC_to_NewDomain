rem //创建快捷方式到桌面，并添加当前用户为本地管理员
@echo off
mode con cols=85 lines=21&color 0B 
if /i %USERDOMAIN%==tcent	(
    goto :tcent	
) else 	(
    goto :contoso	
)
:tcent
echo 正在添加原用户文件快捷方式
for /f "tokens=1,2 delims=," %%a in (D:\BackupPath\output.txt) do (
echo set WshShell = WScript.CreateObject^("WScript.Shell"^) >>D:\BackupPath\tmp.vbs
echo strDesktop = WshShell.SpecialFolders^("D:\BackupPath\"^) >>D:\BackupPath\tmp.vbs
echo set oShellLink = WshShell.CreateShortcut^(strDesktop ^& "D:\BackupPath\%%b.lnk"^) >>D:\BackupPath\tmp.vbs
echo oShellLink.TargetPath ="%%a" >>D:\BackupPath\tmp.vbs
echo oShellLink.WindowStyle ="1" >>D:\BackupPath\tmp.vbs
echo oShellLink.WorkingDirectory = strDesktop >>D:\BackupPath\tmp.vbs
echo oShellLink.Save >>D:\BackupPath\tmp.vbs
call D:\BackupPath\tmp.vbs

)
del /f /q D:\BackupPath\tmp.vbs
del /f /q D:\BackupPath\output.txt
robocopy D:\BackupPath\ %USERPROFILE%\desktop\原用户数据\ /E /NDL /NFL /NJH /NJS /R:0 /W:0
copy "\\192.168.0.21\tools\temp\lsrunase.exe"  %userprofile%
cls

rem 添加当前用户到administrators组
echo 正在添加本地管理员...
%userprofile%\lsrunase.exe /user:administrator /password:6FtjwfMM9P6L2w== /domain: /command:"net localgroup administrators %username% /add" /runpath:%userprofile%
if %errorlevel% equ 0 (echo "用户%username%已加入到本地管理员组") else （echo "用户%username%加入管理员组失败，请检查"）
shutdown -r -t 15

rem 添加erp为本地信任站点
echo 正在添加信任站点
@ reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\contoso.com\erp.corp"  /v "http" /d "1" /t REG_DWORD /f
cls
echo 切换完成，电脑将在15秒后再次重启，请耐心等待...
ping localhost -n 12 > nul
del %0
\\192.168.0.21\tools\IS\更改AD域相关\NO.4CPAU.bat
exit
:contoso
echo 当前登录的为contoso域账号，电脑将在10秒后注销，请点击“其他用户”登录
ping localhost -n 8 > nul
logoff



