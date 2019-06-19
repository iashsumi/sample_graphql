FROM ruby:2.5
ENV LANG C.UTF-8
 
ENV APP_ROOT /app
WORKDIR $APP_ROOT
 
RUN apt-get update -qq && apt-get install -y nodejs mysql-client sqlite3
 
COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle install

COPY . $APP_ROOT
 
EXPOSE 3000
 
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]