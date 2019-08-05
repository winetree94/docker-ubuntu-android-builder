FROM ubuntu:18.04
MAINTAINER winetree@jongdali.com

USER root
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y curl unzip openjdk-8-jdk build-essential file apt-utils

ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" \
    ANDROID_HOME="/usr/local/android-sdk"

# Download Android SDK

RUN mkdir "$ANDROID_HOME" .android \
    && cd "$ANDROID_HOME" \
    && curl -o sdk.zip $SDK_URL \
    && unzip sdk.zip \
    && rm sdk.zip \
    && mkdir "$ANDROID_HOME/licenses" || true \
    && echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "$ANDROID_HOME/licenses/android-sdk-license" \
    && yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

# Install Android Build Tool and Libraries

RUN $ANDROID_HOME/tools/bin/sdkmanager --update

RUN $ANDROID_HOME/tools/bin/sdkmanager \
    "build-tools;29.0.0" \
    "build-tools;28.0.3" \
    "build-tools;28.0.2" \
    "build-tools;27.0.3" \
    "build-tools;27.0.2" \
    "build-tools;27.0.1" \
    "build-tools;26.0.2" \
    "platforms;android-23" \
    "platforms;android-24" \
    "platforms;android-25" \
    "platforms;android-26" \
    "platforms;android-27" \
    "platforms;android-28" \
    "platform-tools"

