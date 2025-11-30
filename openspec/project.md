# Project Context

## Purpose
A Rails 7.1 sample app that demonstrates a wide variety of routing patterns for the JetBrains Railroads plugin. Used to validate route rendering and coverage rather than to ship product features.

## Tech Stack
- Ruby 3.2.3, Rails 7.1.3.2
- SQLite (dev/test), Puma server, Sprockets asset pipeline
- Importmap + Hotwire (Turbo, Stimulus); Minitest for tests
- Dockerfile available for containerized runs

## Project Conventions

### Code Style
- Idiomatic Ruby with 2-space indentation; snake_case methods/vars, CamelCase classes/modules
- Keep controllers minimal; many routes exist without controllers on purpose
- Prefer readable grouped routes (`namespace`, `scope`) with brief comments for unusual patterns
- Shared helpers live in `lib/`; avoid adding logic unless needed for tests

### Architecture Patterns
- Main Rails app under `app/` with routes in `config/routes.rb` and initializers in `config/initializers/`
- Additional route experiments via engines: `full_app/`, `mountable_app/`, `mountable_second_app/` each with their own `app/`, `config/`, and `test/`
- Reusable helpers/extensions in `lib/`; generated assets under `public/`
- Entry points in `bin/`; Docker/Docker entrypoint provided for container use

### Testing Strategy
- Default to Minitest (`test/` plus engine-specific `test/`)
- Run `bin/rails test` from repo root to cover core app and engines
- Inspect routes with `bin/rails routes`; use `bin/rails s` for manual route validation when needed

### Git Workflow
- Short, imperative commit subjects (e.g., `Add nested constraint route sample`)
- Group related route additions together; reference relevant issues/tickets when applicable
- Run `bin/rails test` before submitting changes; keep unrelated changes out of commits

## Domain Context
- Primary goal is comprehensive route coverage for the Railroads plugin; correctness of controllers/views is secondary
- Many routes intentionally lack controllers to test edge route cases

## Important Constraints
- Avoid introducing new business logic unless required for route coverage or tests
- Preserve route readability and grouping conventions; keep controllers minimal
- Follow Ruby/Rails idioms and existing project structure

## External Dependencies
- JetBrains Railroads plugin is the consumer of the route outputs
- SQLite database files for local/dev use; no other external services assumed
