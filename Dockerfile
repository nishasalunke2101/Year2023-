FROM tomcat:8.0.51-jre8-alpine
COPY ./target/Year_2023*.war /usr/local/tomcat/webapps
EXPOSE  8080
USER Year_2023
WORKDIR /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
