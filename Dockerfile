FROM ubuntu:18.04

COPY instantclient-basic-linux.x64-12.1.0.2.0.zip /
COPY instantclient-sqlplus-linux.x64-12.1.0.2.0.zip /

RUN mkdir /opt/oracle
RUN mv instantclient-* /opt/oracle

RUN apt-get update
RUN apt-get install -y unzip

RUN unzip /opt/oracle/instantclient-basic-linux.x64-12.1.0.2.0.zip -d /opt/oracle
RUN unzip /opt/oracle/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip -d /opt/oracle

RUN ln -s /opt/oracle/instantclient_12_1/libclntsh.so.12.1 /opt/oracle/instantclient_12_1/libclntsh.so
RUN ln -s /opt/oracle/instantclient_12_1/libocci.so.12.1 /opt/oracle/instantclient_12_1/libocci.so

RUN apt-get install -y libaio1

ENV LD_LIBRARY_PATH="/opt/oracle/instantclient_12_1:${LD_LIBRARY_PATH}"
ENV PATH="/opt/oracle/instantclient_12_1:${PATH}"