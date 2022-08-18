FROM adoptopenjdk/openjdk11-openj9:x86_64-debian-jdk-11.0.5_10_openj9-0.17.0 as opencv-build

COPY opencv-install.sh opencv-install.sh
RUN chmod +x opencv-install.sh && sync && ./opencv-install.sh 

FROM amazoncorretto:18-alpine3.15

RUN apk -U upgrade
RUN apk add inotify-tools
WORKDIR /proctoring-service
RUN mkdir -p /opt/local/lib
COPY --from=opencv-build /opt/local/lib /opt/local/lib
CMD ["./run.sh"]
