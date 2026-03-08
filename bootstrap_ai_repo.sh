#!/bin/bash

set -e

echo "Initializing AI-driven development repository..."

# Core directories
mkdir -p scripts
mkdir -p templates
mkdir -p specs
mkdir -p instructions
mkdir -p design
mkdir -p tasks
mkdir -p diagnostics
mkdir -p reviews
mkdir -p src
mkdir -p tests
mkdir -p agents
mkdir -p memory
mkdir -p mcp

########################################
# Makefile
########################################

cat > Makefile << 'EOF'
SHELL := /bin/bash
NAME ?= undefined

init:
	bash scripts/init_project.sh

feature:
	bash scripts/new_feature.sh $(NAME)

bug:
	bash scripts/new_bug.sh $(NAME)

pipeline:
	bash scripts/run_pipeline.sh $(NAME)

test:
	bash mcp/run_tests.sh

lint:
	bash mcp/lint.sh

build:
	bash mcp/build.sh

help:
	@echo "AI Development Commands"
	@echo ""
	@echo "make feature NAME=feature-name"
	@echo "make bug NAME=bug-name"
	@echo "make pipeline NAME=feature-name"
EOF

########################################
# Scripts
########################################

cat > scripts/init_project.sh << 'EOF'
#!/bin/bash
echo "Project already initialized."
EOF

cat > scripts/new_feature.sh << 'EOF'
#!/bin/bash

NAME=$1

cp templates/spec.md specs/$NAME.md
cp templates/instructions.md instructions/$NAME.md
cp templates/design.md design/$NAME.md
cp templates/tasks.md tasks/$NAME.md
cp templates/review.md reviews/$NAME.md
cp templates/diagnostic.md diagnostics/$NAME.md

echo "Feature scaffolding created for $NAME"
EOF

cat > scripts/new_bug.sh << 'EOF'
#!/bin/bash

NAME=$1

cp templates/diagnostic.md diagnostics/$NAME.md
cp templates/tasks.md tasks/$NAME.md

echo "Bug workflow created for $NAME"
EOF

cat > scripts/run_pipeline.sh << 'EOF'
#!/bin/bash

FEATURE=$1

echo "Running Architect Agent"
bash scripts/agent_architect.sh $FEATURE

echo "Running Planner Agent"
bash scripts/agent_planner.sh $FEATURE

echo "Running Coder Agent"
bash scripts/agent_coder.sh $FEATURE

echo "Running Reviewer Agent"
bash scripts/agent_reviewer.sh $FEATURE
EOF

########################################
# Agent scripts
########################################

cat > scripts/agent_architect.sh << 'EOF'
#!/bin/bash
FEATURE=$1
echo "Architect agent analyzing specs/$FEATURE.md"
EOF

cat > scripts/agent_planner.sh << 'EOF'
#!/bin/bash
FEATURE=$1
echo "Planner agent creating tasks from design/$FEATURE.md"
EOF

cat > scripts/agent_coder.sh << 'EOF'
#!/bin/bash
FEATURE=$1
echo "Coder agent implementing tasks for $FEATURE"
EOF

cat > scripts/agent_reviewer.sh << 'EOF'
#!/bin/bash
FEATURE=$1

echo "Reviewer agent running tests"

bash mcp/run_tests.sh
EOF

########################################
# MCP tools
########################################

cat > mcp/run_tests.sh << 'EOF'
#!/bin/bash
echo "Running tests..."
echo "(Add your test command here)"
EOF

cat > mcp/lint.sh << 'EOF'
#!/bin/bash
echo "Running lint..."
EOF

cat > mcp/build.sh << 'EOF'
#!/bin/bash
echo "Building project..."
EOF

########################################
# Templates
########################################

cat > templates/spec.md << 'EOF'
# Feature Specification

## Problem

## Requirements

## Inputs

## Outputs

## Edge Cases

## Constraints
EOF

cat > templates/instructions.md << 'EOF'
# Implementation Instructions

Derived from the specification.

## Responsibilities

## System Behaviour

## Constraints
EOF

cat > templates/design.md << 'EOF'
# Technical Design

## Architecture

## Components

## Data Flow

## Failure Modes

## Scalability
EOF

cat > templates/tasks.md << 'EOF'
# Task Breakdown

Task 1
Description:
Acceptance Criteria:

Task 2
Description:
Acceptance Criteria:
EOF

cat > templates/review.md << 'EOF'
# Engineering Review

## Code Quality

## Architecture Compliance

## Security

Decision:
EOF

cat > templates/diagnostic.md << 'EOF'
# Failure Diagnosis

## Observed Error

## Root Cause

## Proposed Fix
EOF

########################################
# Agent definitions
########################################

cat > agents/architect.md << 'EOF'
Role: Architect Agent
Converts specifications into architecture and instructions.
EOF

cat > agents/planner.md << 'EOF'
Role: Planner Agent
Breaks design into implementation tasks.
EOF

cat > agents/coder.md << 'EOF'
Role: Coding Agent
Implements tasks into source code.
EOF

cat > agents/reviewer.md << 'EOF'
Role: Review Agent
Runs tests and performs quality checks.
EOF

########################################
# Memory files
########################################

touch memory/design_patterns.md
touch memory/known_failures.md

########################################

chmod -R +x scripts
chmod -R +x mcp

echo ""
echo "AI development repository initialized."
echo ""
echo "Next steps:"
echo "1. git init"
echo "2. make feature NAME=my-feature"
echo ""
