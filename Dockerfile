FROM ubuntu As build
RUN apt-get update && apt-get install git -y && apt-get install maven -y
RUN git clone https://github.com/Pritam-Khergade/student-ui.git
WORKDIR /student-ui
RUN mvn clean package
FROM tomcat:alpine
COPY --from=build /student-ui/target/*.war webapps/
CMD ["catalina.sh","run"]
