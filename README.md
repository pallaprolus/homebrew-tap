# Homebrew tap

Install ContextCut on macOS or Linux without a Rust compiler:

```bash
brew install pallaprolus/tap/contextcut
contextcut review --budget 45k --copy
```

[ContextCut](https://github.com/pallaprolus/contextcut) prepares focused repository context and change reviews for AI chats. The formula downloads the matching prebuilt archive and checks its SHA-256.

Supported architectures: macOS Apple Silicon/Intel and Linux ARM64/x86-64. Git is needed for review and diff modes. On Linux, clipboard output additionally needs `wl-copy`, `xclip`, or `xsel`; file output works without them.

```bash
brew update
brew upgrade pallaprolus/tap/contextcut
```

Formula updates are copied from the `contextcut.rb` asset in a tested ContextCut release. The tap CI installs the formula and runs its functional test on all four supported platform/architecture combinations.
