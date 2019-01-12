@echo off

rem maker: Mr.pingan
rem you need setting the environment variable C:\masm32\bin

cls

echo --------------------------------------------------------
echo Welcome one touch install [33mMASM with Irvine[0m
echo.
echo [31m*************************WARNING**************************[0m
echo.
echo [31m1.Don't change your default postion or you will be failure[0m
echo.
echo [31m2.check your Antivirus software defense the masm[0m
echo.
echo [31m*************************WARNING**************************[0m
echo.
echo [32mand then You only need to click accept[0m

echo --------------------------------------------------------

start /wait install.exe

start /wait Irvine_7th_Edition.msi

copy C:\Irvine\Irvine32.inc "C:\masm32\include"
copy C:\Irvine\SmallWin.inc "C:\masm32\include"
copy C:\Irvine\VirtualKeys.inc "C:\masm32\include"
copy C:\Irvine\Irvine32.lib "C:\masm32\lib"

echo INSTALL FINISHED



