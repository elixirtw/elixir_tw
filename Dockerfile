FROM ubuntu:trusty

# Elixir requires UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# update and install some software requirements
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl wget git make vim htop

# For some reason, installing Elixir tries to remove this file
# and if it doesn't exist, Elixir won't install. So, we create it.
# http://blog.danielberkompas.com
# RUN touch /etc/init.d/couchdb

# change version can force rebuild image layers from here
ENV PHOENIX_VERSION 1.2.0

# download and install Erlang package
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb \
 && dpkg -i erlang-solutions_1.0_all.deb \
 && apt-get update

# install latest elixir package
RUN apt-get install -y esl-erlang elixir && rm erlang-solutions_1.0_all.deb

# install the Phoenix Mix archive
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHOENIX_VERSION.ez

# install Node.js (>= 5.0.0) and NPM in order to satisfy brunch.io dependencies
# See http://www.phoenixframework.org/docs/installation#section-node-js-5-0-0-
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && sudo apt-get install -y yarn

RUN mix local.hex --force
RUN mix local.rebar
RUN yarn global add brunch

WORKDIR /app
COPY . .

RUN yarn

RUN ./node_modules/brunch/bin/brunch b -p
RUN MIX_ENV=prod mix do phoenix.digest, release --env=prod
