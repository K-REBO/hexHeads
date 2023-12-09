help:
	just --list
build:
	bun run build
serve:
	cd build && miniserve . --index index.html

watch:
	cd build && miniserve . --index index.html &
	bun run build --watch
dev:
	bun run dev -- --open


alias h := help
alias b := build
alias s := serve
alias d := dev
alias w := watch
