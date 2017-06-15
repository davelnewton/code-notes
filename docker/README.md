# Various Docker Notes

## Run Shell

    docker run --it <image-name> /bin/bash

## Simple Dockerfile

```
FROM centos:7

RUN yum update -y
```
