FROM centos:centos7.9.2009 as build
USER root
EXPOSE 18888

WORKDIR /apps/usr/sqlstudio/
COPY ./sqlstudio_linux_1.0.2.zip /apps/usr/sqlstudio/
COPY ./sqlstudio-start.sh /apps/usr/sqlstudio/

RUN set -x \
    && yum -y install unzip \
    && yum clean all \
    && unzip -q sqlstudio_linux_1.0.2.zip -d /apps/usr/sqlstudio/ \
    && cp /apps/usr/sqlstudio/sqlstudio-start.sh /apps/usr/sqlstudio/linux/ \
    && rm -rf sqlstudio_linux_1.0.2.zip \
    && rm -rf /tmp/*  \
    && rm -rf /var/cache/yum/*

FROM centos:centos7.9.2009 as environment
USER root
EXPOSE 18888

ENV TZ Asia/Shanghai

WORKDIR /apps/usr/sqlstudio/
COPY --from=build /apps/usr/sqlstudio/linux /apps/usr/sqlstudio/

RUN set -x \
    && yum update -y \
    && yum -y install kde-l10n-Chinese telnet net-tools wget curl \
    && yum -y reinstall glibc-common \
    && yum clean all \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
    && rm -rf /tmp/*  \
    && rm -rf /var/cache/yum/*

ENV JAVA_HOME /apps/usr/sqlstudio/jdk1.8.0_351
ENV JRE_HOME ${JAVA_HOME}/
ENV PATH ${JAVA_HOME}/bin:${PATH}
ENV CLASSPATH .:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar

ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
ENV LC_ALL=zh_CN.UTF-8

CMD  ["/bin/bash","sqlstudio-start.sh"]