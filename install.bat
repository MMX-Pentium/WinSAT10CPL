@echo off
cd /d %~dp0

openfiles > NUL 2>&1
if NOT %ERRORLEVEL% EQU 0 goto USER_PROC

ver | find /i "Version 10.0." > nul
if %ERRORLEVEL% equ 0 GOTO :chkok
goto :OTHER

:chkok
echo Windows �V�X�e���]���c�[�� for Windows 10,11 v1.1�C���X�g�[��
echo.

set /p start="�C���X�g�[�����܂����H(y/n)"
if /i {%start%}=={y} (goto :stinst)
if /i {%start%}=={yes} (goto :stinst)
echo �C���X�g�[���̓L�����Z������܂����B�I�����܂�
pause
exit

:stinst
mkdir "C:\Program Files\WinSAT10CPL"
copy bin\wsatauto.bat "C:\Program Files\WinSAT10CPL"
copy bin\uninstall.bat "C:\Program Files\WinSAT10CPL"
cd bin
reg import paf.reg
reg import paf2.reg

echo �������܂����B�I�����܂�
pause
exit

:other
echo ���̃V�X�e���̓T�|�[�g���Ă܂���B�C���X�g�[���̓L�����Z������܂����B�I�����܂�
pause
exit

:USER_PROC
powershell start-process %~nx0 -verb runas