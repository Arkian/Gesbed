###############################################################################
#  Licensed to the Apache Software Foundation (ASF) under one
#  or more contributor license agreements.  See the NOTICE file
#  distributed with this work for additional information
#  regarding copyright ownership.  The ASF licenses this file
#  to you under the Apache License, Version 2.0 (the
#  "License"); you may not use this file except in compliance
#  with the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

FROM openjdk:8-jre-alpine

# Install dependencies
RUN apk add --no-cache bash snappy libc6-compat


# Grab gosu for easy step-down from root
ENV GOSU_VERSION 1.12
RUN set -eux; \
    \
    apk add --no-cache --virtual .gosu-deps \
        ca-certificates \
        dpkg \
        gnupg \
    ; \
    \
    dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
    wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
    \
# verify the signature
    export GNUPGHOME="$(mktemp -d)"; \
    gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
    gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
    command -v gpgconf && gpgconf --kill all || :; \
    rm -rf "$GNUPGHOME" /usr/local/bin/gosu.asc; \
    \
# clean up fetch dependencies
    apk del --no-network .gosu-deps; \
    \
    chmod +x /usr/local/bin/gosu; \
# verify that the binary works
    gosu --version; \
    gosu nobody true



# Prepare environment
ENV FLINK_HOME=/opt/flink
ENV PATH=$FLINK_HOME/bin:$PATH

# RUN groupadd --system --gid=9999 flink && \
#    useradd --system --home-dir $FLINK_HOME --uid=9999 --gid=flink flink

RUN addgroup -S -g 9999 flink && \
    adduser -D -S -H -u 9999 -G flink -h $FLINK_HOME flink
WORKDIR $FLINK_HOME

# Install Flink
COPY flink-1.12.0 $FLINK_HOME

# Configure container
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 6123 8081
CMD ["help"]
