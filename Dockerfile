FROM rust:latest
ENV DATABASE_FOLDER="/usr/share/sporad"
ENV DATABASE_URL="sqlite://${DATABASE_FOLDER}/data.sqlite"
ENV SQLX_OFFLINE=true
ENV SPORAD_LOG="sporad=trace,hyper_util=warn"
ENV SESSION_LIFETIME_MIN=1440
ENV CACHE_LIFETIME_MIN=1440
ENV CACHE_SIZE=1000
RUN cargo install --git=https://gitlab.com/sporad/sporad --branch=develop sporad-server
RUN ls -l /usr/local/cargo/bin
CMD [ "sporad-server" ]
