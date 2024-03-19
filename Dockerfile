FROM ruby:alpine as base
WORKDIR /app

FROM base as build
RUN apk add --no-cache build-base && \
	gem install sinatra rackup erb

FROM base
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY . .
EXPOSE 80
CMD ["ruby", "app.rb", "-o", "0.0.0.0", "-p", "80"]
