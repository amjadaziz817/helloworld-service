FROM gradle:jdk11 AS builder
# for debugging
RUN java -version

WORKDIR /app

COPY . .

RUN bash docker-utils.sh load-cache

RUN ./gradlew --no-daemon --console=plain clean build

FROM adoptopenjdk:11-jre-hotspot as application
WORKDIR /app

COPY --from=builder /app/build/libs/*SNAPSHOT.jar http.jar

EXPOSE 8080

CMD ["java", "-jar", "http.jar"]