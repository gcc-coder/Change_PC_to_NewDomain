rem //��ȡ���桢�ҵ��ĵ����ղؼ�·��������ı�
@echo off
mode con cols=85 lines=21&color 0B
if /i %USERDOMAIN%==contoso	(
    goto :contoso
) else 	(
    goto :tcent
)
cls

:contoso
echo ע�⣺�����л���tcent����ر������������еĳ����Լ�ɱ��������������������
pause >nul
rem //��ȡ��ǰ����λ��
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do Set desktop=%%j
rem //��ȡ��ǰ�ҵ��ĵ�λ��
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "personal"') do Set documents=%%j
rem //��ȡ��ǰ�ղؼ�λ��
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Favorites"') do Set Favorites=%%j
rem //��ȡ��ǰ����λ��
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}"') do Set Downloads=%%j
md d:\BackupPath
echo %desktop%,����>>D:\BackupPath\output.txt
echo %documents%,�ҵ��ĵ�>>D:\BackupPath\output.txt
echo %Favorites%,�ղؼ�>>D:\BackupPath\output.txt
echo %Downloads%,����>>D:\BackupPath\output.txt
echo ���ڴ��л����ߣ������ĵȴ���
\\192.168.0.21\tools\IS\����AD�����\NO.2CPAU.bat
exit

:tcent
echo ���ĵ�������tcent�������л����밴������˳���
pause >nul
exit