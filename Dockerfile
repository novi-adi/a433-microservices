# Menggunakan image Node.js versi 14.21-alpine sebagai base image.
FROM node:14.21-alpine as builder

# Menentukan direktori kerja di dalam container sebagai /app.
WORKDIR /app

# Menyalin file package.json dan package-lock.json ke dalam direktori kerja.
COPY package*.json ./

# Mengonfigurasi npm untuk tidak memeriksa SSL agar dapat mengakses registry npm.
RUN npm config set strict-ssl false

# Menginstall dependencies yang dibutuhkan berdasarkan package.json.
RUN npm ci

# Menyalin semua file dengan ekstensi .js ke dalam direktori kerja.
COPY ./*.js ./

# Mengekspos port 3001 untuk aplikasi yang berjalan di dalam container.
EXPOSE 3001

# Menentukan perintah default yang akan dijalankan saat container berjalan.
CMD [ "node", "index.js" ]
