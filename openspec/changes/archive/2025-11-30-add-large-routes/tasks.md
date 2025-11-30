## 1. Context
- [x] 1.1 Review current routes in main app and engines; catalog missing patterns to add (deep namespaces, concerns, globbing, redirects, inline Rack apps, defaults, HTTP verb variants)
- [x] 1.2 Decide grouping strategy to keep large route set readable (dedicated bulk namespace, comments, separation from existing samples)

## 2. Implementation
- [x] 2.1 Add static bulk route listings to `config/routes.rb` (+300〜500 routes first pass) covering nested scopes, constraints, redirects, inline Rack apps, concerns, member/collection actions, globbing, defaults, and verb variants
- [x] 2.2 Add complementary bulk routes to mounted engines (`mountable_app`, `mountable_second_app`, `full_app`) to exercise mounted namespace behavior; keep routes organized
- [ ] 2.3 Create minimal controllers/actions or Rack stubs only when required to satisfy routing or tests
- [x] 2.4 Add comments documenting bulk sections, deep namespaces, and unusual patterns for Railroads validation
- [x] 2.5 Stage growth toward ~2,000 routes (main + engines) after initial measurements; keep routes static (no metaprogramming)

## 3. Validation
- [ ] 3.1 Run `bin/rails routes` to verify new routes render correctly and capture timing/output size for performance notes
- [ ] 3.2 Run `bin/rails test` to ensure test suite passes with new routes/controllers
- [ ] 3.3 Update README or supporting docs if new route categories or performance notes need explanation
