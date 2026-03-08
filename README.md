AI-Driven Development Repository Bootstrap

This repository bootstrap script ("bootstrap_ai_repo.sh") initializes a structured AI-native software development framework. The framework is designed to support agent-driven, spec-first development, where AI agents collaborate through repository artifacts (Markdown documents) and controlled execution tools.

The goal is to make the repository understandable to:

- Human engineers
- AI coding agents
- Automated pipelines

The workflow enforces a design-before-code methodology and supports iterative self-correction using diagnostics and reviews.

---

Overview

Running the bootstrap script creates a repository with:

- Structured development artifacts
- Multi-agent workflow support
- Tooling for build, lint, and test execution
- Templates for specifications, designs, and tasks
- A "Makefile" to orchestrate the development pipeline

The typical lifecycle of a feature follows this sequence:

Specification → Instructions → Design → Tasks → Code → Tests → Review

Each stage is represented by a file in the repository.

---

Installation

Create a new project directory and run the bootstrap script.

mkdir my-project
cd my-project

bash bootstrap_ai_repo.sh

Initialize git:

git init
git add .
git commit -m "Initialize AI-driven development framework"

---

Repository Structure

After initialization the project structure will look like this:

project/

Makefile

scripts/
templates/

specs/
instructions/
design/
tasks/
reviews/
diagnostics/

agents/
memory/

src/
tests/

mcp/

Each directory has a specific role in the AI development pipeline.

---

Makefile

The "Makefile" provides the main command interface for development tasks.

Supported commands:

make feature NAME=<feature-name>
make bug NAME=<bug-name>
make pipeline NAME=<feature-name>

make test
make lint
make build

These commands orchestrate scripts and agents.

---

Scripts Directory

Contains operational scripts used by the Makefile.

"scripts/init_project.sh"

Initialization script for the project. Currently confirms that the repository structure exists.

"scripts/new_feature.sh"

Creates all artifacts required for a new feature:

- specification
- instructions
- design
- tasks
- review
- diagnostics

"scripts/new_bug.sh"

Creates files used for debugging workflows:

- diagnostic report
- task breakdown

"scripts/run_pipeline.sh"

Runs the multi-agent development pipeline:

Architect Agent
Planner Agent
Coder Agent
Reviewer Agent

Agent Scripts

"scripts/agent_architect.sh"

Responsible for interpreting the specification and producing:

- system instructions
- high-level architecture design

"scripts/agent_planner.sh"

Breaks the design into actionable engineering tasks.

"scripts/agent_coder.sh"

Implements tasks by generating source code.

"scripts/agent_reviewer.sh"

Runs tests and performs automated review of generated code.

---

Templates Directory

Contains reusable Markdown templates for development artifacts.

"templates/spec.md"

Template for feature specifications.

Sections include:

- problem statement
- requirements
- inputs
- outputs
- constraints
- edge cases

"templates/instructions.md"

Derived from the specification. Describes system responsibilities and behaviors.

"templates/design.md"

Defines system architecture including:

- components
- data flow
- failure handling
- scalability concerns

"templates/tasks.md"

Breaks a design into engineering tasks with acceptance criteria.

"templates/review.md"

Used for documenting code review results and architecture compliance.

"templates/diagnostic.md"

Used when failures occur during development or testing.

---

Artifact Directories

These folders contain the documents used by the AI development workflow.

"specs/"

Contains feature specifications.

Example:

specs/authentication.md

"instructions/"

Contains system instructions derived from specifications.

Example:

instructions/authentication.md

"design/"

Contains architecture design documents.

Example:

design/authentication.md

"tasks/"

Contains detailed engineering tasks.

Example:

tasks/authentication.md

"reviews/"

Contains code review and approval documentation.

Example:

reviews/authentication.md

"diagnostics/"

Contains debugging reports and failure analysis.

Example:

diagnostics/authentication.md

---

Agents Directory

The "agents/" directory contains definitions describing the roles of each AI agent.

Files include:

architect.md
planner.md
coder.md
reviewer.md

These documents describe the responsibilities and behavior expected from each agent.

---

MCP Tools Directory

The "mcp/" directory contains executable tools that AI agents can use to interact with the repository environment.

"mcp/run_tests.sh"

Runs the project's test suite.

"mcp/lint.sh"

Runs linting tools.

"mcp/build.sh"

Builds the project.

These tools enable AI agents to execute actions such as:

- compiling code
- running tests
- verifying code quality

---

Memory Directory

The "memory/" directory stores persistent knowledge that agents can reference.

"memory/design_patterns.md"

Reusable architectural patterns and best practices.

"memory/known_failures.md"

Historical bugs and lessons learned.

This allows agents to avoid repeating past mistakes.

---

Source Code and Tests

"src/"

Contains application source code generated during development.

"tests/"

Contains unit and integration tests.

These are executed through:

make test

---

Example Workflow

Step 1: Create a Feature

make feature NAME=authentication

This generates the following files:

specs/authentication.md
instructions/authentication.md
design/authentication.md
tasks/authentication.md
reviews/authentication.md
diagnostics/authentication.md

---

Step 2: Write the Specification

Edit:

specs/authentication.md

Define the problem, requirements, and constraints.

---

Step 3: Run the Agent Pipeline

make pipeline NAME=authentication

Pipeline execution:

Specification
    ↓
Architect Agent
    ↓
Planner Agent
    ↓
Coder Agent
    ↓
Reviewer Agent

---

Step 4: Run Tests

make test

---

Development Philosophy

This framework enforces several principles:

1. Specification-first development
2. Architecture before implementation
3. Task-driven coding
4. Automated testing and review
5. AI-assisted engineering workflows

The repository structure ensures that both humans and AI agents can reason about the system consistently.

---

Extending the Framework

Common extensions include:

- automated task dependency graphs
- parallel AI coding agents
- automatic pull request generation
- continuous integration pipelines
- AI-driven design reviews

---

License

Use freely in personal or commercial projects.
Modify the framework to suit your development workflow.
