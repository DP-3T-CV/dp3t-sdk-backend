FROM ubuntu

# Install maven
RUN apt-get -y update  && apt-get install default-jre default-jdk openjdk-8-jdk maven -y

WORKDIR /code
ADD . /code/
RUN cd dpppt-backend-sdk && mvn install -DskipTests && mkdir /opt/compila -p
RUN ls dpppt-backend-sdk/target
EXPOSE 8113
CMD ["jar ","-Dspring.profiles.active=dev","-jar","dpppt-backend-sdk/target/ha-authcode-generation-service.jar"]
