FROM ubuntu:18.04
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN apt-get update && apt-get install build-essential libmoose-perl liburi-perl libmoosex-getopt-perl libsocket6-perl libanyevent-perl -y
RUN PERL_MM_USE_DEFAULT=1 cpan AnyEvent::MPRPC::Client
RUN perl Makefile.PL
RUN ls && make && make test && make install
EXPOSE 5545
EXPOSE 554
CMD [ "perl", "./rtsp-server.pl" ]
