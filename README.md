# AWS Serverless Web Architecture & Automated CI/CD Pipeline

A production-ready, secure, and fully automated serverless web hosting infrastructure built on AWS. This project demonstrates modern cloud architecture, secure content delivery, infrastructure hardening, and deployment automation for a static website using Amazon S3, Amazon CloudFront, Cloudflare, and AWS CLI.

---

## 🏗️ Architecture Design

- **Frontend Hosting:** Amazon S3 configured as a private object storage bucket with all public access blocked.
- **Global Content Delivery:** Amazon CloudFront CDN providing low-latency content delivery through AWS edge locations.
- **DNS & Edge Security:** Cloudflare DNS configured with **Full (Strict)** SSL/TLS encryption to ensure secure end-to-end HTTPS communication while preventing redirect loops.
- **Origin Protection:** AWS Origin Access Control (OAC) restricts direct access to the S3 bucket, allowing content to be served only through CloudFront.
- **Secure Transport:** AWS Certificate Manager (ACM) provides managed SSL/TLS certificates for encrypted HTTPS connections.
- **Production Security Hardening:** CloudFront Response Headers Policy configured to enforce modern browser security controls.

![Architecture](https://raw.githubusercontent.com/hafizshah101-code/Infrastructure-Only/refs/heads/main/aws-serverless-architecture.png)

---

## 🔒 Security Hardening

To improve the security posture of the production website, a custom **AWS CloudFront Response Headers Policy** was implemented and attached to the default CloudFront behavior.

### Implemented Security Headers

| Header | Purpose |
|---------|---------|
| **HTTP Strict Transport Security (HSTS)** | Forces browsers to use HTTPS and protects against SSL stripping attacks. |
| **Content Security Policy (CSP)** | Restricts where scripts, styles, fonts, and other resources can be loaded from, mitigating Cross-Site Scripting (XSS). |
| **X-Frame-Options** | Prevents clickjacking by blocking the website from being embedded in iframes. |
| **X-Content-Type-Options** | Prevents MIME-type sniffing attacks. |
| **Referrer-Policy** | Controls how much referrer information is shared with external websites. |
| **Permissions-Policy** | Restricts browser features such as camera, microphone, geolocation, USB, and other sensitive APIs. |

### Validation

The implementation was validated using **SecurityHeaders.com**, successfully improving the website's security posture:

| Before | After |
|---------|-------|
| ❌ Grade F | ✅ Grade A |

---

## 🚀 DevOps Automation (CI/CD)

The included `deploy.sh` script automates the complete deployment workflow from either a local machine or AWS CloudShell.

### Deployment Workflow

1. Synchronizes only modified website assets to the private Amazon S3 bucket using the AWS CLI.
2. Preserves directory structure while removing obsolete files from the bucket.
3. Automatically creates a CloudFront cache invalidation (`/*`) to ensure the latest version is served globally.
4. Eliminates manual deployment steps and reduces deployment time to a single command.

---

## 🎯 Skills Demonstrated

- Amazon S3 Static Website Hosting
- Amazon CloudFront CDN
- AWS Origin Access Control (OAC)
- AWS Certificate Manager (ACM)
- Cloudflare DNS & SSL/TLS
- HTTP Security Headers
- Web Security Hardening
- HTTPS Enforcement
- Content Delivery Networks (CDN)
- AWS CLI Automation
- Bash Scripting
- CI/CD Automation
- Cloud Infrastructure
- Security Best Practices
- Production Deployment

## ✨ Architecture Highlights

- ✅ Fully Serverless Frontend
- ✅ Private Amazon S3 Bucket
- ✅ CloudFront Global CDN
- ✅ AWS Origin Access Control (OAC)
- ✅ Cloudflare DNS & SSL/TLS
- ✅ HTTPS Everywhere (ACM)
- ✅ HTTP Security Headers (Grade A)
- ✅ Automated CI/CD Deployment