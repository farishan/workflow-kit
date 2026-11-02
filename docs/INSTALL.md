# Install

## One-liner

```bash
git clone git@github.com:farishan/workflow-kit.git ~/dev/workflow-kit \
  && cd ~/dev/workflow-kit && ./install.sh
```

## Manual

1. Clone the repo:

   ```bash
   git clone git@github.com:farishan/workflow-kit.git ~/dev/workflow-kit
   cd ~/dev/workflow-kit
   ```

2. Create target dirs:

   ```bash
   mkdir -p ~/.config/opencode/commands ~/.config/opencode/agents \
            ~/.config/opencode/templates ~/.local/bin \
            ~/.config/workflow-kit/hooks
   ```

3. Copy files:

   ```bash
   cp commands/*.md ~/.config/opencode/commands/
   cp agents/*.md   ~/.config/opencode/agents/
   cp templates/*   ~/.config/opencode/templates/
   cp bin/wf-verify ~/.local/bin/wf-verify
   cp hooks/*       ~/.config/workflow-kit/hooks/
   chmod +x ~/.local/bin/wf-verify
   ```

4. Ensure `~/.local/bin` is on `PATH` (add to `~/.bashrc`/`~/.zshrc` if needed):

   ```bash
   export PATH="$HOME/.local/bin:$PATH"
   ```

## Verify

```bash
wf-verify --version        # -> wf-verify 0.2.0
wf-verify --help
wf-verify ~/dev/workflow-kit   # -> WORKFLOW-KIT VERIFY OK
~/.config/opencode/commands/spec.md  # exists
```

Or run the repo's own check:

```bash
cd ~/dev/workflow-kit && ./verify.sh
```

## Update

```bash
cd ~/dev/workflow-kit && git pull && ./install.sh
```
