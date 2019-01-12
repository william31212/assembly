@echo off

cls

type template > %1.asm
echo %1 Created
start %1.asm
