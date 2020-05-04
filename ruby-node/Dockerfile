ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}

ARG NODE_VERSION
RUN \
  echo 'APT::Install-Recommends "0";' >>/etc/apt/apt.conf && \
  echo 'APT::Install-Suggests "0";' >>/etc/apt/apt.conf && \
  curl -sL "https://deb.nodesource.com/setup_${NODE_VERSION}.x" | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && \
  apt-get -y --no-install-recommends --no-install-suggests install \
  curl \
  libjemalloc-dev \
  libjemalloc2 \
  libxml2-dev \
  libxslt-dev \
  postgresql-server-dev-all \
  git \
  bash \
  nodejs \
  yarn && \
  rm -rf /var/lib/apt/lists/*

ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.2

RUN mkdir -p /app && \
    useradd -m -G www-data app && \
    chown -R app:www-data /app

WORKDIR /app
USER app
