# routing-examples Specification

## Purpose
TBD - created by archiving change add-large-routes. Update Purpose after archive.
## Requirements
### Requirement: Expanded route catalog for plugin validation
The application SHALL define a high-volume, diverse set of routes covering common and edge routing patterns (nested scopes, concerns, constraints, globbing, redirects, inline Rack apps, custom member/collection actions, HTTP verb variants, and defaults) to exercise Railroads plugin rendering.

#### Scenario: Main app route coverage expanded
- **WHEN** `bin/rails routes` is run in the main app
- **THEN** it lists an expanded set of routes that includes grouped namespaces/scopes, custom member and collection routes, glob patterns, constraint examples, inline Rack handlers, redirect helpers, and format/default variants

#### Scenario: Bulk section added for performance measurement
- **WHEN** reviewing `config/routes.rb`
- **THEN** a dedicated bulk section is present that statically lists hundreds of routes (no metaprogramming) to enable performance measurement and further growth toward ~2,000 routes

#### Scenario: Routes remain readable and grouped
- **WHEN** reviewing `config/routes.rb`
- **THEN** related routes are grouped with namespaces/scopes and brief comments so the large catalog is understandable without hunting through controllers and existing examples remain distinguishable from bulk additions

### Requirement: Engine route coverage for mountable contexts
Mounted engines SHALL include representative routes so the Railroads plugin can validate mounted namespaces alongside the main app.

#### Scenario: Engine routes expose multiple actions
- **WHEN** `bin/rails routes` includes mounted engines
- **THEN** each engine (`mountable_app`, `mountable_second_app`, and `full_app`) exposes more than a trivial route set (e.g., index/create plus at least one nested or custom action) to illustrate mounted route shapes and contribute to overall route volume

### Requirement: Bulk routes scaled by next thousand entries
The main app SHALL extend the `bulk` namespace with an additional ~1,000 static resource declarations that continue the existing `items_###` pattern, maintaining the same collection/member/nested log routes to push total route volume toward or beyond 2,000 without metaprogramming.

#### Scenario: Sequential thousand-item block appended
- **WHEN** inspecting the `config/routes.rb` bulk section
- **THEN** a new contiguous block of `resources :items_###` definitions exists for at least the next 1,000 indices after the current last item, each including `search` and `bulk_import` collection routes, `audit` and `toggle` member routes, and nested `logs` routes following the existing pattern

#### Scenario: Route listing reflects increased volume
- **WHEN** running `bin/rails routes` in the main app
- **THEN** the output includes roughly 1,000 additional entries attributable to the new bulk block, demonstrating the higher-volume catalog for plugin validation

