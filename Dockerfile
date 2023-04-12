FROM gradle:7.4-jdk-alpine

WORKDIR /build

# 그래들 파일이 변경시에만 새롭게 의존 패키지 다운
COPY build.gradle settings.gradle /build/
RUN gradle build -x test --parallel --continue > /dev/null 2>&1 || true

# 빌더 이미지에서 앱 빌드
COPY . /build
RUN gradle build -x test --parallel

# APPLICATION
FROM openjdk:11.0-slim
WORKDIR /app

COPY --from=builder /build/build/libs/*-SNAPSHOT.jar ./app.jar

EXPOSE 5000

# nobody 권한으로 실행
USER nobody
ENTRYPOINT [
															\
   "java",													\
   "-jar",													\
   "-Djava.security.egd=file:/dev/./urandom",				\
   "-Dsun.net.inetaddr.ttl=0",								\
   "app.jar"												\ 
]



