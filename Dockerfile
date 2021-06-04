FROM perl:5.28.3

WORKDIR /app

RUN apt-get update \
&& apt-get install -y wget lsb-release \
&& /bin/bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
&& wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
&& apt-get update \
&& apt-get install -y postgresql-client \
&& cpan -i DBI DBD::Pg
&& git clone https://github.com/ricardocasaca/pg_sample.git .

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]