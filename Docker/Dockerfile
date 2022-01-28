FROM ruby:3.0

WORKDIR /app

COPY ./app/Gemfile ./
RUN bundle install
EXPOSE 4567
COPY . .

