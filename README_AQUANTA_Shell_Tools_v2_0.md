# AQUANTA Framework v3.0

**Official Build System for aquanta.co.jp**

---

# Overview

The AQUANTA Framework is a lightweight static website framework developed for the AQUANTA website.

The framework automatically generates page metadata, validates the website, builds the sitemap and publishes the website while keeping the project entirely static.

Main goals:

- Single source of truth
- Static HTML
- SEO-friendly
- GitHub Pages compatible
- Cloudflare compatible
- Easy maintenance
- No external dependencies except Python 3

---

# Project Structure

```
aquanta-website/

│
├── AQUANTA_BUILD.sh          ← Main command launcher
│
├── components/
│   ├── head.html
│   ├── header.html
│   └── footer.html
│
├── data/
│   └── site.json             ← Central website configuration
│
├── assets/
│   ├── css/
│   ├── js/
│   ├── images/
│   ├── icons/
│   ├── fonts/
│   └── videos/
│
├── tools/
│   ├── build.sh
│   ├── head.py
│   ├── sitemap.sh
│   ├── check.sh
│   ├── publish.sh
│   ├── clean.sh
│   ├── version.sh
│   └── config.sh
│
├── about/
├── research/
├── technologies/
├── applications/
├── publications/
├── education/
├── consortium/
├── events/
├── news/
└── contact/
```

---

# Single Source of Truth

The entire framework is driven by

```
data/site.json
```

It contains

- website configuration
- metadata
- navigation
- page definitions
- assets

No page-specific metadata should be edited inside HTML files.

---

# HTML Components

## head.html

Contains the HTML template used for generating

- title
- meta description
- canonical
- favicon
- CSS
- JavaScript

Generated during build.

---

## header.html

Shared page header.

Loaded dynamically by

```
assets/js/aquanta-core.js
```

---

## footer.html

Shared page footer.

Loaded dynamically.

---

# Build Process

```
AQUANTA_BUILD.sh build

        │

        ▼

tools/build.sh

        │

        ▼

head.py

        │

        ▼

Generate every <head>

        │

        ▼

sitemap.sh

        │

        ▼

check.sh
```

---

# Shell Scripts

## AQUANTA_BUILD.sh

Main entry point.

Usage

```
./AQUANTA_BUILD.sh build
```

Available commands

- build
- publish
- check
- sitemap
- clean
- version

---

## build.sh

Main build procedure.

Responsibilities

- execute head.py
- generate page metadata
- generate sitemap
- validate website

---

## sitemap.sh

Generates

```
sitemap.xml
```

using

```
data/site.json
```

---

## check.sh

Performs project validation.

Checks include

- missing title
- missing description
- missing canonical
- missing CSS
- missing JavaScript
- broken links
- missing assets
- HTML validation

No files are modified.

---

## publish.sh

Runs

```
build
```

then executes

```
git add
git commit
git push
```

Used for deployment.

---

## clean.sh

Removes temporary files generated during build.

Never deletes source files.

---

## version.sh

Single source of version information.

Provides

- framework version
- build timestamp
- CSS version
- JavaScript version

Used by every build script.

---

## config.sh

Framework configuration.

Contains

- directories
- constants
- project settings

No page-specific information should be placed here.

---

# Python Tools

## head.py

Reads

```
data/site.json
```

Generates

```
<head>...</head>
```

for every page.

The placeholder

```
<!-- BUILD:HEAD -->
```

is replaced automatically.

HTML pages must never be edited manually inside the `<head>` section.

---

# Runtime Components

Loaded after page rendering.

```
header.html
footer.html
```

via

```
aquanta-core.js
```

---

# Editing Workflow

## Change website title

Edit

```
data/site.json
```

---

## Change meta description

Edit

```
data/site.json
```

---

## Change favicon

Edit

```
components/head.html
```

---

## Change navigation

Edit

```
components/header.html
```

---

## Change footer

Edit

```
components/footer.html
```

---

## Change page content

Edit the corresponding

```
index.html
```

Do not edit

```
<head>
```

manually.

---

# Build

```
./AQUANTA_BUILD.sh build
```

---

# Publish

```
./AQUANTA_BUILD.sh publish
```

---

# Design Principles

The framework follows five principles.

1. Single Source of Truth

2. Static HTML Output

3. SEO First

4. Component-Based Layout

5. Automated Build

---

# Future Roadmap

Planned modules

- robots.py
- search.py
- rss.py
- manifest.py
- Open Graph generator
- JSON-LD generator
- Multi-language support
- Automatic image optimization
- Automatic asset fingerprinting

---

© AQUANTA Co., Ltd.
AQUANTA Framework v3.0