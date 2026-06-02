# Pethub

Pethub is a Java/Jakarta Servlet and JSP web application for pet products, pet care content, cart/wishlist/order flows, reviews, appointments, admin product management, and an AI assistant prototype.

## Current Stack

- Java 17
- Jakarta Servlet 6 / JSP
- Tomcat 10.x compatible runtime
- MySQL
- Maven WAR build

## Local Configuration

Copy `.env.example` into your local environment manager or set these variables before running Tomcat:

```txt
PETHUB_DB_URL=jdbc:mysql://localhost:3306/PetHub
PETHUB_DB_USER=root
PETHUB_DB_PASSWORD=
PETHUB_OPENAI_API_KEY=
```

The app also accepts matching JVM system properties:

```txt
pethub.db.url
pethub.db.user
pethub.db.password
pethub.openai.apiKey
```

## Build

```bash
mvn clean package
```

The WAR is produced at:

```txt
target/pethub.war
```

Deploy that WAR to a Tomcat 10.x server.

## Production Audit

See `docs/PRODUCTION_AUDIT.md` for the current architecture audit, risk report, and phased production-readiness roadmap.
