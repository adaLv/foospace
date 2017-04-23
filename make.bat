@echo off
@if not exist "_build" mkdir "_build"
@if not exist "pdf" mkdir "pdf"
@if not exist "pdf\doorlock" mkdir "pdf\doorlock"
cd _build


    for %%f in (..\*.tex) do (
        pdflatex ..\%%~nf.tex
        move %%~nf.pdf ..\pdf
    )

    for %%f in (..\doorlock\*.tex) do (
        pdflatex ..\doorlock\%%~nf.tex
        move %%~nf.pdf ..\pdf\doorlock
    )

cd ..
pause