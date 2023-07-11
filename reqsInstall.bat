@echo off

REM Chemin complet vers le fichier userDatabase
set "fichier=C:\Program Files (x86)\EVY\.usersDatabase.evy"

REM Definition des variables ( REPO GIT + DESTINATION )
set "url=https://github.com/EVY-2024/BundleFiles/archive/main.zip"
set "destination=C:\Program Files (x86)\EVY"

REM Telechargement du fichier zip depuis GitHub
echo Telechargement du fichier zip...
powershell -command "(New-Object System.Net.WebClient).DownloadFile('%url%', 'temp.zip')"

REM Desarchivage du fichier zip
echo Desarchivage du fichier zip...
powershell -command "Expand-Archive -Path 'temp.zip' -DestinationPath 'temp'"

REM Deplacement du dossier extrait dans Program Files
echo Deplacement du dossier extrait dans Program Files...
xcopy /E /Y "temp\BundleFiles-main\*" "%destination%\"

REM Nettoyage des fichiers temporaires
echo Nettoyage des fichiers temporaires...
del /F /Q "temp.zip"
rd /S /Q "temp"

REM Droits du fichier
set "droits=(A;OICI;FA;;;BA)(A;OICI;FA;;;SY)(A;OICI;FA;;;CO)(A;OICI;FA;;;WD)"

REM Modification des droits
icacls "%fichier%" /inheritance:r /grant:r "Everyone:(F)"

echo Les droits du fichier userDatabase.evy modifies.

echo Le script a termine son execution.

exit
