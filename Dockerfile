FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y nodejs
RUN mkdir /bank_api
WORKDIR /bank_api
COPY Gemfile /bank_api/Gemfile
COPY Gemfile.lock /bank_api/Gemfile.lock
RUN bundle install
COPY . /bank_api

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh


ENTRYPOINT ["entrypoint.sh"]
