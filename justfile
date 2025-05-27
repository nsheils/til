# justfile

server:
    cd hugosite && hugo server --renderToMemory --config hugo.toml

network-server:
    # macOS: get en0 IP, fallback to hostname
    IPADDR=$(ipconfig getifaddr en0 2>/dev/null || hostname)
    cd hugosite && hugo server --renderToMemory --bind $IPADDR --baseURL http://$IPADDR --config hugo.toml

build:
    rm -rf docs
    cd hugosite && hugo --config hugo.toml

lint: markdownlint prettier-lint vale

markdownlint:
    markdownlint .

prettier-lint:
    prettier --check . || (echo "[warn] Code style issues found. Running Prettier with --write to fix..." && prettier --write .)

vale:
    vale --glob='!**/archetypes/**' .
    # vale --glob='!**/archetypes/**' --glob='!**/README.md' .

fix: markdownlint-fix prettier-fix

markdownlint-fix:
    markdownlint --fix posts/ *.md

prettier-fix:
    prettier --write posts/
    prettier --write *.md 