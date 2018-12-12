FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /taskmanager
WORKDIR /taskmanager
COPY Gemfile /taskmanager/Gemfile
COPY Gemfile.lock /taskmanager/Gemfile.lock
RUN bundle install
COPY . /taskmanager