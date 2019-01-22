FROM  ruby:2.5.0-slim

RUN apt-get update -qq && \
    apt-get install -qq -y --no-install-recommends make \
        git \
        gcc \
        g++ \
        libxml2 \
        libxslt-dev \
        libmariadb-dev \
        openssh-client \
        imagemagick \
        file \
        graphviz \
        ttf-freefont \
        curl \
        gnupg \
        netcat \
        tzdata && \
    cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
    echo "Europe/Amsterdam" > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Install Yarn
ENV PATH=/root/.yarn/bin:$PATH
ADD https://dl.yarnpkg.com/debian/pubkey.gpg /tmp/yarn-pubkey.gpg
RUN apt-key add /tmp/yarn-pubkey.gpg && rm /tmp/yarn-pubkey.gpg
RUN echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash && \
    apt-get install -qq -y --no-install-recommends yarn nodejs

ENV RAILS_ROOT=/usr/src/app \
    GEM_HOME=/bundle \
    BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    PATH="${BUNDLE_BIN}:${PATH}"

RUN gem update --system && \
    gem install bundler

WORKDIR $RAILS_ROOT

#Install bundle dependencies
COPY /Gemfile ./Gemfile
COPY /Gemfile.lock ./Gemfile.lock
RUN bundle install --jobs 10

#Install yarn dependencies
COPY package.json ./package.json
COPY yarn.lock ./yarn.lock
RUN yarn install

#Copy other sources
COPY . .
RUN ["chmod", "+x", "./wait-for-it.sh"]
RUN ["chmod", "+x", "./docker-entrypoint.sh"]

ENTRYPOINT ["./docker-entrypoint.sh"]
