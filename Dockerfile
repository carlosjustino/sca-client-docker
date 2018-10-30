# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

FROM 	   carlosjustino/wso2-os-base
MAINTAINER Carlos Eduardo Justino <carlos.justino@datacoper.com.br>


ARG CLIENTTAG
ENV CLIENTTAG ${CLIENTTAG:-TESTEJ}

ARG IPSERVIDORDATACOPER
ENV IPSERVIDORDATACOPER ${IPSERVIDORDATACOPER:-sca.datacoper.com.br}

ARG PORTASERVIDORDATACOPER
ENV PORTASERVIDORDATACOPER ${PORTASERVIDORDATACOPER:-13226}

VOLUME ["/opt/wso2/producaoApp","/opt/flyway/producao"]

WORKDIR /opt

ADD arquivos/sca.tar /opt

RUN echo '[GERAL]' >> /opt/sca/client.ini
RUN echo 'ip_servidor_datacoper = $IPSERVIDORDATACOPER' >> /opt/sca/client.ini
RUN echo 'porta_servidor_datacoper = $PORTASERVIDORDATACOPER' >> /opt/sca/client.ini
RUN echo 'cliente = $CLIENTTAG' >> /opt/sca/client.ini
RUN echo '' >> /opt/sca/client.ini
RUN echo '[EMAIL]' >> /opt/sca/client.ini
RUN echo 'email_smtp = correio.datacoper.com.br' >> /opt/sca/client.ini
RUN echo 'email_smtp_port = 587' >> /opt/sca/client.ini
RUN echo 'email_destinatario = ' >> /opt/sca/client.ini
RUN echo 'email_remetente = atualizador@datacoper.com.br' >> /opt/sca/client.ini
RUN echo 'email_autenticar = 1' >> /opt/sca/client.ini
RUN echo 'email_usuario = atualizador@datacoper.com.br' >> /opt/sca/client.ini
RUN echo "email_senha = G'nvqk{hg($Xk" >> /opt/sca/client.ini
RUN echo 'email_usar_tls = 1' >> /opt/sca/client.ini
RUN echo '' >> /opt/sca/client.ini
RUN echo '[AGENDAMENTO]' >> /opt/sca/client.ini
RUN echo 'DATA_EXECUCAO = 12/10/2016' >> /opt/sca/client.ini
RUN echo 'HORA_EXECUCAO = 14:39:38' >> /opt/sca/client.ini
RUN echo 'FAZER_LOG = 1' >> /opt/sca/client.ini
RUN echo 'EXECUTAR_SERVER = 1' >> /opt/sca/client.ini
RUN echo '' >> /opt/sca/client.ini
RUN echo '[Banco]' >> /opt/sca/client.ini
RUN echo 'usuario = SYSDBA' >> /opt/sca/client.ini
RUN echo 'senha = P%@I(/11q' >> /opt/sca/client.ini
RUN echo 'caminho_banco = ' >> /opt/sca/client.ini

###################
# Setup run script
###################
ENV JAVA_HOME /opt/java
ENV PATH=$PATH:/opt/java/bin

RUN java -version

CMD ["/opt/sca/init.sh"]