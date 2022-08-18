#!/bin/bash
#
# TODO add opencv external libs to the jvmArguments param
#
# -Djava.library.path={opencv-dir}/build/lib
# -Djava.library.path=/usr/local/Cellar/opencv3/XXX/share/OpenCV/java
# -Dloader.path=/home/user/extlib

# ORIGINAL
# ./mvnw spring-boot:run -Dspring-boot.run.jvmArguments="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005" &

# TESTS
./mvnw spring-boot:run \
  -Dspring-boot.run.jvmArguments="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005" \
  -Dloader.path=/opt/local/lib &

while true; do
  inotifywait -e modify,create,delete,move -r ./src/ && ./mvnw compile
done
