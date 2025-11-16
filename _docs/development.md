---
layout: default
title: Development Guide
---

# Development Guide

This guide covers setting up and working with the ByteLab Studio workspace.

## Workspace Overview

The ByteLab Studio workspace contains multiple projects focused on creating a comprehensive development environment:

```
../ByteLabs-Studio/
├── ByteLab/           # Main Tauri application - primary focus
├── dashboard/         # Next.js web Homepage
├── docs/             # This documentation site
├── BL-Visualizer/    # Visualization tools
├── studio-dashboard/ # Additional dashboard components
└── homebrew-tap/     # Homebrew package management
```

## Current Development Focus

### ByteLab (Main Application)

The primary development effort is focused on **ByteLab**, the main desktop application built with Tauri. This is the core product that requires active development.

**Technology Stack:**
- **Frontend**: React/Vue.js (in Tauri webview)
- **Backend**: Rust (Tauri)
- **Build**: Cargo + npm scripts

### Supporting Projects

Additional components in the workspace include:

- **Dashboard**: Next.js 14 web interface with TypeScript and Tailwind CSS
- **Documentation**: This Jekyll site with Markdown content
- **BL-Visualizer**: Specialized visualization tools
- **studio-dashboard**: Extended dashboard functionality
- **homebrew-tap**: Package management for distribution

## Development Workflow

1. **Primary Development**: Work in `/ByteLab/` for the main desktop application
2. **Documentation**: Update this site in `/docs/` as features evolve
3. **Supporting Components**: Dashboard and other tools complement the main application

## Contributing

1. Fork the repository
2. Create a feature branch for ByteLab development
3. Make your changes to the main application
4. Update documentation as needed
5. Submit a pull request

## Getting Help

- Check the ByteLab README in `/ByteLab/`
- Review the [API Reference](_docs/api.md)
- Open an issue on GitHub for specific questions
