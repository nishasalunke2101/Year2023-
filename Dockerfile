FROM tomcat:8.0.51-jre8-alpine
COPY ./target/year2023*.war /usr/local/tomcat/webapps
EXPOSE  8080
USER year2023
WORKDIR /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
