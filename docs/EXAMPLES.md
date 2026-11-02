# Examples

All example projects ship a `verify.sh` and pass `wf-verify` from the repo root.

| Project | Stack | Path | wf-verify command |
|---|---|---|---|
| demo-go | Go 1.24 | `demo-go` | `wf-verify demo-go` |
| bun-app | Bun + TypeScript | `examples/bun-app` | `wf-verify examples/bun-app` |
| go-service | Go 1.24 | `examples/go-service` | `wf-verify examples/go-service` |
| rust-cli | Rust (Cargo) | `examples/rust-cli` | `wf-verify examples/rust-cli` |
| python-pkg | Python + pytest | `examples/python-pkg` | `wf-verify examples/python-pkg` |
| deno-app | Deno | `examples/deno-app` | `wf-verify examples/deno-app` |
| php-lib | PHP + Composer/PHPUnit | `examples/php-lib` | `wf-verify examples/php-lib` |
| ts-standalone | TypeScript (tsc) | `examples/ts-standalone` | `wf-verify examples/ts-standalone` |
| make-app | C + Make | `examples/make-app` | `wf-verify examples/make-app` |
| ruby-app | Ruby + Bundler/RSpec | `examples/ruby-app` | `wf-verify examples/ruby-app` |

See [DEMO.md](DEMO.md) for expected output on the Go/Bun/Go/Rust/Python demos.
