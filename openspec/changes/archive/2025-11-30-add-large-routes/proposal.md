# Change: Expand route catalog for plugin coverage

## Why
The Railroads plugin needs a much larger and more varied set of Rails routes to validate rendering, edge cases, and performance at scale. We want to measure behavior around ~2,000 routes, including deep namespace nesting, to mirror large projects.

## What Changes
- Add a high-volume, mixed route set to the main app (and engines where useful) covering nested scopes, constraints, redirects, inline Rack apps, concerns, member/collection actions, globbing, defaults, and HTTP verb variants.
- Introduce a dedicated bulk section (static listing, not metaprogramming) to add hundreds of routes while keeping existing examples readable and separated.
- Stage the increase: first +300–500 static routes, measure `rails routes` output/perf, then grow toward ~2,000 including deep namespaces and mounted engines; record observations.
- Keep routes organized and readable with grouping, comments, and minimal controller surface (stubs only when needed for routing).
- Document and test expected route outputs so `bin/rails routes` remains a reliable reference for the plugin.

## Impact
- Affected specs: routing-examples
- Affected code: config/routes.rb, engine route files, minimal controllers/tests as needed
