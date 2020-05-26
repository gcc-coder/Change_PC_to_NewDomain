rem //加域脚本
@echo off
mode con cols=85 lines=21&color 0B 
rem //判断64位系统和32位系统
if /i %PROCESSOR_IDENTIFIER:~0,3%==x86	(
    goto :x86	
) else 	(
    goto :x64	
)

:x64
if not exist "%windir%\system32\netdom.exe" copy "\\192.168.0.21\tools\IS\更改AD域相关\netdomx64\netdom.exe" "%windir%\system32" /y
if not exist "%windir%\system32\zh-CN\netdom.exe.mui" copy "\\192.168.0.21\tools\IS\更改AD域相关\netdomx64\netdom.exe.mui" "%windir%\system32\zh-CN\" /y 
if not exist "%windir%\system32\en-US\netdom.exe.mui" copy "\\192.168.0.21\tools\IS\更改AD域相关\netdomx64\netdom.exe.mui" "%windir%\system32\en-US\" /y
cls
rem //退出contoso域和加入tcent域
echo 正在退出contoso域...
netdom remove %computername% /domain:contoso.cn /userd:SCCM /passwordd:Superman.123
echo 正在加入tcent域...
netdom join %computername% /domain:tcent.cn /userd:addtest /passwordd:123qwe!@# 
cls
goto end

:x86
if not exist "%windir%\system32\netdom.exe" copy "\\192.168.0.21\tools\IS\更改AD域相关\netdomx86\netdom.exe" "%windir%\system32" /y
if not exist "%windir%\system32\zh-CN\netdom.exe.mui" copy "\\192.168.0.21\tools\IS\更改AD域相关\netdomx86\netdom.exe.mui" "%windir%\system32\zh-CN\" /y 
if not exist "%windir%\system32\en-US\netdom.exe.mui" copy "\\192.168.0.21\tools\IS\更改AD域相关\netdomx86\netdom.exe.mui" "%windir%\system32\en-US\" /y
cls
echo 正在退出contoso域...
netdom remove %computername% /domain:contoso.cn /userd:SCCM /passwordd:Superman.123
echo 正在加入tcent域...
netdom join %computername% /domain:tcent.cn /userd:addtest /passwordd:123qwe!@#
cls
goto end
:end
xcopy "\\192.168.0.21\tools\IS\更改AD域相关\NO.3.bat" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\" /c /q /y
cls
echo 操作完成，电脑将在15秒后重启。
echo 重启电脑后请，点击“切换用户”-“其他用户”，进行登录！
shutdown -r -t 15
pause >nul




