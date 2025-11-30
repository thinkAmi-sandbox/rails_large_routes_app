# Change: Add next thousand bulk routes

## Why
The bulk route catalog currently targets high volume for plugin validation but needs another large block to push toward the ~2,000-route goal and exercise performance.

## What Changes
- Extend the `bulk` namespace with roughly 1,000 additional static resource declarations that mirror the existing pattern (collection/member actions plus nested logs) to lift total route count.
- Keep the bulk section readable with contiguous numbering and light comments instead of metaprogramming or helpers.
- Confirm route generation remains valid after the expansion (app boots and routes list renders).

## Impact
- Affected specs: routing-examples
- Affected code: config/routes.rb bulk section; any route count checks or documentation that cite totals
