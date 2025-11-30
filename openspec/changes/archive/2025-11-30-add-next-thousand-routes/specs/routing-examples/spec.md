## ADDED Requirements
### Requirement: Bulk routes scaled by next thousand entries
The main app SHALL extend the `bulk` namespace with an additional ~1,000 static resource declarations that continue the existing `items_###` pattern, maintaining the same collection/member/nested log routes to push total route volume toward or beyond 2,000 without metaprogramming.

#### Scenario: Sequential thousand-item block appended
- **WHEN** inspecting the `config/routes.rb` bulk section
- **THEN** a new contiguous block of `resources :items_###` definitions exists for at least the next 1,000 indices after the current last item, each including `search` and `bulk_import` collection routes, `audit` and `toggle` member routes, and nested `logs` routes following the existing pattern

#### Scenario: Route listing reflects increased volume
- **WHEN** running `bin/rails routes` in the main app
- **THEN** the output includes roughly 1,000 additional entries attributable to the new bulk block, demonstrating the higher-volume catalog for plugin validation
