FROM ruby:2.3

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        pkg-config \
        build-essential \
        nodejs \
        git \
        libxml2-dev \
        libxslt-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle -v
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
