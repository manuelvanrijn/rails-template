FROM  ruby:2.3.8-slim

RUN apt-get update -qq && \
    apt-get install -qq -y --no-install-recommends nodejs \
    make \
    gcc \
    g++ \
    git \
    default-libmysqlclient-dev \
    openssh-client \
    imagemagick \
    file \
    ttf-freefont \
    gnupg \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    ruby-curb \
    netcat \
    tzdata \
    libproj-dev \
    proj-bin \
    && rm -rf /var/lib/apt/lists/*

# Set local timezone
RUN cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
    echo "Europe/Amsterdam" > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Install Yarn and NodeJS
ENV PATH=/root/.yarn/bin:$PATH
ADD https://dl.yarnpkg.com/debian/pubkey.gpg /tmp/yarn-pubkey.gpg
RUN apt-key add /tmp/yarn-pubkey.gpg && rm /tmp/yarn-pubkey.gpg
RUN echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -qq -y --no-install-recommends curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash && \
    apt-get install -qq -y --no-install-recommends yarn nodejs

ENV RAILS_ROOT=/usr/src/app \
    GEM_HOME=/bundle \
    BUNDLE_PATH=/bundle \
    PATH="/bundle/bin:${PATH}"

RUN gem update --system && \
    gem install bundler

WORKDIR $RAILS_ROOT

#Install bundle dependencies
COPY /Gemfile ./Gemfile
COPY /Gemfile.lock ./Gemfile.lock
RUN bundle config build.nokogiri nokogiri --with-xml2-include=/usr/include/libxml2   --use-system-libraries
RUN bundle install --jobs 3 --retry 3

#Install yarn dependencies
COPY package.json yarn.lock $RAILS_ROOT/
RUN yarn install

#Copy other sources
COPY . .

ENTRYPOINT ["./docker-entrypoint.sh"]
