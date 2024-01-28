@echo off
cd /d %~dp0

openfiles > NUL 2>&1
if NOT %ERRORLEVEL% EQU 0 goto USER_PROC

ver | find /i "Version 10.0." > nul
if %ERRORLEVEL% equ 0 GOTO :chkok
goto :OTHER

:chkok
echo Windows システム評価ツール for Windows 10,11 v1.1インストール
echo.

set /p start="インストールしますか？(y/n)"
if /i {%start%}=={y} (goto :stinst)
if /i {%start%}=={yes} (goto :stinst)
echo インストールはキャンセルされました。終了します
pause
exit

:stinst
mkdir "C:\Program Files\WinSAT10CPL"
copy bin\wsatauto.bat "C:\Program Files\WinSAT10CPL"
copy bin\uninstall.bat "C:\Program Files\WinSAT10CPL"
cd bin
reg import paf.reg
reg import paf2.reg

echo 完了しました。終了します
pause
exit

:other
echo このシステムはサポートしてません。インストールはキャンセルされました。終了します
pause
exit

:USER_PROC
powershell start-process %~nx0 -verb runas