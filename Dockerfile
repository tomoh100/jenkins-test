# FROM openjdk

# RUN mkdir /opt/tomcat
# WORKDIR /opt/tomcat
# RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz
# COPY apache-tomcat-9.0.93.tar.gz   ./apache-tomcat-9.0.93.tar.gz
# RUN tar xvf apache-tomcat-9.0.93.tar.gz
# RUN cp -r apache-tomcat-9.0.93/*  /opt/tomcat/.
# COPY my-app.war /opt/tomcat/webapps/

# EXPOSE 8080

# ENTRYPOINT ["/opt/tomcat/bin/catalina.sh","run"]


FROM openjdk

RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat

RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz \
    && curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz \
    && echo "Downloaded Tomcat successfully" \
    && file apache-tomcat-9.0.93.tar.gz \
    && tar xvf apache-tomcat-9.0.93.tar.gz \
    && rm apache-tomcat-9.0.93.tar.gz

COPY my-app.war /opt/tomcat/webapps/

EXPOSE 8080

ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]
