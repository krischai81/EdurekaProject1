#FROM 
FROM tomcat:9.0-alpine

LABEL maintainer=Krishna

RUN apt-get update && apt-get -y upgrade

WORKDIR /usr/local/tomcat/webapps

ADD ./*.war /usr/local/tomcat/webapps/

#Expose port 8082 since 8080 is used by jenkins
EXPOSE 8082

#The CMD instruction specifies what to run when the container is run.
CMD ["catalina.sh", "run"]
