FROM ruby:2.7.3-alpine

ENV APP_PATH /backend/
ENV APP_USER backend
ENV APP_USER_HOME /home/backend
ENV BUNDLE_PATH $APP_USER_HOME
ENV GEM_HOME $APP_USER_HOME/bundle
ENV BUNDLE_BIN $GEM_HOME/bin
ENV RAILS_LOG_TO_STDOUT=true
ENV PATH $PATH:$BUNDLE_BIN
ENV TZ=America/Sao_Paulo

EXPOSE 3000

ARG UID

RUN : "${UID:?You must provide a UID argument when building this image.}"

RUN adduser -h $APP_USER_HOME -D -u ${UID} $APP_USER

WORKDIR $APP_PATH

COPY Gemfile* $APP_PATH

RUN apk update && \
  apk add --no-cache \
    git \
    build-base \
    postgresql-dev \
    tzdata \
    less \
    graphviz \
    shared-mime-info && \
  bundle config jobs $(nproc --all) && \
  bundle install && \
  chown -R $APP_USER:$APP_USER $APP_USER_HOME && \
  chown -R $APP_USER:$APP_USER $APP_PATH && \
  rm -r /var/cache/apk/*

COPY --chown=backend . $APP_PATH

USER $APP_USER
