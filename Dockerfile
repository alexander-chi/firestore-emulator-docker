
FROM node:18-bullseye

LABEL maintainer="Alex Chi <alex.chi@me.com>"

# Install Java 8 JRE (required for Firestore emulator).
RUN apt-get update
RUN apt-get -y install openjdk-11-jre-headless
RUN apt-get install unzip

# Install Firestore Emulator.
RUN npm i -g firebase-tools

COPY entrypoint.sh .
COPY firebase.json .

RUN firebase setup:emulators:firestore
RUN firebase setup:emulators:ui

EXPOSE 8080
EXPOSE 8081

ENV FIRESTORE_PROJECT_ID "dummy-firestore-id"

ENTRYPOINT ["./entrypoint.sh"]
