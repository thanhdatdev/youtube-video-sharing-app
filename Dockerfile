# Use the official Ruby image as a base
FROM ruby:3.2.2

# Set environment variables
ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=true
# RUN apt-get update -qq && apt-get install -y git-core build-essential libpq-dev nodejs && apt-get clean autoclean && rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install --jobs $(nproc) --retry 5

# Precompile assets
RUN bundle exec rails assets:precompile

# Copy the rest of the application code to the container
COPY . .

# Expose port 3000 to the host
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
