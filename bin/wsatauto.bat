@echo off

:home
set start=0
echo Windows �V�X�e���]���c�[�� for Windows 10,11 v1.1
echo.
echo 1:�v�����J�n
echo 2:�O��̌��ʂ�\��
echo 3:�I��
echo 4:�A���C�X�g�[��
:error
set /p start=""
if /i {%start%}=={1} (goto :hakaru)
if /i {%start%}=={2} (goto :hyozi)
if /i {%start%}=={3} (exit)
if /i {%start%}=={4} (goto :unins)
echo �G���[:1,2,3,4�̂����ꂩ����͂��Ă��������B
goto :error

:hakaru
winsat formal
echo �v������
goto :hyozi

:hyozi
echo ����
powershell Get-CimInstance Win32_WinSat
pause
cls
goto :home

:unins
set /p un="�A���C���X�g�[�����܂��B��낵���ł����H(y/n)"
if /i {%un%}=={y} (goto :stun)
if /i {%un%}=={yes} (goto :stun)
cls
goto :home

:stun
copy "C:\Program Files\WinSAT10CPL\uninstall.bat" %temp%
powershell start-process %temp%\uninstall.bat -Verb runas
