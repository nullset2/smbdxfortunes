FROM ruby:2.7.7

WORKDIR /app
ADD . /app
RUN gem install bundler:1.16.0
RUN bundle install --system

EXPOSE 4567

CMD ["ruby", "fortune.rb", "-o", "0.0.0.0"]

