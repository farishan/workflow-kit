# VHS tape for the workflow-kit terminal walkthrough.
# Render:  vhs docs/video-walkthrough.tape   (from repo root)
# Requires: ttyd + ffmpeg on PATH (see docs/AI_SCREEN_RECORDING_TOOLS.md)
# Output:  dist/workflow-kit-terminal.mp4

Output dist/workflow-kit-terminal.mp4

Set Shell "bash"
Set FontSize 22
Set Width 1100
Set Height 620
Set Padding 20
Set Theme "Catppuccin Frappe"
Set TypingSpeed 60ms
Set WindowBar Colorful

# --- intro ---
Type "# workflow-kit: stop vibe-coding, ship agentic changes"
Sleep 500ms
Enter
Sleep 1s

# --- install ---
Type "curl -fsSL https://raw.githubusercontent.com/farishan/workflow-kit/main/install.sh | bash"
Sleep 400ms
Enter
Sleep 3s

# --- doctor ---
Type "command -v wf-verify && wf-verify --help 2>/dev/null | head -3; echo 'kit on PATH -> ~/.local/bin/wf-verify'"
Sleep 300ms
Enter
Sleep 1500ms

# --- verify on demo-go ---
Type "cd ~/dev/workflow-kit/demo-go && cat SPEC.md | head -20"
Sleep 400ms
Enter
Sleep 2s
Type "wf-verify ."
Sleep 400ms
Enter
Sleep 4s

# --- ship hint ---
Type "echo 'then: /spec /verify /review /ship'"
Sleep 300ms
Enter
Sleep 2s