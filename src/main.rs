#![type_length_limit = "2000000"]

extern crate configure_me;
#[macro_use]
extern crate serde;

use anyhow::Error;
use btc_rpc_proxy;

mod create_state;

#[tokio::main]
async fn main() -> Result<(), Error> {
    let (state, bind_addr) = create_state::create_state()?;
    btc_rpc_proxy::main(state.arc(), bind_addr).await
}
