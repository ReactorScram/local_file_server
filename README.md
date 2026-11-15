# local_file_server

local_file_server lets you view local HTML files in a web browser easier.

local_file_server is a localhost-only HTTP server built with Rust and Axum.

## How to install

FIXME

## Install from source

For reproducible builds, use `scripts/build-linux-host.bash` which will invoke `cross-rs` and use pinned Podman images.

For non-reproducible builds, just use Cargo:

```bash
cargo install --locked --git https://github.com/ReactorScram/local_file_server
```

## Usage

```bash
local_file_server
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[AGPL-3.0-only](https://github.com/spdx/license-list-data/blob/v3.20/text/AGPL-3.0-only.txt) with additional clauses. See [LICENSE.md](LICENSE.md)
