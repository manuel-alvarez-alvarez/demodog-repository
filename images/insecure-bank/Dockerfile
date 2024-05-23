ARG JAVA_VERSION=17
FROM gradle:jdk${JAVA_VERSION} as builder

RUN mkdir /app \
    && cd /app \
    && git clone --depth 1 --branch malvarez/spring-boot https://github.com/hdiv/insecure-bank.git \
    && cd insecure-bank \
    && gradle bootWar

ARG JAVA_VERSION
FROM eclipse-temurin:${JAVA_VERSION}-jre
COPY --from=builder /app/insecure-bank/build/libs/insecure-bank-*.war /insecure-bank.war
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /insecure-bank.war"]