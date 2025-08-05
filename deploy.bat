@echo off
echo ---------------------------------------
echo 🚀 Déploiement du build Nuxt vers Django
echo ---------------------------------------

:: Étape 1 : Générer le build Nuxt en dehors du projet 
echo 🛠️  Lancement de la génération Nuxt...
cd main
call npm run generate
cd ..

:: Étape 2 : Définir les chemins
set "NUXT_BUILD=main\.output\public"
set "DJANGO_STATIC=cms\static\frontend"

:: Étape 3 : Supprimer l'ancien dossier frontend s'il existe
echo 🧹 Suppression de l'ancien dossier frontend...
if exist "%DJANGO_STATIC%" (
    rmdir /s /q "%DJANGO_STATIC%"
)

:: Étape 4 : Créer le dossier cible
mkdir "%DJANGO_STATIC%"

:: Étape 5 : Copier le nouveau build
echo 📁 Copie du build Nuxt...
xcopy "%NUXT_BUILD%\*" "%DJANGO_STATIC%\" /E /I /H /Y

echo ✅ Déploiement terminé avec succès !
pause
