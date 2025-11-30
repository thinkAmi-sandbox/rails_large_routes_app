<!-- OPENSPEC:START -->
# OpenSpec Instructions

These instructions are for AI assistants working in this project.

Always open `@/openspec/AGENTS.md` when the request:
- Mentions planning or proposals (words like proposal, spec, change, plan)
- Introduces new capabilities, breaking changes, architecture shifts, or big performance/security work
- Sounds ambiguous and you need the authoritative spec before coding

Use `@/openspec/AGENTS.md` to learn:
- How to create and apply change proposals
- Spec format and conventions
- Project structure and guidelines

Keep this managed block so 'openspec update' can refresh the instructions.

<!-- OPENSPEC:END -->

# Repository Guidelines

## Project Structure & Module Organization
- Main Rails app lives in `app/` with routes in `config/routes.rb` and initializers in `config/initializers/`.
- Engines and variations for route experiments: `full_app/`, `mountable_app/`, and `mountable_second_app/` each contain their own `app/`, `config/`, and `test/`.
- Reusable helpers and extensions belong in `lib/`; generated assets are under `public/`.
- Tests sit in `test/` (plus engine-specific `test/` directories). Database schema and seeds are in `db/`.
- `bin/` provides project entrypoints; `Dockerfile` and `docker-entrypoint` support container use.

## Build, Test, and Development Commands
- `bundle install` — install Ruby and Rails dependencies (run after cloning or Gem changes).
- `bin/setup` — prep the app: install gems, set up DB, and run pending migrations.
- `bin/rails s` — start the app on `http://localhost:3000`; use to validate routes visually.
- `bin/rails routes` — inspect route definitions; useful when adjusting examples for the Railroads plugin.
- `bin/rails test` — run the test suite (core app + engines when invoked from the repo root).
- `docker build -t rails-large-routes .` and `docker run --rm -p 3000:3000 rails-large-routes` — containerized run; ensure database files are writable if mounting volumes.

## Coding Style & Naming Conventions
- Follow idiomatic Ruby: 2-space indentation, snake_case for methods/variables, CamelCase for classes/modules.
- Keep routes readable: prefer grouped namespaces and `scope` blocks; add brief comments when adding unusual route patterns.
- Keep controllers minimal—many examples exist purely for route coverage; avoid adding logic unless required for tests.
- Prefer placing shared helpers in `lib/` and requiring them explicitly from initializers or controllers that need them.

## Testing Guidelines
- Default test framework is Minitest (`test/`); mirror paths of code under test (e.g., `test/controllers/...`).
- Name tests with clear intent (e.g., `test_shows_nested_route_on_index`).
- Run `bin/rails test` before submitting; include regression tests for new route shapes or edge cases you introduce.

## Commit & Pull Request Guidelines
- Use short, imperative commit subjects (e.g., `Add nested constraint route sample`); group related route additions together.
- Reference relevant issues or plugin tickets in the body when applicable.
- Pull requests should describe the route patterns touched, any new controllers/helpers, and testing performed; add screenshots or `bin/rails routes` excerpts when they clarify behavior.
