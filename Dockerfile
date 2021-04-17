FROM ruby:2.7.3-alpine

RUN apk update && \
    apk add \
    bash \
    build-base \
    nodejs \
    postgresql-dev \
    tzdata \
    graphviz

RUN mkdir /app
WORKDIR /app

COPY Gemfile* ./
RUN gem install bundler --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

COPY . .
