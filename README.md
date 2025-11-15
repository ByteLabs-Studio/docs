# Documentation Site

A basic documentation site built with Jekyll and configured for Read the Docs.

## Features

- **Jekyll** for static site generation
- **Read the Docs** compatibility
- **GitHub Pages** support
- **Markdown** documentation
- **Responsive design**

## Quick Start

1. Clone this repository
2. Install dependencies: `bundle install`
3. Run locally: `bundle exec jekyll serve`
4. Visit `http://localhost:4000`

## Deployment

### Read the Docs

1. Connect your GitHub repository to Read the Docs
2. Configure your `.readthedocs.yaml` file
3. Push changes to trigger builds

### GitHub Pages

1. Enable GitHub Pages in your repository settings
2. Choose the source branch (usually `main` or `gh-pages`)
3. Push changes to trigger deployments

## Documentation Structure

```
docs/
├── index.md              # Homepage
├── _docs/               # Documentation collection
│   ├── getting-started.md
│   ├── api.md
│   └── examples.md
├── _layouts/            # Jekyll layouts
│   └── default.html
├── _config.yml          # Jekyll configuration
├── Gemfile              # Ruby dependencies
└── .readthedocs.yaml    # Read the Docs configuration
```

## Writing Documentation

- Create new files in the `_docs` directory
- Use proper YAML front matter
- Follow Markdown syntax
- Link between documents using relative paths

## Customization

- Edit `_config.yml` to change site settings
- Modify `_layouts/default.html` to change the layout
- Add custom CSS in `assets/css/`
- Extend with Jekyll plugins as needed
