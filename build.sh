#!/bin/bash

JMETER_VERSION=${JMETER_VERSION:-"5.4"}
IMAGE_TIMEZONE=${IMAGE_TIMEZONE:-"UTC"}

# Example build line
docker build  --build-arg JMETER_VERSION=${JMETER_VERSION} --build-arg TZ=${IMAGE_TIMEZONE} -t "abc123/jmeter:${JMETER_VERSION}" .
