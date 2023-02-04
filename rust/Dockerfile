FROM rust:alpine3.17

WORKDIR /usr/src/app

COPY Cargo.toml ./

COPY main.rs ./src/

EXPOSE 3002

CMD [ "cargo", "run" ]
