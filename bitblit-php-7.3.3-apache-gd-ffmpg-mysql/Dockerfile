FROM php:7.3.3-apache

MAINTAINER Chris Weiss
# See https://bitpress.io/simple-approach-using-docker-with-php/

WORKDIR /var/www/html

# Bring in GD (first so ffmpeg has image hooks)
RUN apt-get update && apt-get install -y \
       libfreetype6-dev \
       libjpeg62-turbo-dev \
       libpng-dev

# Bring in ffmpeg
RUN apt-get install -y wget nano git build-essential yasm pkg-config

# Compile and install ffmpeg from source
RUN git clone https://github.com/FFmpeg/FFmpeg /root/ffmpeg && \
    cd /root/ffmpeg && \
    ./configure --enable-nonfree --disable-shared --extra-cflags=-I/usr/local/include && \
    make -j8 && make install -j8

# In case anything is looking for it in the other place
RUN ln -s /usr/local/bin/ffmpeg /usr/bin/ffmpeg

# Bring in the mysql extensions
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Install php gd extensions
RUN docker-php-ext-install -j$(nproc) iconv
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

RUN a2enmod headers
RUN a2enmod rewrite

EXPOSE 80

RUN service apache2 restart
