FROM ubuntu:14.04
ARG CLOUD_SDK_VERSION=267.0.0
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION
ENV PATH /google-cloud-sdk/bin:$PATH

#RUN apk --no-cache add \
RUN apt-get --sudo \
        curl \
        python \
        py-crcmod \
        bash \
        libc6-compat \
        openssh-client \
       	git \
	ca-certificates \
	gnupg \
    && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud --version

RUN apk update && \
    apk add py-pip && \
    apk add docker && \
    apk add docker-compose
    
VOLUME ["/root/.config"]
