#activite_pipe.ps1
Script PowerShell interactif pour pratiquer l’utilisation des pipes (|) et manipuler des données système sous Windows.

Description
Ce script propose un menu utilisateur permettant d’exécuter plusieurs commandes PowerShell courantes, illustrant l’usage du pipeline pour :

Afficher les processus les plus gourmands en mémoire RAM

Lister les services en cours dans une interface graphique

Rechercher un processus par mot-clé

Lister les comptes utilisateurs locaux activés

Compter le nombre total de processus en cours

Afficher les fichiers les plus récents dans le dossier Téléchargements

Le script utilise les cmdlets natives de PowerShell et met en pratique la manipulation d’objets, le tri, la sélection et le filtrage via le pipeline.

Usage
Ouvrir PowerShell avec les droits nécessaires.

Placer le script activite_pipe.ps1 dans un dossier de votre choix.

Lancer le script :

powershell
Copier
Modifier
.\activite_pipe.ps1
Sélectionner une option dans le menu en entrant un chiffre de 0 à 6.

Suivre les instructions à l’écran pour chaque option.

Options disponibles
Choix	Description
1	Affiche les 10 processus utilisant le plus de mémoire RAM
2	Affiche les services en cours dans une fenêtre interactive
3	Recherche un processus par mot-clé dans le nom
4	Liste les comptes utilisateurs locaux activés
5	Compte le nombre total de processus en cours d’exécution
6	Affiche les 5 fichiers les plus récents du dossier Téléchargements
0	Quitte le script

Pré-requis
PowerShell (Windows PowerShell ou PowerShell Core)

Exécution des scripts autorisée (Set-ExecutionPolicy adapté)

Module Microsoft.PowerShell.LocalAccounts (généralement inclus sous Windows 10+)

Auteur
Créé par Xavier Ménard — 2025/06/20

Licence
À adapter selon ta préférence (exemple : MIT License)
