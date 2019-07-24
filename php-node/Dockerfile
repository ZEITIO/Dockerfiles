FROM debian:stretch-slim
LABEL MAINTAINER="Marian Theisen <mt@zeit.io>"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    imagemagick \
    less \
    mysql-client \
    perceptualdiff \
    procps \
    ssh-client \
    sudo \
    unzip \
    git \
    && \
    curl -sL sury.gpg https://packages.sury.org/php/apt.gpg | apt-key add - && \
    curl -sL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://packages.sury.org/php/ stretch main" >/etc/apt/sources.list.d/sury.list && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" >/etc/apt/sources.list.d/yarn.list && \
    echo "deb https://deb.nodesource.com/node_10.x stretch main" >/etc/apt/sources.list.d/nodesource.list && \
    apt-get update -y && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        rsync \
        libapr1-dev \
        libaprutil1-dev \
        apache2 \
        supervisor \
        python-pip \
        python-setuptools \
        python-wheel \
        nodejs \
        yarn \
        php7.2-cli \
        php7.2-apcu \
        php7.2-mbstring \
        php7.2-curl \
        php7.2-gd \
        php7.2-imagick \
        php7.2-intl \
        php7.2-bcmath \
        php7.2-mysql \
        php7.2-xml \
        php7.2-zip \
        php7.2-ldap \
        php7.2-fpm \
        && \
    pip install supervisor-stdout && \
    rm -rf /etc/supervisor

COPY custom.ini /etc/php/7.2/mods-available/custom.ini
RUN phpenmod custom && \
    useradd docker --shell /bin/bash --create-home && \
    curl -sL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    chmod +x /usr/local/bin/composer && \
    mkdir -p /app && \
    chown -R docker /app

WORKDIR /home/docker/

ADD https://composer.github.io/snapshots.pub /home/docker/.composer/keys.dev.pub
ADD https://composer.github.io/releases.pub /home/docker/.composer/keys.tags.pub

# Cleanup to reduce image size
RUN apt-get clean && \
  apt-get --yes --quiet autoremove --purge && \
  rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
          /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
          /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

ENV APP_DIR=/app
COPY supervisord/ /etc/supervisor
COPY php-fpm/php-fpm.conf /etc/php/7.2/fpm/

USER docker

CMD ["/usr/bin/supervisord"]
