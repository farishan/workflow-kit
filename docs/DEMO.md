# Demo

Run the bundled demos with `wf-verify` and confirm green output.

## Prerequisites

- `wf-verify` on `PATH` (`~/.local/bin`).
- `demo-go` / `examples/go-service`: Go toolchain.
- `examples/bun-app`: Bun + dependencies (`bun install` in the dir; already vendored).
- `examples/rust-cli`: Rust toolchain (`cargo`).
- `examples/python-pkg`: Python 3 + pytest.
- Deno stack (no bundled dir): Deno toolchain.

## demo-go

```bash
cd ~/dev/workflow-kit
wf-verify demo-go
```

Expected (exit 0):

```
wf-verify: project=/home/faris/dev/workflow-kit/demo-go
== verify.sh ==
ok  	github.com/farishan/workflow-demo	(cached)
DEMO VERIFY OK
wf-verify: verify.sh exit=0
```

`demo-go/verify.sh` runs `gofmt` check, `go build ./...`, `go test ./...`.

## examples/bun-app

```bash
cd ~/dev/workflow-kit
wf-verify examples/bun-app
```

Expected (exit 0):

```
wf-verify: project=/home/faris/dev/workflow-kit/examples/bun-app
== verify.sh ==
$ tsc --noEmit
bun test v1.4.4 (38afee6c8)

 1 pass
 0 fail
 1 expect() calls
Ran 1 test across 1 file. [5.00ms]
$ bun build src/index.ts --outdir dist --target bun
Bundled 1 module in 5ms

  index.js  161 bytes  (entry point)

wf-verify: verify.sh exit=0
```

`examples/bun-app/verify.sh` runs `bun run typecheck && bun test && bun run build`.

## examples/go-service

```bash
cd ~/dev/workflow-kit
wf-verify examples/go-service
```

Expected (exit 0):

```
wf-verify: project=/home/faris/dev/workflow-kit/examples/go-service
== verify.sh ==
?   	github.com/farishan/workflow-example/cmd/server	[no test files]
ok  	github.com/farishan/workflow-example/internal/add	(cached)
GO-SERVICE VERIFY OK
wf-verify: verify.sh exit=0
```

`examples/go-service/verify.sh` runs `gofmt` check, `go build ./...`, `go test ./...`.

## examples/rust-cli

```bash
cd ~/dev/workflow-kit
wf-verify examples/rust-cli
```

Expected (exit 0):

```
wf-verify: project=/home/faris/dev/workflow-kit/examples/rust-cli
== verify.sh ==
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.01s
    Finished `test` profile [unoptimized + debuginfo] target(s) in 0.01s
     Running unittests src/main.rs (target/debug/deps/rust_cli-aab44531acd1c354)

running 1 test
test tests::test_add ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

RUST-CLI VERIFY OK
wf-verify: verify.sh exit=0
```

`examples/rust-cli/verify.sh` runs `cargo fmt --check`, `cargo check`, `cargo test`.

## examples/python-pkg

```bash
cd ~/dev/workflow-kit
wf-verify examples/python-pkg
```

Expected (exit 0):

```
wf-verify: project=/home/faris/dev/workflow-kit/examples/python-pkg
== verify.sh ==
.                                                                        [100%]
...
1 passed, 1 warning in 0.01s
wf-verify: verify.sh exit=0
```

`examples/python-pkg/verify.sh` runs `pytest -q`.

## deno-app (Deno stack detection)

No bundled example dir; selftest seeds `/tmp/opencode/denodemo`. Any dir with `deno.json`/`deno.jsonc` works.

```bash
wf-verify /tmp/opencode/denodemo
```

Expected (exit 0):

```
wf-verify: project=/tmp/opencode/denodemo
== deno ==
>> deno check .
>> deno test
running 1 test from ./main_test.ts
add ... ok (0ms)

ok | 1 passed | 0 failed (15ms)

wf-verify: deno OK
```

Deno detection runs `deno check .` and `deno test` when `*_test.ts`/`*_test.js` files exist.

## Notes

- Projects with their own `verify.sh` run that; otherwise `wf-verify` detects the stack.
- A non-zero exit means a check failed; fix and re-run.