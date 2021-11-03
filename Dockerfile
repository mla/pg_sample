FROM perl:5.28.3

WORKDIR /app

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=TRUE

RUN apt-get update \
  && apt-get install -y wget lsb-release \
  && /bin/bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && apt-get update \
  && apt-get install -y postgresql-client \
  && /usr/local/bin/cpanm DBI DBD::Pg

COPY . .

ENTRYPOINT ["/app/pg_sample"]
CMD ["--help"]
