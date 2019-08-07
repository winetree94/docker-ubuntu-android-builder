# Base Image Configuration
FROM ubuntu:18.04
MAINTAINER winetree94@outlook.com

USER root

# Install requirement software
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends wget && \
    apt-get install -y --no-install-recommends openjdk-8-jdk && \
    apt-get install -y --no-install-recommends unzip

# Prepare to install android sdk
ARG ANDROID_SDK_VERSION=4333796
ENV ANDROID_HOME="/usr/local/android-sdk"
RUN mkdir -p ${ANDROID_HOME}
WORKDIR ${ANDROID_HOME}

# Install android sdk
RUN wget -q "https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_VERSION}.zip"
RUN unzip *tools*linux*.zip
RUN rm *tools*linux*.zip
RUN ls

# Set environment variables
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin

# Initialize android sdk
RUN mkdir -p ${HOME}/.android/
RUN touch ${HOME}/.android/repositories.cfg
RUN yes | sdkmanager --licenses
RUN sdkmanager --update