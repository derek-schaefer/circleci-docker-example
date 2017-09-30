FROM ruby:2.4.2

RUN mkdir /opt/application
WORKDIR /opt/application

RUN gem install bundler

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 4567

CMD ["bundle", "exec", "ruby", "server.rb"]
