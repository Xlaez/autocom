# autocom

Automatic git commit watcher for local development branches.

## macOS install

```bash
brew tap xlaez/tap
brew install autocom
```

Verify:

```bash
which autocom
autocom --version
```

## Run in any project

From the root of a git repository:

```bash
cd /path/to/your/project
autocom
```

Useful commands:

```bash
autocom --help
autocom --once
autocom --dry-run
```

## Project config (optional)

Create `.autocom.conf` in the project root.

Common settings:

```bash
AUTOCOMMIT_DEBOUNCE_SECONDS=30
AUTOCOMMIT_PROTECTED_BRANCHES="main master production"
AUTOCOMMIT_MIN_LINES=8
AUTOCOMMIT_PUSH=true
AUTOCOMMIT_AUTO_ADD=true
```

Then run:

```bash
autocom
```
