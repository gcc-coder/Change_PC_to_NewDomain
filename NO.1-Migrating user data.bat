rem //获取桌面、我的文档、收藏夹路径输出到文本
@echo off
mode con cols=85 lines=21&color 0B
if /i %USERDOMAIN%==contoso	(
    goto :contoso
) else 	(
    goto :tcent
)
cls

:contoso
echo 注意：即将切换到tcent域，请关闭其他正在运行的程序以及杀毒软件，按任意键继续！
pause >nul
rem //获取当前桌面位置
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do Set desktop=%%j
rem //获取当前我的文档位置
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "personal"') do Set documents=%%j
rem //获取当前收藏夹位置
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Favorites"') do Set Favorites=%%j
rem //获取当前下载位置
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}"') do Set Downloads=%%j
md d:\BackupPath
echo %desktop%,桌面>>D:\BackupPath\output.txt
echo %documents%,我的文档>>D:\BackupPath\output.txt
echo %Favorites%,收藏夹>>D:\BackupPath\output.txt
echo %Downloads%,下载>>D:\BackupPath\output.txt
echo 正在打开切换工具，请耐心等待！
\\192.168.0.21\tools\IS\更改AD域相关\NO.2CPAU.bat
exit

:tcent
echo 您的电脑已是tcent域，无需切换，请按任意键退出！
pause >nul
exit