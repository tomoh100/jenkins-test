# FROM openjdk

# RUN mkdir /opt/tomcat
# WORKDIR /opt/tomcat
# RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz
# COPY apache-tomcat-9.0.64.tar.gz   ./apache-tomcat-9.0.64.tar.gz
# RUN tar xvf apache-tomcat-9.0.64.tar.gz
# RUN cp -r apache-tomcat-9.0.64/*  /opt/tomcat/.
# COPY my-app.war /opt/tomcat/webapps/

# EXPOSE 8080

# ENTRYPOINT ["/opt/tomcat/bin/catalina.sh","run"]


FROM openjdk:latest

RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat

# Download and extract Tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz \
    && tar xvf apache-tomcat-9.0.64.tar.gz \
    && rm apache-tomcat-9.0.64.tar.gz

COPY my-app.war /opt/tomcat/webapps/

EXPOSE 8080

ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]
