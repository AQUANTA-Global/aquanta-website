# AQUANTA Shell Tools v2.0

Integrated Bash build system for the AQUANTA GitHub Pages site.

## Files

```text
tools/
├── build.sh
├── version.sh
├── check.sh
├── sitemap.sh
├── publish.sh
├── clean.sh
└── config.sh

AQUANTA_BUILD.sh
```

## Install

Copy `tools/` and `AQUANTA_BUILD.sh` to the root of the `aquanta-website` repository.

```bash
chmod +x AQUANTA_BUILD.sh tools/*.sh
```

## Commands

```bash
./AQUANTA_BUILD.sh build
./AQUANTA_BUILD.sh check
./AQUANTA_BUILD.sh sitemap
./AQUANTA_BUILD.sh clean
./AQUANTA_BUILD.sh publish "Update AQUANTA production site"
```

`build` updates CSS/JS cache-busting query strings, writes `build-version.txt`, regenerates `sitemap.xml`, and runs production checks.
