FROM ruby:3.0

WORKDIR /app
COPY ./app .
RUN bundle install
ENTRYPOINT ["rerun","ruby server.rb"]
