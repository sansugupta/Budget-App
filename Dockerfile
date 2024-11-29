FROM ruby:3.1

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN bundle exec rails db:create
RUN bundle exec rails db:migrate

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
