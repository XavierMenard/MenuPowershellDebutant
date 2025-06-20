# activite_pipe.ps1
# Script PowerShell pour pratiquer l'utilisation du pipe (|)

Clear-Host

# Affichage du menu
Write-Host "======================================================================================"
Write-Host "      
 _____                                                                            _____ 
( ___ )                                                                          ( ___ )
 |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | 
 |   |  __  __                    ____                            _          _ _  |   | 
 |   | |  \/  | ___ _ __  _   _  |  _ \ _____      _____ _ __ ___| |__   ___| | | |   | 
 |   | | |\/| |/ _ \ '_ \| | | | | |_) / _ \ \ /\ / / _ \ '__/ __| '_ \ / _ \ | | |   | 
 |   | | |  | |  __/ | | | |_| | |  __/ (_) \ V  V /  __/ |  \__ \ | | |  __/ | | |   | 
 |   | |_|  |_|\___|_| |_|\__,_| |_|   \___/ \_/\_/ \___|_|  |___/_| |_|\___|_|_| |   | 
 |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| 
(_____)                                                                          (_____)
                    ╔═══════════════════════════════════════════╗
                    ║ ____         __  __           _           ║
                    ║| __ ) _   _  \ \/ /__ ___   _(_) ___ _ __ ║
                    ║|  _ \| | | |  \  // _` \ \ / / |/ _ \ '__| ║
                    ║| |_) | |_| |  /  \ (_| |\ V /| |  __/ |   ║
                    ║|____/ \__, | /_/\_\__,_| \_/ |_|\___|_|   ║
                    ║       |___/                               ║
                    ╚═══════════════════════════════════════════╝"
Write-Host "                                     2025/06/20" -ForegroundColor Green
Write-Host "======================================================================================"
Write-Host "1 - Afficher les 10 processus utilisant le plus de mémoire RAM"
Write-Host "2 - Afficher les services en cours dans une fenêtre interactive"
Write-Host "3 - Rechercher un processus par mot-clé (nom)"
Write-Host "4 - Lister les comptes d’utilisateurs locaux activés"
Write-Host "5 - Compter les processus en cours d’exécution"
Write-Host "6 - Afficher les 5 fichiers les plus récents du dossier Téléchargements"
Write-Host "0 - Quitter"
Write-Host "======================================================================================="

# Demander le choix de l'utilisateur
$choix = Read-Host "Entrez votre choix (0 à 6)"

# Réagir selon le choix
switch ($choix) {
    "1" {
        # Option 1 : processus triés par RAM
        Write-Host "`n>> 10 processus utilisant le plus de RAM:`n"
        Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 10 Name, Id, WorkingSet | Format-Table -AutoSize
    }

    "2" {
        # Option 2 : services en cours affichés dans une fenêtre
        Write-Host "`n>> Services en cours (affichés dans une fenêtre interactive)...`n"
        Get-Service | Where-Object { $_.Status -eq "Running" } | Out-GridView -Title "Services en cours d’exécution"
    }

    "3" {
        # Option 3 : filtre de processus par mot-clé
        $motCle = Read-Host "Entrez un mot-clé pour rechercher un processus"
        Write-Host "`n>> Processus contenant '$motCle' dans le nom :`n"
        Get-Process | Where-Object { $_.Name -like "*$motCle*" } | Select-Object Name, Id, CPU | Format-Table -AutoSize
    }

    "4" {
        # Option 4 : utilisateurs locaux activés
        Write-Host "`n>> Comptes d’utilisateurs locaux activés :`n"
        Get-LocalUser | Where-Object { $_.Enabled -eq $true } | Select-Object Name, Enabled | Format-Table -AutoSize
    }

    "5" {
        # Option 5 : nombre total de processus
        Write-Host "`n>> Nombre total de processus en cours d’exécution :`n"
        Get-Process | Measure-Object | Select-Object Count
    }

    "6" {
        # Option 6 : fichiers les plus récents dans Téléchargements
        $telechargements = "$env:USERPROFILE\Downloads"
        Write-Host "`n>> 5 fichiers les plus récents dans le dossier Téléchargements:`n"
        Get-ChildItem -Path $telechargements -File | Sort-Object LastWriteTime -Descending | Select-Object -First 5 Name, Length, LastWriteTime | Format-Table -AutoSize
    }

    "0" {
        # Option Quitter
        Write-Host "`nMerci d’avoir utilisé ce script. À bientôt !"
        Exit
    }

    Default {
        Write-Host "`nChoix invalide. Veuillez relancer le script et entrer un chiffre de 0 à 6."
    }
}