FROM ruby:2.6.6-alpine
EXPOSE 3000

RUN gem install bundler
RUN apk update && \
  apk add --no-cache \
    git \
    build-base \
    postgresql-dev \
    tzdata \
    yarn

ARG UID

RUN adduser -u $UID -h /home/teste-progresso/ -S teste-progresso

WORKDIR /home/teste-progresso

COPY --chown=$UID Gemfile* ./
RUN bundle install

COPY --chown=$UID . .

USER teste-progresso
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]