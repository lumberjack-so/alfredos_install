# AlfredOS

<div align="center">
  <img src="https://raw.githubusercontent.com/ssdavidai/alfred/main/client/public/assets/d7b05a15-8ff7-44a2-8457-41187acfceb0.png?token=GHSAT0AAAAAAC4XFY2ME5YLDV4GTUROOY242BDVFJQ" alt="AlfredOS Logo" width="200" />
  <p>Your complete business stack in a box — self-hosted, privacy-focused, and ready to launch</p>
  
  ![Status](https://img.shields.io/badge/status-active-success.svg)
  ![Docker](https://img.shields.io/badge/docker-powered-blue.svg)
  ![License](https://img.shields.io/badge/license-Proprietary-red.svg)
</div>

## 🚀 Overview

AlfredOS is a plug-and-play "business in a box" solution. It contains everything you need to run a small business online, all self-hosted and completely under your control. Say goodbye to subscription sprawl, vendor lock-in, and privacy concerns.

With a simple one-command setup, you'll get a complete stack of essential business tools deployed to your server or local machine. Everything runs in Docker containers, managed through an elegant dashboard interface.

## ✨ Features

- **Self-hosted**: Own your data, control your infrastructure
- **One-click deployment**: Simple installation process
- **Integrated dashboard**: Manage all services from one place
- **Containerized**: Each service isolated in its own Docker container
- **Auto-scaling**: Resources allocated as needed
- **HTTPS by default**: Secure connections out of the box
- **Real-time status**: Monitor your services at a glance
- **Start/stop control**: Enable only what you need, when you need it

## 📦 What's Included

AlfredOS currently includes these production-ready services:

| Service | Purpose | Port | Alternative To |
|---------|---------|------|---------------|
| **Dashboard** | Central control panel | 443 | Custom solution |
| **n8n** | Workflow automation platform | 8443 | Zapier, Integromat |
| **Kutt** | URL shortener and link manager | 8445 | Bitly, TinyURL |
| **NocoDB** | No-code database platform | 8444 | Airtable, Notion |

## 🛠️ Installation

### Quick Installation (With License Key)

Once you've purchased a license key, installation is simple:

```bash
# One-command installation with your license key
curl -fsSL https://install.alfredos.dev/start.sh | bash -s -- YOUR_LICENSE_KEY
```

This command will:
1. Validate your license key
2. Download the AlfredOS codebase
3. Run the installation script automatically

### Manual Installation Steps

If you prefer a step-by-step approach:

```bash
# 1. Download the installer script
curl -O https://install.alfredos.dev/start.sh
chmod +x start.sh

# 2. Run the installer with your license key
./start.sh YOUR_LICENSE_KEY

# 3. Change to the alfredos directory
cd alfred

# 4. Run the full installation process
./install.sh
```

### System Requirements

- A Linux server (Ubuntu 20.04+ recommended)
- Docker and Docker Compose
- 2GB RAM minimum (4GB+ recommended)
- 20GB free disk space
- Open ports: 80, 443, 8443-8445

### Deployment Options

<details>
<summary>Digital Ocean Droplet</summary>

```bash
# 1. Create a new 4GB RAM Ubuntu droplet
# 2. SSH into your droplet
# 3. Install AlfredOS with your license key
curl -fsSL https://install.alfredos.dev/start.sh | bash -s -- YOUR_LICENSE_KEY
```
</details>

<details>
<summary>Local Machine</summary>

```bash
# 1. Ensure Docker is installed first
# 2. Install AlfredOS with your license key
curl -fsSL https://install.alfredos.dev/start.sh | bash -s -- YOUR_LICENSE_KEY
# 3. Access at https://localhost/
```
</details>

## 🖥️ Usage

After installation, navigate to `https://your-server-ip/` to access the AlfredOS dashboard.

### Dashboard

The central dashboard shows all your services with their current status:
- 🔵 Blue: Service is running and ready to use
- 🔴 Red: Service is stopped but can be started
- ⚪ Gray: Service is unavailable/not installed

Click an app's icon to open it in a new tab, or use the power button to start/stop services as needed.

### Service URLs

All services are accessible via HTTPS on their dedicated ports:

- **Dashboard**: `https://your-server-ip/`
- **n8n**: `https://your-server-ip:8443/`
- **NocoDB**: `https://your-server-ip:8444/`
- **Kutt**: `https://your-server-ip:8445/`

## 🗺️ Roadmap

AlfredOS is continually expanding with new services. Here's what's coming next:

### Q2 2025
- **Gumroad**: Merchant of record solution for selling digital products
- **Supabase**: Self-hosted Firebase alternative with PostgreSQL
- **Jitsi**: Open-source video conferencing platform
- **Cal.com**: Scheduling infrastructure for everyone
- **Webstudio**: Visual website builder and CMS
- **Excalidraw**: Virtual whiteboard for sketching and collaboration
- **Cap**: Screen recording and sharing platform
- **Mattermost**: Secure workplace messaging

### Q3 2025
- **Alfred AI**: Native MCP-ready AI agent integrated with your entire stack
  - Zero configuration needed
  - Conversational interface
  - Execute cross-platform actions within your AlfredOS ecosystem
  - Advanced automation capabilities

## 🔧 Troubleshooting

Common issues and their solutions:

<details>
<summary>Services show as unavailable</summary>

1. Check if Docker containers are running:
```bash
docker ps
```

2. Ensure the Docker API service is accessible:
```bash
curl -s http://localhost:3001/api/docker/health
```

3. If containers aren't visible, restart the Docker API:
```bash
docker restart alfredos-docker-api
```
</details>

<details>
<summary>Certificate warnings in browser</summary>

AlfredOS uses self-signed certificates by default. You can:
1. Accept the self-signed certificate in your browser
2. Set up Let's Encrypt for proper SSL certificates
```bash
# Edit the install.sh file and set
ENABLE_LETSENCRYPT=true
DOMAIN_NAME="your-domain.com"
ADMIN_EMAIL="your-email@example.com"
```
</details>

<details>
<summary>License key validation fails</summary>

1. Ensure you're using the exact license key provided after purchase
2. Check your internet connection (needed to validate the license)
3. If you're behind a corporate firewall, ensure outbound HTTPS access to:
   - `ojflhjvssqramhexvclr.functions.supabase.co`
   - `github.com`
4. Contact support if problems persist
</details>

## 📅 Changelog

### May 9th, 2025
- Added **Supabase**: Self-hosted Firebase alternative with PostgreSQL
- Added **Activepieces**: Open-source alternative to Zapier and Make.com

## 📄 License

AlfredOS is a paid, closed-source product. All rights reserved. Unauthorized distribution, modification, or use is prohibited without a valid license.

For licensing information and pricing, please contact:
- Email: contact@alfredos.dev
- Preorder for $147 one off price: https://ssdavidai.gumroad.com/l/alfredos/alfredOS

## 🤝 Terms of Use

By using AlfredOS, you agree to the terms and conditions outlined in our license agreement provided upon purchase.

## 🔒 Feedback & Support

While AlfredOS is not open for public contributions as a closed-source product, we value your feedback and suggestions.

For customer support or to report issues:
- Email: david@szabostuban.com

## 🙏 Credits

AlfredOS bundles several open-source projects, each with their own licenses:
- [n8n](https://n8n.io/)
- [Kutt](https://kutt.it/)
- [NocoDB](https://nocodb.com/)

Special thanks to all the developers of these amazing projects.

---

<div align="center">
  <p>Built with ❤️ by the David Szabo-Stuban</p>
  <p>Questions? Need help? Join the <a href="https://join.lumberjack.so">Lumberjack community</a></p>
</div> 
