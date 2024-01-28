@echo off
echo.
echo çÌèúÇµÇƒÇ¢Ç‹Ç∑
cd c:\program files
rd /s /q WinSAT10CPL
reg delete HKEY_CLASSES_ROOT\CLSID\{78F3955E-3B90-4184-BD14-5397C15F1EFC} /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{78F3955E-3B90-4184-BD14-5397C15F1EFC} /f
echo.
echo äÆóπÇµÇ‹ÇµÇΩ
pause