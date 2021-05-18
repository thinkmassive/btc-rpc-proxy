FROM rust:1.52 as builder

WORKDIR /usr/src/btc-rpc-proxy
COPY . .

RUN cargo install --path .


FROM debian:buster-slim

COPY --from=builder /usr/local/cargo/bin/btc_rpc_proxy /usr/local/bin/btc_rpc_proxy

CMD ["btc_rpc_proxy","--conf","/etc/bitcoin/rpc_proxy.toml","-v"]
