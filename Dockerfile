FROM ubuntu:latest
MAINTAINER jannis@gmail.com

RUN apt-get update -y
RUN apt-get install -y postgresql-client ruby ruby-dev build-essential libxml2-dev libxslt-dev liblzma-dev zlib1g-dev patch

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/hello-cron


# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

RUN ln -s /.s3cfg /root/.s3cfg

RUN mkdir /backup
WORKDIR /backup
COPY Gemfile /backup/Gemfile
COPY Gemfile.lock /backup/Gemfile.lock
RUN gem install nokogiri -v 1.6.7.1 -- --use-system-libraries=true --with-xml2-include=/usr/include/libxml2
RUN gem install bundler
# RUN bundle config build.nokogiri --use-system-libraries
RUN bundle config build.nokogiri --use-system-libraries=true --with-xml2-include=/usr/include/libxml2
RUN NOKOGIRI_USE_SYSTEM_LIBRARIES=1 bundle install
COPY backup.sh /backup/backup.sh
RUN chmod 0700 /backup/backup.sh
COPY backup.rb /backup/s3upload.rb
RUN chmod 0700 /backup/s3upload.rb

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
