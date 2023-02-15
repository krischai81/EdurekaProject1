#FROM 
FROM tomcat:9-alpine

LABEL maintainer=Krishna

RUN apt-get update && apt-get -y upgrade

WORKDIR /usr/local/tomcat/webapps

ADD /var/lib/jenkins/workspace/EdurekaProject1Package/target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps/

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY context.xml /usr/local/tomcat/webapps/manager

#Expose port 8082 since 8080 is used by jenkins
EXPOSE 8082

#The CMD instruction specifies what to run when the container is run.
CMD["catalina.sh", "run"]
