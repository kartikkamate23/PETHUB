# PetHub Deployment

## Recommended: Railway

This project is now Docker-ready. Railway is a good fit because it can run the Tomcat Dockerfile and provide a MySQL service with a public app URL.

1. Push this project to GitHub.
2. Create a Railway project from the GitHub repo.
3. Add a MySQL service in the same Railway project.
4. In the app service variables, set one of these:
   - `MYSQL_URL` from Railway's MySQL service, or
   - `PETHUB_DB_URL`, `PETHUB_DB_USER`, `PETHUB_DB_PASSWORD`
5. Import `docs/local-pethub-bootstrap.sql` into the Railway MySQL database.
6. Deploy the app service. Railway will build the included `Dockerfile`.

The app will run at Railway's generated public domain. Because the Dockerfile deploys the WAR as `ROOT.war`, the homepage path is:

```txt
https://your-railway-domain/
```

## Local Tomcat

Local URL:

```txt
http://localhost:8080/PETHUB-main/Home1.jsp
```

Local database defaults:

```txt
Database: pethub
Username: root
Password: @Kartik123
```

Run the local schema/data setup:

```powershell
Get-Content -Raw docs\local-pethub-bootstrap.sql | & "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -h localhost -P 3306 -u root "-p@Kartik123"
```
