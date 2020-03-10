FROM ruby:2.6.3

RUN apt-get update && apt-get install stress

RUN echo 'export PS1="\\n\\n>> stress \W \$ "' >> /root/.bashrc

WORKDIR /app

# Pre-install gems
COPY Gemfile* ./
RUN gem install bundler && \
    bundle install --jobs=3 --retry=3 

COPY . .

EXPOSE 3000

CMD bundle exec rackup