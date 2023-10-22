#!/bin/bash

# Perintah untuk memeriksa apakah Docker sudah terinstal
if command -v docker &> /dev/null; then
    
  # Perintah untuk membuat Docker image dari Dockerfile
  docker build -t novi-adi/karsajobs-ui:latest .

  # Melihat daftar image di lokal
  docker images

  # Nama paket Docker yang akan digunakan di GitHub Packages
  DOCKER_PACKAGE="ghcr.io/novi-adi/novi-adi/karsajobs-ui:latest"

  # Mengubah nama image agar sesuai dengan format GitHub Packages
  docker tag novi-adi/karsajobs-ui:latest $DOCKER_PACKAGE

  # Login ke GitHub Packages dengan token personal access (PAT)
  echo $GHCR_PAT | docker login ghcr.io -u novi-adi --password-stdin

  # Mengunggah image ke GitHub Packages
  docker image push $DOCKER_PACKAGE

else
  echo "Docker is not installed. Please install Docker before running this script."
  exit 1
fi