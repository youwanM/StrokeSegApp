# Télécharge un fichier depuis une URL vers une destination, avec vérification optionnelle du SHA256.
#
# Arguments (passés via -D) :
#   URL         : L'URL du fichier à télécharger.
#   DESTINATION : Le chemin où sauvegarder le fichier.
#   SHA256      : (Optionnel) La valeur SHA256 attendue pour le fichier.

# Vérification des arguments obligatoires
if(NOT URL OR NOT DESTINATION)
    message(FATAL_ERROR "URL and DESTINATION are mandatory arguments.")
endif()

message(STATUS "Downloading file from ${URL} to ${DESTINATION}...")

# Construction de la liste des arguments pour la commande file(DOWNLOAD)
set(DOWNLOAD_ARGS ${URL} ${DESTINATION} STATUS status LOG log)

# Ajout de l'argument de vérification de hachage si le SHA256 est fourni
if(SHA256)
    message(STATUS "Using EXPECTED_HASH for SHA256 verification...")
    list(APPEND DOWNLOAD_ARGS EXPECTED_HASH SHA256=${SHA256})
endif()

# Exécution de la commande de téléchargement avec les arguments construits dynamiquement
file(DOWNLOAD ${DOWNLOAD_ARGS})

# Vérification du succès du téléchargement
if(NOT status)
    message(FATAL_ERROR "Download failed with status: ${status} and log: ${log}")
endif()

message(STATUS "File downloaded successfully.")
