FROM java:8
#WORKDIR /
COPY ./my-app/target/*.jar /
ADD ./my-app/target/*.jar /usr/local/bin/
EXPOSE 8080
CMD java -jar my-app-1.0-SNAPSHOT.jar
