package com.MVC.Config;

import java.net.URI;

public final class AppConfig {
    private static final String DEFAULT_DB_URL = "jdbc:mysql://localhost:3306/pethub";
    private static final String DEFAULT_DB_USER = "root";
    private static final String DEFAULT_DB_PASSWORD = "@Kartik123";

    private AppConfig() {
    }

    public static String dbUrl() {
        String configured = value("PETHUB_DB_URL", "pethub.db.url", "");
        if (!configured.isBlank()) {
            return configured;
        }

        DatabaseUrl cloudUrl = cloudDatabaseUrl();
        if (cloudUrl != null) {
            return cloudUrl.jdbcUrl();
        }

        return DEFAULT_DB_URL;
    }

    public static String dbUser() {
        String configured = value("PETHUB_DB_USER", "pethub.db.user", "");
        if (!configured.isBlank()) {
            return configured;
        }

        DatabaseUrl cloudUrl = cloudDatabaseUrl();
        if (cloudUrl != null && !cloudUrl.username().isBlank()) {
            return cloudUrl.username();
        }

        return DEFAULT_DB_USER;
    }

    public static String dbPassword() {
        String configured = value("PETHUB_DB_PASSWORD", "pethub.db.password", "");
        if (!configured.isBlank()) {
            return configured;
        }

        DatabaseUrl cloudUrl = cloudDatabaseUrl();
        if (cloudUrl != null && !cloudUrl.password().isBlank()) {
            return cloudUrl.password();
        }

        return DEFAULT_DB_PASSWORD;
    }

    public static String openAiApiKey() {
        return value("PETHUB_OPENAI_API_KEY", "pethub.openai.apiKey", "");
    }

    private static String value(String envName, String propertyName, String defaultValue) {
        String property = System.getProperty(propertyName);
        if (property != null && !property.isBlank()) {
            return property;
        }

        String env = System.getenv(envName);
        if (env != null && !env.isBlank()) {
            return env;
        }

        return defaultValue;
    }

    private static DatabaseUrl cloudDatabaseUrl() {
        String raw = System.getenv("MYSQL_URL");
        if (raw == null || raw.isBlank()) {
            raw = System.getenv("DATABASE_URL");
        }
        if (raw == null || raw.isBlank()) {
            return null;
        }

        try {
            URI uri = URI.create(raw);
            String host = uri.getHost();
            int port = uri.getPort() > 0 ? uri.getPort() : 3306;
            String database = uri.getPath() == null ? "" : uri.getPath().replaceFirst("^/", "");
            String userInfo = uri.getUserInfo() == null ? "" : uri.getUserInfo();
            String username = "";
            String password = "";
            int separator = userInfo.indexOf(':');
            if (separator >= 0) {
                username = userInfo.substring(0, separator);
                password = userInfo.substring(separator + 1);
            } else {
                username = userInfo;
            }

            if (host == null || host.isBlank() || database.isBlank()) {
                return null;
            }

            return new DatabaseUrl("jdbc:mysql://" + host + ":" + port + "/" + database, username, password);
        } catch (Exception e) {
            return null;
        }
    }

    private record DatabaseUrl(String jdbcUrl, String username, String password) {
    }
}
