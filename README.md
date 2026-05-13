# Personal Cybersecurity Lab

![Security Checks](https://github.com/dparedes-sec/cybersecurity-lab/actions/workflows/security.yml/badge.svg)

> Hands-on penetration testing lab using intentionally vulnerable
> applications. Documents real attack scenarios with professional-format
> reports including evidence, CVSS scoring, CWE references, and remediation.

---

## Lab Environment

| Application      | Version  | Port | Purpose                  |
|------------------|----------|------|--------------------------|
| OWASP Juice Shop | v15.0.0  | 3000 | Node.js vulnerable app   |
| DVWA             | v1.10    | 8080 | PHP/MySQL vulnerable app |
| WebGoat          | latest   | 8888 | Java vulnerable app      |

**Tools used:** sqlmap · browser DevTools · OWASP ZAP

---

## Documented Findings

| # | Vulnerability | Severity | CVSS | App | CWE | Report |
|---|--------------|----------|------|-----|-----|--------|
| 01 | SQL Injection | HIGH | 8.8 | Juice Shop | CWE-89 | [Report](reports/01-sql-injection/REPORT.md) |
| 02 | Reflected XSS | MEDIUM | 6.1 | Juice Shop | CWE-79 | [Report](reports/02-xss-reflected/REPORT.md) |
| 03 | Path Traversal (BAC) | HIGH | 7.5 | DVWA | CWE-22 | [Report](reports/03-broken-access-control/REPORT.md) |

---

## OWASP Top 10 Coverage

See [OWASP_CHECKLIST.md](OWASP_CHECKLIST.md) for full coverage status.

---

## Quick Start

**Requirements:** Docker Desktop + WSL2 (Ubuntu) or Linux

```bash
git clone https://github.com/dparedes-sec/cybersecurity-lab
cd cybersecurity-lab
bash setup/lab-setup.sh
```

Access:
- Juice Shop: http://localhost:3000
- DVWA: http://localhost:8080 (admin / password) → Setup DVWA → Create / Reset Database
- WebGoat: http://localhost:8888/WebGoat

Stop the lab:

```bash
docker-compose -f setup/docker-compose.yml down
```

---

## Report Format

Each finding follows a professional pentest report structure:

**Metadata** (severity, CVSS, CWE, OWASP) →
**Description** → **Steps to Reproduce** →
**Evidence** (screenshots + tool output) →
**Impact** → **Remediation** → **References**

See [REPORT_TEMPLATE.md](reports/REPORT_TEMPLATE.md) for the template.

---

## Notes on Finding 03

Path traversal payload `../../../../etc/passwd` was accepted by the
server without sanitization. The server returned HTTP 200 OK with
`Content-Length: 1070`, confirming the input reached the filesystem.
File contents were not rendered due to `allow_url_include = Off` in
the PHP configuration — this is a container-level setting, not a
security control of the application itself.

---

## Tech Stack

![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)
![OWASP](https://img.shields.io/badge/OWASP-000000?style=flat&logo=owasp&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)

---

## Author

**Daniel Paredes**
Developer transitioning into AppSec & DevSecOps | Bioinformatics Security

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/daniel-paredes-ojeda/)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/dparedes-sec)