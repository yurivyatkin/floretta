FROM ruby:2.3.0
MAINTAINER yuri.vyatkin@gmail.com
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs
RUN mkdir -p /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . ./
EXPOSE 3000
ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-b", "0.0.0.0"]
