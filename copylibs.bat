attrib -r ..\include\cfl.h
copy cfl.h ..\include
attrib +r ..\include\cfl.h
if exist x86emdbg\*.lib copy x86emdbg\*.lib ..\lib
if exist x86emrel\*.lib copy x86emrel\*.lib ..\lib
if exist wmipsdbg\*.lib copy wmipsdbg\*.lib ..\lib
if exist wmipsrel\*.lib copy wmipsrel\*.lib ..\lib
if exist wcesh3dbg\*.lib copy wcesh3dbg\*.lib ..\lib
if exist wcesh3rel\*.lib copy wcesh3rel\*.lib ..\lib
if exist wcesh4dbg\*.lib copy wcesh4dbg\*.lib ..\lib
if exist wcesh4rel\*.lib copy wcesh4rel\*.lib ..\lib
if exist wcearmdbg\*.lib copy wcearmdbg\*.lib ..\lib
if exist wcearmrel\*.lib copy wcearmrel\*.lib ..\lib
if exist debug\*.lib copy debug\*.lib ..\lib
if exist release\*.lib copy release\*.lib ..\lib
