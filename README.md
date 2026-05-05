# autocom

`autocom` is a lightweight git auto-commit watcher for local development branches.

It watches your repository, auto-stages tracked changes, generates a semantic commit message, commits when a minimum change threshold is met, and optionally pushes to upstream.

## Install

### Local install

```bash
./install.sh
```

## Usage

```bash
autocom [ROOT_DIR] [options]
```

Options:

- `--help`: show usage
- `--version`: print version
- `--once`: run one commit cycle and exit
- `--dry-run`: print actions without commit/push

## Config

By default, `autocom` reads config from `<repo>/.autocom.conf`.

You can override with:

```bash
AUTOCOMMIT_CONFIG=/path/to/file autocom
```

Current config fields:

- `AUTOCOMMIT_DEBOUNCE_SECONDS`
- `AUTOCOMMIT_PROTECTED_BRANCHES`
- `AUTOCOMMIT_MIN_LINES`
- `AUTOCOMMIT_PUSH`
- `AUTOCOMMIT_AUTO_ADD`
- `AUTOCOMMIT_IGNORE_GLOBS`
- `AUTOCOMMIT_BUILTIN_PATH_RULES`
- `AUTOCOMMIT_PATH_RULES` (optional multi-line rules)

## Dependencies

- Required: `git`, `rg` (`ripgrep`)
- Optional: `fswatch` (if missing, `autocom` uses a polling fallback)

## Homebrew formula release notes

`Formula/autocom.rb` includes a release SHA.
When creating a release:

1. Push tag `v0.1.0` (or next version).
2. Download release tarball.
3. Compute SHA256 and update `sha256`.
4. Update `url` and `version` if needed.
5. Publish formula in your tap repository.

### End-to-end release commands (GitHub + tarball + SHA)

From this repo:

```bash
git init
git add .
git commit -m "feat: initial autocom release"
git branch -M main
git remote add origin git@github.com:xlaez/autocom.git
git push -u origin main
```

Tag and push release:

```bash
git tag v0.1.0
git push origin v0.1.0
```

Create local tarball from the tag:

```bash
git archive --format=tar.gz --output=autocom-v0.1.0.tar.gz v0.1.0
shasum -a 256 autocom-v0.1.0.tar.gz
```

Or use GitHub release tarball directly:

```bash
curl -L "https://github.com/xlaez/autocom/archive/refs/tags/v0.1.0.tar.gz" -o v0.1.0.tar.gz
shasum -a 256 v0.1.0.tar.gz
```

Update `Formula/autocom.rb` with:

- `homepage`
- `url`
- `sha256` from the command output

Then in your tap repo (usually `homebrew-tap`):

```bash
mkdir -p Formula
cp /path/to/autocom/Formula/autocom.rb Formula/autocom.rb
git add Formula/autocom.rb
git commit -m "autocom 0.1.0"
git push
```

Install as users:

```bash
brew tap xlaez/tap
brew install autocom
```

## Built-in project structure coverage

Built-in path heuristics now include common layouts for:

- NestJS / Node (`src/modules`, `src/controllers`, `src/services`, `apps`, `packages`)
- Rust (`crates`, `Cargo.toml`, `Cargo.lock`, `rust-toolchain`)
- Go (`cmd`, `internal`, `go.mod`, `go.sum`)
- Python (`pyproject.toml`, `requirements*.txt`, `tests`)
- Java/Kotlin (`pom.xml`, `build.gradle`, `settings.gradle`)
- Monorepos and infra (`.github`, `scripts`, `infra`, `helm`, `k8s`, `terraform`)

For any project-specific layout, prefer explicit overrides via `AUTOCOMMIT_PATH_RULES` in `.autocom.conf`.

## Safety

- Protected branches are skipped.
- Whitespace-only changes are skipped.
- Small changes below threshold are skipped.

## License

MIT
