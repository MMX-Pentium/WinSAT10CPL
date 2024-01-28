@echo off

:home
set start=0
echo Windows システム評価ツール for Windows 10,11 v1.1
echo.
echo 1:計測を開始
echo 2:前回の結果を表示
echo 3:終了
echo 4:アンイストール
:error
set /p start=""
if /i {%start%}=={1} (goto :hakaru)
if /i {%start%}=={2} (goto :hyozi)
if /i {%start%}=={3} (exit)
if /i {%start%}=={4} (goto :unins)
echo エラー:1,2,3,4のいずれかを入力してください。
goto :error

:hakaru
winsat formal
echo 計測完了
goto :hyozi

:hyozi
echo 結果
powershell Get-CimInstance Win32_WinSat
pause
cls
goto :home

:unins
set /p un="アンインストールします。よろしいですか？(y/n)"
if /i {%un%}=={y} (goto :stun)
if /i {%un%}=={yes} (goto :stun)
cls
goto :home

:stun
copy "C:\Program Files\WinSAT10CPL\uninstall.bat" %temp%
powershell start-process %temp%\uninstall.bat -Verb runas
