rem //������ݷ�ʽ�����棬����ӵ�ǰ�û�Ϊ���ع���Ա
@echo off
mode con cols=85 lines=21&color 0B 
if /i %USERDOMAIN%==tcent	(
    goto :tcent	
) else 	(
    goto :contoso	
)
:tcent
echo �������ԭ�û��ļ���ݷ�ʽ
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
robocopy D:\BackupPath\ %USERPROFILE%\desktop\ԭ�û�����\ /E /NDL /NFL /NJH /NJS /R:0 /W:0
copy "\\192.168.0.21\tools\temp\lsrunase.exe"  %userprofile%
cls

rem ��ӵ�ǰ�û���administrators��
echo ������ӱ��ع���Ա...
%userprofile%\lsrunase.exe /user:administrator /password:6FtjwfMM9P6L2w== /domain: /command:"net localgroup administrators %username% /add" /runpath:%userprofile%
if %errorlevel% equ 0 (echo "�û�%username%�Ѽ��뵽���ع���Ա��") else ��echo "�û�%username%�������Ա��ʧ�ܣ�����"��
shutdown -r -t 15

rem ���erpΪ��������վ��
echo �����������վ��
@ reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\contoso.com\erp.corp"  /v "http" /d "1" /t REG_DWORD /f
cls
echo �л���ɣ����Խ���15����ٴ������������ĵȴ�...
ping localhost -n 12 > nul
del %0
\\192.168.0.21\tools\IS\����AD�����\NO.4CPAU.bat
exit
:contoso
echo ��ǰ��¼��Ϊcontoso���˺ţ����Խ���10���ע���������������û�����¼
ping localhost -n 8 > nul
logoff



