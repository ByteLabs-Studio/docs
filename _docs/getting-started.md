---
layout: default
title: Getting Started
---

# Getting Started

This guide will help you get up and running with your documentation site.

## Prerequisites

- A GitHub account
- Basic knowledge of Markdown
- Ruby installed locally (for development)

## Local Development

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Run the local server:
   ```bash
   bundle exec jekyll serve
   ```

3. Open your browser to `http://localhost:4000`

## Deployment

This site is configured to work with both Read the Docs and GitHub Pages:

- **Read the Docs**: Automatically builds when you push to your repository
- **GitHub Pages**: Can be enabled in your repository settings

## Writing Documentation

- Create new files in the `_docs` directory
- Use proper YAML front matter
- Follow Markdown best practices
