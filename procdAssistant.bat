@echo off
setlocal ENABLEDELAYEDEXPANSION
echo Assistant created by sithsiri
echo Compiler made by procd
echo.
echo Before you begin, make sure that you are giving credit to the creators 
echo of the Scratch project that you are converting.
echo You are legally required to do this due to Scratch's ShareAlike licence.
echo When you continue, you are agreeing to the CreativeCommons ShareAlike 2.0 licence.
echo.
echo Press any key to agree...
pause >nul
cls
echo This is how to tell the compiler what to do.
echo We'll walk you through and help you along the way.
echo.
echo Examples:
echo.
echo When asked, "Name of .exe file output?", respond with:
echo test.exe
echo.
echo ('test' is the file name)
echo.
echo When asked, "What is your .sb2 file name?", respond with:
echo test.sb2
echo -OR-
echo 12345678
echo.
echo (again, 'test' is the file name)
echo.
echo Here's how to compile projects from the Scratch website:
echo.
echo You'll type:                         12345678
echo.
echo When url is scratch.mit.edu/projects/12345678
echo                                      ********
echo That's all you need to know.

pause

cls

echo Name/filepath of .exe file output? 
echo If it is outside of the procd file, you'll have to specify the file path.
echo (Don't forget to add .exe to the end)
set /p fileName=Name/filepath: 
set "exeFileName=%FileName%"

cls

echo What is your .sb2 file name?
echo If it is outside of the procd folder, you'll have to specify the file path.
echo If your project is on the Scratch website, type the numbers at the end of the URL. 
echo (Don't forget to add .sb2 to the end it it isn't on the Scratch site)
set /p sb2Name=Name/filepath (OR 12345678): 

cls

echo Okay. Let's make sure this is right.
echo When you continue, procd Compiler will make "!exeFileName!"
echo from the Scratch 2.0 project "!sb2Name!"
echo (without the quotation marks)
echo Make sure that your Scratch project ends in .sb2 (and it is written so)
echo and that you added .exe after your output file.
echo Also, make sure that this batch file is in the procd folder.
echo Compiler errors are okay unless it is a fatal error.
echo If you encounter a fatal error,
echo copy it and report to scratch.mit.edu/users/procd
echo.
echo Press any key to compile...
pause >nul

if %sb2Name:~-4%==.sb2 set scratchProject="%sb2Name%"
if NOT %sb2Name:~-4%==.sb2 set scratchProject=-p %sb2Name%

echo Converting !sb2Name! to !exeFileName!...
procd -o "!exeFileName!" !scratchProject!
if exist !exeFileName! start !exeFileName! echo Done. Opening your file
if not exist !exeFileName! echo The compiler encountered a fatal error...
echo Done.
pause
