FROM eclipse-temurin:25-jre-alpine

ARG MC_SERVER_SHA1=33680f5f2ac32864d6d7cf5e56a705fdb3e05f4c

ENV MEMORY_MIN=1G \
    MEMORY_MAX=2G 

RUN addgroup -S minecraft && \
    adduser -S -G minecraft minecraft

RUN mkdir -p /opt/minecraft /data && \
    chown minecraft:minecraft /data    

ADD https://piston-data.mojang.com/v1/objects/${MC_SERVER_SHA1}/server.jar /opt/minecraft/server.jar

RUN echo "${MC_SERVER_SHA1}  /opt/minecraft/server.jar" | sha1sum -c - && \
    chmod 644 /opt/minecraft/server.jar

# Copy startup script
COPY --chmod=755 entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /data

EXPOSE 25565/tcp

USER minecraft

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]