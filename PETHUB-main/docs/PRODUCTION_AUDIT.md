# Pethub Production Audit and Roadmap

Audit date: 2026-05-30

## Executive Summary

Pethub is currently an Eclipse Dynamic Web Project built with Java 17, Jakarta Servlet/JSP, Tomcat 10.x-style APIs, MySQL, JSP pages, and static assets. The application contains useful commerce and pet-care flows: registration, login, product browsing, cart, wishlist, orders, admin product/order management, reviews, appointment booking, health-care content, and an early chatbot servlet.

The project is not production-ready yet. The biggest risks are hard-coded database credentials, plain-text passwords, SQL injection exposure, missing authorization enforcement, no build/dependency management, JSP scriptlets with database/service calls, no migrations/schema, no automated tests, weak error handling, and an unsafe OpenAI integration stub. The safest modernization path is incremental: stabilize configuration and database access first, then authentication/authorization, then service/controller boundaries, then UX and AI features.

## Current Architecture

- `src/main/java/com/MVC/Controller`: servlet controllers mapped mostly with `@WebServlet`.
- `src/main/java/com/MVC/Model`: mixed POJOs plus database access classes. `Registration.java` is a large multi-purpose data/service class.
- `src/main/webapp`: JSP views, shared JSP includes, CSS/JS, and image/video assets.
- `src/main/webapp/WEB-INF/web.xml`: minimal Jakarta EE 6.0 descriptor with welcome files only.
- `src/main/webapp/WEB-INF/lib`: manually committed servlet API and MySQL connector jars.
- `build/classes`: compiled `.class` output is committed/generated inside the project.
- No `pom.xml`, `build.gradle`, `README`, Dockerfile, CI config, SQL schema, migration system, test tree, or environment template.

## Tech Stack Analysis

- Runtime: Java 17.
- Web framework: Jakarta Servlet and JSP.
- App server target: Tomcat 10.x based on Jakarta imports and `.classpath`.
- Database: MySQL, accessed through raw JDBC.
- Frontend: server-rendered JSP, inline CSS/JS, Bootstrap/jQuery/Font Awesome from CDNs, many static assets.
- AI: `ChatbotServlet` directly calls OpenAI chat completions through `HttpURLConnection`.

## Database Analysis

Observed tables include `user`, `admin`, `products`, `productdetails`, `cart`, `wishlist`, `orders`, `patient`, `review`, `contact`, and `animal`.

Main gaps:

- No schema or migration files are present.
- Database credentials are duplicated in model constructors.
- Raw JDBC connections are opened per model instance with no pooling.
- Many SQL statements use string concatenation.
- Several queries use `SELECT *`.
- Some domain structures are denormalized, such as order rows storing `group_concat(c_id)`.
- Indexing strategy is unknown and undocumented.
- Referential integrity, constraints, and transaction boundaries are not visible.

## API and Backend Analysis

Servlets handle request parsing, branching, session checks, business logic dispatch, and navigation in the same methods. `Register.java` handles registration, login, logout, profile update, forgot password, reset password, and dog-page redirect in one controller. `Registration.java` handles user, cart, wishlist, order, product, contact, animal, and review database operations.

Risks:

- Low separation of concerns.
- Hard to test because database access is not injectable.
- Missing consistent validation for request parameters.
- Missing consistent error responses and user-facing failures.
- Missing transaction handling for multi-step order creation.
- Admin operations rely on page visibility/session conventions instead of centralized authorization.

## Frontend and UX Analysis

The application has a broad page surface and many pet-related assets, but UI consistency is limited.

Issues:

- Large amounts of page-specific inline CSS.
- JSP scriptlets mix rendering with application logic.
- Repeated product card layouts across dog/cat/bird/fish pages.
- CDN dependencies are inconsistent across pages and versions.
- Several layouts use fixed widths/margins, which will hurt mobile responsiveness.
- Missing consistent loading, empty, error, and toast states.
- Accessibility is incomplete: labels, focus states, alt text quality, semantic controls, and keyboard flows need a pass.
- External image dependencies can break or slow production pages.

## Security Analysis

Critical issues:

- MySQL root credentials are hard-coded in source.
- User and admin passwords appear to be stored and compared as plain text.
- Multiple SQL injection paths exist through string-concatenated queries.
- No CSRF protection for state-changing POST actions.
- No centralized authentication filter or role-based access control.
- Admin status is inferred from `session.id == "1"` in some flows.
- Session hardening is absent: no cookie flags, fixation protection, timeout policy, or logout cleanup beyond invalidation.
- User-controlled output is rendered into JSP without systematic escaping, creating XSS risk.
- `ChatbotServlet` uses a placeholder API key constant and builds JSON by string concatenation.
- Exceptions print stack traces, which is unsuitable for production logs.

## Performance and Scalability Analysis

Key bottlenecks:

- No connection pool.
- Raw queries are repeated in page loads.
- No pagination for products, orders, users, reviews, or admin tables.
- Large static assets are served without an optimization plan.
- External CDN/image usage adds latency and reliability risks.
- `Registration.java` opens broad query access without caching or query boundaries.
- No application metrics, health checks, or slow-query visibility.

## Code Quality Analysis

Primary debt:

- `Registration.java` is over 700 lines and has too many responsibilities.
- Naming is inconsistent (`adminlogin`, `Dproduct`, `adminOrder`, mixed camel case).
- Model classes are both POJOs and database gateways.
- JSPs contain scriptlets and direct service construction.
- Build output is present in `build/classes`.
- No formatting/linting rules.
- No test suite.
- Charset is mostly `ISO-8859-1`, while modern apps should standardize on UTF-8.
- There are likely functional defects, including a `contactInfo` insert with five values but four placeholders.

## Production Readiness

Not ready for production deployment.

Missing:

- Build automation.
- Dependency management.
- Environment-based configuration.
- Secrets management.
- Schema migrations.
- Tests.
- CI/CD.
- Docker/deployment files.
- Structured logging.
- Health/readiness endpoints.
- Security headers and CSRF protection.
- Password hashing.
- Centralized authorization.
- Monitoring and audit logging.
- Deployment documentation.

## AI Integration Opportunities

Good candidates:

- AI pet-care assistant with clear medical disclaimers and escalation guidance.
- Product recommendation assistant based on pet type, age, breed, budget, and health needs.
- Smart product search and care article search.
- Appointment-prep summaries for pet symptoms.
- Review summarization and sentiment trends for admins.
- Admin product-description assistant.

Required architecture before launch:

- AI provider config from environment variables.
- Server-side service layer for AI calls.
- JSON-safe request/response handling.
- Prompt templates with guardrails.
- Usage logging with user/session correlation.
- Rate limiting and abuse prevention.
- Retry/timeouts and graceful fallback.
- No medical diagnosis claims.

## Prioritized Roadmap

### Phase 0: Baseline Safety

Goal: Make the project buildable, configurable, and safer without changing core behavior.

- Add Maven or Gradle build metadata.
- Remove committed/generated build output from normal workflow.
- Add `.gitignore`.
- Add `.env.example`.
- Centralize database configuration.
- Introduce a `Db` utility or `DataSourceProvider`.
- Replace hard-coded credentials with environment variables.
- Add a basic README with local setup.
- Add minimal smoke tests or compile checks.

### Phase 1: Security Hotfixes

Goal: Close the highest-risk production blockers.

- Hash passwords with BCrypt or Argon2.
- Migrate login/registration/reset flows to hashed passwords.
- Convert all SQL string concatenation to prepared statements.
- Add authentication and admin authorization filters.
- Add CSRF tokens for state-changing forms.
- Add input validation helpers.
- Escape user-controlled JSP output with JSTL/functions or view helpers.
- Fix unsafe chatbot JSON construction.

### Phase 2: Architecture Refactor

Goal: Separate web, service, repository, and domain layers.

- Create packages such as `config`, `domain`, `repository`, `service`, `web`, `security`, and `ai`.
- Split `Registration.java` into focused repositories/services.
- Move JSP data loading into servlets/controllers.
- Replace scriptlets with JSTL/EL where possible.
- Standardize request forwarding and redirects.
- Add global error pages and logging.

### Phase 3: Data and Order Reliability

Goal: Make commerce flows consistent and transactional.

- Add SQL schema and migrations.
- Normalize order/order-item storage.
- Add foreign keys and indexes.
- Add transaction handling for checkout.
- Add pagination for list pages.
- Add inventory/status fields if needed.

### Phase 4: Frontend Modernization

Goal: Improve UX while staying compatible with JSP.

- Build a shared CSS design system.
- Extract repeated product card/table/form patterns into includes or tag files.
- Make layouts responsive.
- Add consistent empty/error/loading/toast states.
- Standardize Bootstrap version or remove it.
- Localize or pin third-party assets.
- Improve accessibility.

### Phase 5: AI Features

Goal: Add production-safe AI capabilities.

- Create `AiService` and provider configuration.
- Replace direct OpenAI servlet code with a safe service layer.
- Add pet assistant endpoint with validation, rate limits, logs, and disclaimers.
- Add product recommendation and care-summary flows.
- Add admin usage reporting.

### Phase 6: Testing and Quality

Goal: Prevent regressions.

- Add JUnit 5.
- Add repository/service unit tests with test doubles.
- Add servlet/controller integration tests.
- Add UI smoke tests for major user journeys.
- Add formatter/checkstyle or Spotless.
- Add CI-friendly test reports.

### Phase 7: DevOps and Deployment

Goal: Make the app deployable.

- Add Dockerfile and Docker Compose with MySQL.
- Add health check servlet.
- Add GitHub Actions CI.
- Add production profile docs.
- Add deployment guides for Render/Railway/AWS-style targets.
- Add logging and monitoring readiness.

## Recommended First Implementation Slice

The safest first code change should be Phase 0 plus selected Phase 1 hotfixes:

1. Add Maven build and `.gitignore`.
2. Add centralized `AppConfig` and `Db` connection provider.
3. Replace duplicated hard-coded database credentials.
4. Fix the `contactInfo` SQL placeholder bug.
5. Convert the login/registration queries to prepared statements.
6. Add password hashing for new registrations while preserving a temporary compatibility path for existing plain-text users.

This gives the project a safer foundation without rewriting the whole app at once.
