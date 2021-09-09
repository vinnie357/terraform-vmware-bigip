# based on microsoft codespaces containers thank you!
# [Choice] Ubuntu version: bionic, focal

FROM vinnie357/f5-devops-base:latest

ENV USERNAME="f5-devops" \
    PRECOMMITVERSION="latest" \
    TERRAFORMVERSION="1.0.5" \
    TERRAFORMDOCSVERSION="0.15.0"

COPY scripts/* /tmp/scripts/
# switch back to root for installs
USER root

# pre-commit, go, docker, terraform, terraform-docs
RUN set -ex \
    && apt-get update \
    && bash /tmp/scripts/terraform-debian.sh "${TERRAFORMVERSION}" \
    && bash /tmp/scripts/terraform-docs-debian.sh "${TERRAFORMDOCSVERSION}"

# add extras
# RUN set -ex \
    # https://github.com/vinnie357/devcontainers/tree/main/scripts-library/ubuntu
    # && bash /tmp/scripts/my-script.sh

# Clean up
RUN set -ex \
&& apt autoremove -y && apt clean -y

#change user
USER ${USERNAME}
