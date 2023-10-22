#!/bin/bash

# Perintah untuk membuat Docker image dari Dockerfile
docker build -t novi-adi/karsajobs:latest .

# Melihat daftar image di lokal
docker images

# Nama paket Docker yang akan digunakan di GitHub Packages
DOCKER_PACKAGE="ghcr.io/novi-adi/novi-adi/karsajobs:latest"

# Mengubah nama image agar sesuai dengan format GitHub Packages
docker tag novi-adi/karsajobs:latest $DOCKER_PACKAGE

# Login ke GitHub Packages dengan token personal access (PAT)
echo $GHCR_PAT | docker login ghcr.io -u novi-adi --password-stdin

# Mengunggah image ke GitHub Packages
docker image push $DOCKER_PACKAGE