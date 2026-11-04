# baselayer-ai-aarch64-linux-dev

Only works in Nix aarch64-linux

```Makefile
all:
	nix run 
	nix run github:BaseLayer-AI/baselayer-ai-aarch64-linux-stdenv
	nix run "https://flakehub.com/f/BaseLayer-AI/baselayer-ai-aarch64-linux-stdenv/*"
	nix run #info
	nix run github:BaseLayer-AI/baselayer-ai-aarch64-linux-stdenv#info
	nix run "https://flakehub.com/f/BaseLayer-AI/baselayer-ai-aarch64-linux-stdenv/*"#info
```

https://github.com/BaseLayer-AI/baselayer-ai-aarch64-linux-stdenv/actions/workflows/ci.yml


