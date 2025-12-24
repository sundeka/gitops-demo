# NOTE: This image is merely for running the project locally in an isolated environment

FROM alpine:3.23

# Hard-coded non-secret variables
ARG TERRAFORM_VERSION=1.14.2
ENV AWS_DEFAULT_REGION=us-east-1

# Secrets
ARG GITHUB_PAT
ENV GITHUB_PAT=$GITHUB_PAT

ARG AWS_ACCESS_KEY_ID
ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID

ARG AWS_SECRET_ACCESS_KEY
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

# Install libraries
RUN apk add \
    curl \
    python3 \
    aws-cli \
    unzip \
    git
RUN git config --global url."https://${GITHUB_PAT}:@github.com/".insteadOf "https://github.com/"
RUN curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    -o terraform.zip \
    && unzip terraform.zip \
    && mv terraform /usr/local/bin/terraform \
    && rm terraform.zip

# Include relevant code
COPY infra /infra
COPY apps /apps