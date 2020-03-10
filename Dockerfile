FROM ruby:2.6.3

RUN apt-get update && apt-get install stress

RUN echo 'export PS1="\\n\\n>> stress \W \$ "' >> /root/.bashrc

WORKDIR /app

COPY Gemfile* ./
RUN gem install bundler && \
    bundle install --jobs=3 --retry=3 

COPY config.ru .

EXPOSE 3000

CMD bundle exec rackup -s thin -p 3000 -o 0.0.0.0
