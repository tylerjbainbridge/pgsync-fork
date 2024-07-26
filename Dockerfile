FROM ruby:3.1.6-alpine3.20

RUN apk add --update build-base libpq-dev postgresql-client && \
    gem install pgsync && \
    apk del build-base && \
    rm -rf /var/cache/apk/*

ARG WORKDIR=/code
RUN mkdir $WORKDIR
ADD ./ $WORKDIR/
WORKDIR $WORKDIR
RUN gem install pgsync
RUN echo Starting sync...

CMD runserver.sh