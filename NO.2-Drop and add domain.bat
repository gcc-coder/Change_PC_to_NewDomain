rem //����ű�
@echo off
mode con cols=85 lines=21&color 0B 
rem //�ж�64λϵͳ��32λϵͳ
if /i %PROCESSOR_IDENTIFIER:~0,3%==x86	(
    goto :x86	
) else 	(
    goto :x64	
)

:x64
if not exist "%windir%\system32\netdom.exe" copy "\\192.168.0.21\tools\IS\����AD�����\netdomx64\netdom.exe" "%windir%\system32" /y
if not exist "%windir%\system32\zh-CN\netdom.exe.mui" copy "\\192.168.0.21\tools\IS\����AD�����\netdomx64\netdom.exe.mui" "%windir%\system32\zh-CN\" /y 
if not exist "%windir%\system32\en-US\netdom.exe.mui" copy "\\192.168.0.21\tools\IS\����AD�����\netdomx64\netdom.exe.mui" "%windir%\system32\en-US\" /y
cls
rem //�˳�contoso��ͼ���tcent��
echo �����˳�contoso��...
netdom remove %computername% /domain:contoso.cn /userd:SCCM /passwordd:Superman.123
echo ���ڼ���tcent��...
netdom join %computername% /domain:tcent.cn /userd:addtest /passwordd:123qwe!@# 
cls
goto end

:x86
if not exist "%windir%\system32\netdom.exe" copy "\\192.168.0.21\tools\IS\����AD�����\netdomx86\netdom.exe" "%windir%\system32" /y
if not exist "%windir%\system32\zh-CN\netdom.exe.mui" copy "\\192.168.0.21\tools\IS\����AD�����\netdomx86\netdom.exe.mui" "%windir%\system32\zh-CN\" /y 
if not exist "%windir%\system32\en-US\netdom.exe.mui" copy "\\192.168.0.21\tools\IS\����AD�����\netdomx86\netdom.exe.mui" "%windir%\system32\en-US\" /y
cls
echo �����˳�contoso��...
netdom remove %computername% /domain:contoso.cn /userd:SCCM /passwordd:Superman.123
echo ���ڼ���tcent��...
netdom join %computername% /domain:tcent.cn /userd:addtest /passwordd:123qwe!@#
cls
goto end
:end
xcopy "\\192.168.0.21\tools\IS\����AD�����\NO.3.bat" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\" /c /q /y
cls
echo ������ɣ����Խ���15���������
echo �������Ժ��룬������л��û���-�������û��������е�¼��
shutdown -r -t 15
pause >nul




