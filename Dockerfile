# NOTE: This image is merely for running the project locally in an isolated environment

FROM alpine:3.23

ARG TERRAFORM_VERSION=1.14.2

RUN apk add --no-cache \
    curl \
    python3 \
    aws-cli \
    unzip
RUN curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    -o terraform.zip \
    && unzip terraform.zip \
    && mv terraform /usr/local/bin/terraform \
    && rm terraform.zip

COPY infra /infra
COPY apps /apps