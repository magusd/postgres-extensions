FROM postgres:15-bullseye

RUN apt-get update \
    && apt-get -y install postgresql-15-cron \
    && rm -rf /var/lib/apt/lists/*



COPY ./docker/initdb/custom-conf.sh /docker-entrypoint-initdb.d/custom-conf.sh
