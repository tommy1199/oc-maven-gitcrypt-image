FROM sselzer/maven-gitcrypt:3-jdk-11

LABEL maintainer="sascha.selzer@gmail.com"

ENV OC_VERSION=v3.11.0 \
    OC_TAG_SHA=0cbc58b
    
RUN curl -sLo /tmp/oc.tar.gz https://github.com/openshift/origin/releases/download/${OC_VERSION}/openshift-origin-client-tools-${OC_VERSION}-${OC_TAG_SHA}-linux-64bit.tar.gz && \
    tar xzvf /tmp/oc.tar.gz -C /tmp/ && \
    mv /tmp/openshift-origin-client-tools-${OC_VERSION}-${OC_TAG_SHA}-linux-64bit/oc /usr/local/bin/ && \
    rm -rf /tmp/oc.tar.gz /tmp/openshift-origin-client-tools-${OC_VERSION}-${OC_TAG_SHA}-linux-64bit

RUN apt-get update && apt-get install -y ruby