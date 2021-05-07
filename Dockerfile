FROM perl:5.28.3

RUN cpan -i DBI DBD::Pg

RUN git clone https://github.com/mla/pg_sample

WORKDIR pg_sample

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
