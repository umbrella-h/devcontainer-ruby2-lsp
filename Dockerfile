FROM ruby:3.3.2-slim-bullseye
MAINTAINER KasaHNO3 <umbrella.hsiao@gmail.com>

# Set timezone
ARG TimeZone=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/${TimeZone} /etc/localtime
RUN echo ${TimeZone} > /etc/timezone

# Install packages
RUN apt-get update && apt-get install -y gcc make git vim
# build-essential could provide better experience, while the installation is slow
COPY ruby-extensions/Gemfile /usr/workspace/.devcontainer/ruby-extensions/Gemfile
COPY ruby-extensions/Gemfile.lock /usr/workspace/.devcontainer/ruby-extensions/Gemfile.lock

# Create a non-root user to use if preferred
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --force --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && mkdir -p /home/${USERNAME}/.vscode-server/extensions \
  && mkdir -p /home/${USERNAME}/.vscode-server-insiders/extensions \
  && chown -R ${USER_UID}:${USER_GID} /home/${USERNAME}/.vscode-server*

# Install bundler
ARG BUNDLER_VER=2.5.11

WORKDIR /usr/workspace/.devcontainer/ruby-extensions
RUN gem install bundler -v ${BUNDLER_VER}
RUN bundle install

WORKDIR /usr/workspace

USER ${USERNAME}
