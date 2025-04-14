FROM rust:latest
RUN cargo install --git=https://gitlab.com/sporad/sporad sporad-server
ENV SPORAD_LOG="sporad=trace,hyper_util=warn"
ENV SESSION_LIFETIME_MIN=1440
ENV CACHE_LIFETIME_MIN=1440
ENV CACHE_SIZE=1000
RUN ls -l /usr/local/cargo/bin
CMD [ "sporad-server" ]
