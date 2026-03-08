# AI-Driven Project Bootstrap

`bootstrap_ai_repo.sh` scaffolds a **spec-first, agent-driven** repository layout.

It intentionally creates:

- A predictable set of folders for human + agent collaboration
- Markdown templates for the core artifacts (spec/design/tasks/review/diagnostics)
- A `Makefile` that orchestrates a simple workflow (`make feature`, `make pipeline`, etc.)
- Placeholder “agent” scripts and `mcp/` tool scripts you can wire into your real stack

This is a **bootstrap**: the agent scripts mostly print what they would do, and the `mcp/` commands are stubs until you replace them with real `test/lint/build` commands.

---

## Quick start

### Prerequisites

- A Unix-like shell with `bash` (Linux/macOS; Windows via WSL/Git Bash)
- `make` (to use the Makefile shortcuts)
- `git` (optional, but recommended)

Run the script in the directory you want to turn into an agent-driven project:

```bash
mkdir my-project
cd my-project

# copy bootstrap_ai_repo.sh into this directory, then:
bash bootstrap_ai_repo.sh
```

Then initialize git (optional but strongly encouraged):

```bash
git init
git add .
git commit -m "Bootstrap agent-driven repo"
```

Create a feature scaffold:

```bash
make feature NAME=authentication
```

Run the (placeholder) pipeline:

```bash
make pipeline NAME=authentication
```

---

## What gets generated

Running `bootstrap_ai_repo.sh` creates these directories:

- `scripts/` – workflow scripts invoked by the Makefile
- `templates/` – Markdown templates copied into artifact folders
- `specs/` – feature specifications
- `instructions/` – implementation instructions derived from the spec
- `design/` – technical design docs
- `tasks/` – task breakdowns with acceptance criteria
- `reviews/` – engineering review artifacts
- `diagnostics/` – failure analysis artifacts
- `agents/` – agent role definitions (Markdown)
- `memory/` – long-lived notes (design patterns, known failures)
- `mcp/` – “tool” scripts for tests/lint/build (you customize these)
- `src/`, `tests/` – your actual code and test suite

It also writes:

- `Makefile`
- several `scripts/*.sh` files
- several `mcp/*.sh` files
- Markdown templates under `templates/`

---

## Repository layout (after bootstrap)

Approximate structure (omitting some files for brevity):

```text
.
├─ Makefile
├─ agents/
│  ├─ architect.md
│  ├─ planner.md
│  ├─ coder.md
│  └─ reviewer.md
├─ design/
├─ diagnostics/
├─ instructions/
├─ mcp/
│  ├─ run_tests.sh
│  ├─ lint.sh
│  └─ build.sh
├─ memory/
│  ├─ design_patterns.md
│  └─ known_failures.md
├─ reviews/
├─ scripts/
│  ├─ init_project.sh
│  ├─ new_feature.sh
│  ├─ new_bug.sh
│  ├─ run_pipeline.sh
│  ├─ agent_architect.sh
│  ├─ agent_planner.sh
│  ├─ agent_coder.sh
│  └─ agent_reviewer.sh
├─ specs/
├─ src/
├─ tasks/
├─ templates/
│  ├─ spec.md
│  ├─ instructions.md
│  ├─ design.md
│  ├─ tasks.md
│  ├─ review.md
│  └─ diagnostic.md
└─ tests/
```

---

## Makefile commands

The generated `Makefile` is the main interface.

### Bootstrap

- `make init`
  - Runs `scripts/init_project.sh` (currently prints “Project already initialized.”)

### Feature workflow

- `make feature NAME=<feature-name>`
  - Creates a full set of feature artifacts:
    - `specs/<name>.md`
    - `instructions/<name>.md`
    - `design/<name>.md`
    - `tasks/<name>.md`
    - `reviews/<name>.md`
    - `diagnostics/<name>.md`

### Bug workflow

- `make bug NAME=<bug-name>`
  - Creates a minimal bug triage workflow:
    - `diagnostics/<name>.md`
    - `tasks/<name>.md`

### Pipeline

- `make pipeline NAME=<feature-name>`
  - Runs `scripts/run_pipeline.sh <name>`, which calls:
    - `scripts/agent_architect.sh <name>`
    - `scripts/agent_planner.sh <name>`
    - `scripts/agent_coder.sh <name>`
    - `scripts/agent_reviewer.sh <name>` (which runs `mcp/run_tests.sh`)

### Tools (MCP)

- `make test` → `mcp/run_tests.sh`
- `make lint` → `mcp/lint.sh`
- `make build` → `mcp/build.sh`

### Help

- `make help`

---

## How the workflow is intended to work

For a feature named `authentication`:

1. Generate artifacts: `make feature NAME=authentication`
2. Write the spec in `specs/authentication.md`
3. Derive instructions + design (`instructions/…`, `design/…`)
4. Break down tasks in `tasks/authentication.md`
5. Implement in `src/` and tests in `tests/`
6. Run: `make test` (and `make lint`, `make build` if you wire them)
7. Record outcomes in `reviews/authentication.md` and/or `diagnostics/authentication.md`

The point of the structure is that both humans and agents have consistent places to look for:

- “What are we building?” (`specs/`)
- “How should it behave?” (`instructions/`)
- “How is it designed?” (`design/`)
- “What are the next steps?” (`tasks/`)
- “What went wrong?” (`diagnostics/`)
- “Is this acceptable?” (`reviews/`)

---

## Customizing it for your stack (important)

Out of the box, `mcp/` scripts only echo placeholder text. To make the pipeline meaningful, update:

- `mcp/run_tests.sh` – run your real tests
- `mcp/lint.sh` – run your linter/formatter checks
- `mcp/build.sh` – run your build/package step

Examples (pick what matches your project):

```bash
# Python
pytest -q

# Node
npm test

# Go
go test ./...
```

Once those are real, `scripts/agent_reviewer.sh` becomes a useful “gate” because it calls `mcp/run_tests.sh`.

---

## Notes & gotchas

- **Re-running the bootstrap overwrites files**: the script uses `cat > …` to write `Makefile`, `scripts/*`, `mcp/*`, and `templates/*`. Running it again will replace those files.
- **Always pass `NAME=...`**: the Makefile default is `NAME ?= undefined`. If you forget the variable you’ll generate `specs/undefined.md`, etc.
- **Use safe names**: feature/bug names become filenames. Prefer kebab-case like `user-auth` and avoid spaces or slashes.
- **Existing feature files are overwritten**: `scripts/new_feature.sh` and `scripts/new_bug.sh` use `cp` without prompts; an existing `specs/<name>.md` will be overwritten.
- **The “agents” are placeholders**: the generated `scripts/agent_*.sh` currently only print what they would do. They don’t edit files or call an LLM by themselves.

---

## Suggested improvements (optional)

If you want to harden this bootstrap for repeated use across teams, consider:

- Add argument validation (`NAME` required, reject spaces, etc.)
- Use `set -euo pipefail` and quote variables in the scripts
- Add “no clobber” mode (e.g., refuse to overwrite existing artifacts unless `--force`)
- Make `scripts/init_project.sh` actually validate the expected structure
- Extend `scripts/agent_architect.sh` / `agent_planner.sh` to produce derived artifacts automatically

---

## License

See `LICENSE`.
