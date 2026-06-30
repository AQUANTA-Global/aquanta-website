@echo off
setlocal EnableExtensions
title AQUANTA Website Structure Creator v2
color 0B

echo.
echo ============================================================
echo        AQUANTA Website Structure Creator v2
echo ============================================================
echo.

REM Run this file inside your project folder, for example:
REM C:\WORK\aquanta-website
REM The script creates folders and starter files.
REM Existing files are NOT overwritten.

REM ============================================================
REM FOLDERS
REM ============================================================

for %%D in (
about
research
research\aquaphotomics
research\health
research\agriculture
research\food
research\water-science
research\environment
research\ai-digital-twins
technologies
applications
publications
education
consortium
events
news
contact
assets
assets\css
assets\js
assets\images
assets\videos
assets\icons
assets\fonts
components
data
docs
) do (
    if not exist "%%D" mkdir "%%D"
)

REM ============================================================
REM ROOT FILES
REM ============================================================

if not exist ".gitignore" (
> ".gitignore" echo # AQUANTA website
>> ".gitignore" echo .DS_Store
>> ".gitignore" echo Thumbs.db
>> ".gitignore" echo node_modules/
>> ".gitignore" echo .env
)

if not exist "README.md" (
> "README.md" echo # AQUANTA Website
>> "README.md" echo.
>> "README.md" echo Scientific corporate website for AQUANTA Inc.
>> "README.md" echo.
>> "README.md" echo Main colors:
>> "README.md" echo - Text: #FFFFFF
>> "README.md" echo - Common background: #113959
>> "README.md" echo - Card background: #00577a
)

if not exist "robots.txt" (
> "robots.txt" echo User-agent: *
>> "robots.txt" echo Allow: /
>> "robots.txt" echo.
>> "robots.txt" echo Sitemap: https://aquanta.jp/sitemap.xml
)

if not exist "sitemap.xml" (
> "sitemap.xml" echo ^<?xml version="1.0" encoding="UTF-8"?^>
>> "sitemap.xml" echo ^<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"^>
>> "sitemap.xml" echo   ^<url^>^<loc^>https://aquanta.jp/^</loc^>^</url^>
>> "sitemap.xml" echo ^</urlset^>
)

REM ============================================================
REM CSS
REM ============================================================

if not exist "assets\css\aquanta-theme.css" (
> "assets\css\aquanta-theme.css" echo :root {
>> "assets\css\aquanta-theme.css" echo   --text: #FFFFFF;
>> "assets\css\aquanta-theme.css" echo   --bg-main: #113959;
>> "assets\css\aquanta-theme.css" echo   --bg-card: #00577a;
>> "assets\css\aquanta-theme.css" echo   --accent: #47d7ff;
>> "assets\css\aquanta-theme.css" echo   --accent-soft: #8ee9ff;
>> "assets\css\aquanta-theme.css" echo   --border: rgba(255,255,255,0.22);
>> "assets\css\aquanta-theme.css" echo   --header-h: 64px;
>> "assets\css\aquanta-theme.css" echo   --footer-h: 36px;
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo * { box-sizing: border-box; }
>> "assets\css\aquanta-theme.css" echo html, body { margin: 0; padding: 0; height: 100%%; }
>> "assets\css\aquanta-theme.css" echo body {
>> "assets\css\aquanta-theme.css" echo   font-family: Arial, Helvetica, sans-serif;
>> "assets\css\aquanta-theme.css" echo   background: var(--bg-main);
>> "assets\css\aquanta-theme.css" echo   color: var(--text);
>> "assets\css\aquanta-theme.css" echo   line-height: 1.45;
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo a { color: var(--text); text-decoration: none; }
>> "assets\css\aquanta-theme.css" echo a:hover { color: var(--accent-soft); }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .site-header {
>> "assets\css\aquanta-theme.css" echo   position: fixed;
>> "assets\css\aquanta-theme.css" echo   top: 0;
>> "assets\css\aquanta-theme.css" echo   left: 0;
>> "assets\css\aquanta-theme.css" echo   right: 0;
>> "assets\css\aquanta-theme.css" echo   height: var(--header-h);
>> "assets\css\aquanta-theme.css" echo   z-index: 1000;
>> "assets\css\aquanta-theme.css" echo   background: rgba(17,57,89,0.97);
>> "assets\css\aquanta-theme.css" echo   border-bottom: 1px solid var(--border);
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .header-inner {
>> "assets\css\aquanta-theme.css" echo   height: 100%%;
>> "assets\css\aquanta-theme.css" echo   max-width: 1500px;
>> "assets\css\aquanta-theme.css" echo   margin: 0 auto;
>> "assets\css\aquanta-theme.css" echo   padding: 0 14px;
>> "assets\css\aquanta-theme.css" echo   display: flex;
>> "assets\css\aquanta-theme.css" echo   align-items: center;
>> "assets\css\aquanta-theme.css" echo   justify-content: space-between;
>> "assets\css\aquanta-theme.css" echo   gap: 12px;
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .brand {
>> "assets\css\aquanta-theme.css" echo   font-size: 1.35rem;
>> "assets\css\aquanta-theme.css" echo   font-weight: 700;
>> "assets\css\aquanta-theme.css" echo   letter-spacing: 0.12em;
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .nav {
>> "assets\css\aquanta-theme.css" echo   display: flex;
>> "assets\css\aquanta-theme.css" echo   flex-wrap: wrap;
>> "assets\css\aquanta-theme.css" echo   justify-content: flex-end;
>> "assets\css\aquanta-theme.css" echo   gap: 8px 12px;
>> "assets\css\aquanta-theme.css" echo   font-size: 0.92rem;
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .lang { border-left: 1px solid var(--border); padding-left: 10px; }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo main {
>> "assets\css\aquanta-theme.css" echo   padding-top: var(--header-h);
>> "assets\css\aquanta-theme.css" echo   padding-bottom: var(--footer-h);
>> "assets\css\aquanta-theme.css" echo   min-height: 100vh;
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .container {
>> "assets\css\aquanta-theme.css" echo   max-width: 1500px;
>> "assets\css\aquanta-theme.css" echo   margin: 0 auto;
>> "assets\css\aquanta-theme.css" echo   padding: 14px;
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .hero {
>> "assets\css\aquanta-theme.css" echo   padding: 28px 14px 18px;
>> "assets\css\aquanta-theme.css" echo   border-bottom: 1px solid var(--border);
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .hero h1 {
>> "assets\css\aquanta-theme.css" echo   margin: 0 0 8px;
>> "assets\css\aquanta-theme.css" echo   font-size: clamp(2rem, 4vw, 4rem);
>> "assets\css\aquanta-theme.css" echo   line-height: 1.05;
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .hero p { margin: 0; max-width: 900px; font-size: 1.05rem; }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .section { padding: 12px 0; }
>> "assets\css\aquanta-theme.css" echo .section h2 { margin: 0 0 8px; font-size: 1.55rem; }
>> "assets\css\aquanta-theme.css" echo .section p { margin: 0 0 8px; }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .grid {
>> "assets\css\aquanta-theme.css" echo   display: grid;
>> "assets\css\aquanta-theme.css" echo   grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
>> "assets\css\aquanta-theme.css" echo   gap: 12px;
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .card {
>> "assets\css\aquanta-theme.css" echo   background: var(--bg-card);
>> "assets\css\aquanta-theme.css" echo   border: 1px solid var(--border);
>> "assets\css\aquanta-theme.css" echo   border-radius: 14px;
>> "assets\css\aquanta-theme.css" echo   padding: 14px;
>> "assets\css\aquanta-theme.css" echo   min-height: 120px;
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .card h3 { margin: 0 0 6px; font-size: 1.1rem; }
>> "assets\css\aquanta-theme.css" echo .card p { margin: 0 0 8px; }
>> "assets\css\aquanta-theme.css" echo .card a { font-weight: 700; }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .site-footer {
>> "assets\css\aquanta-theme.css" echo   position: fixed;
>> "assets\css\aquanta-theme.css" echo   left: 0;
>> "assets\css\aquanta-theme.css" echo   right: 0;
>> "assets\css\aquanta-theme.css" echo   bottom: 0;
>> "assets\css\aquanta-theme.css" echo   height: var(--footer-h);
>> "assets\css\aquanta-theme.css" echo   z-index: 1000;
>> "assets\css\aquanta-theme.css" echo   background: rgba(17,57,89,0.97);
>> "assets\css\aquanta-theme.css" echo   border-top: 1px solid var(--border);
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo .footer-inner {
>> "assets\css\aquanta-theme.css" echo   height: 100%%;
>> "assets\css\aquanta-theme.css" echo   max-width: 1500px;
>> "assets\css\aquanta-theme.css" echo   margin: 0 auto;
>> "assets\css\aquanta-theme.css" echo   padding: 0 14px;
>> "assets\css\aquanta-theme.css" echo   display: flex;
>> "assets\css\aquanta-theme.css" echo   align-items: center;
>> "assets\css\aquanta-theme.css" echo   justify-content: space-between;
>> "assets\css\aquanta-theme.css" echo   gap: 12px;
>> "assets\css\aquanta-theme.css" echo   font-size: 0.82rem;
>> "assets\css\aquanta-theme.css" echo }
>> "assets\css\aquanta-theme.css" echo.
>> "assets\css\aquanta-theme.css" echo @media (max-width: 760px) {
>> "assets\css\aquanta-theme.css" echo   :root { --header-h: 112px; --footer-h: 48px; }
>> "assets\css\aquanta-theme.css" echo   .header-inner { align-items: flex-start; flex-direction: column; justify-content: center; }
>> "assets\css\aquanta-theme.css" echo   .nav { justify-content: flex-start; font-size: 0.86rem; }
>> "assets\css\aquanta-theme.css" echo   .footer-inner { flex-direction: column; justify-content: center; gap: 2px; }
>> "assets\css\aquanta-theme.css" echo }
)

REM ============================================================
REM JAVASCRIPT
REM ============================================================

if not exist "assets\js\main.js" (
> "assets\js\main.js" echo console.log("AQUANTA website loaded.");
)

REM ============================================================
REM COMPONENTS
REM ============================================================

if not exist "components\header.html" (
> "components\header.html" echo ^<header class="site-header"^>
>> "components\header.html" echo   ^<div class="header-inner"^>
>> "components\header.html" echo     ^<a class="brand" href="/index.html"^>AQUANTA^</a^>
>> "components\header.html" echo     ^<nav class="nav"^>
>> "components\header.html" echo       ^<a href="/about/"^>About^</a^>
>> "components\header.html" echo       ^<a href="/research/"^>Research^</a^>
>> "components\header.html" echo       ^<a href="/technologies/"^>Technologies^</a^>
>> "components\header.html" echo       ^<a href="/applications/"^>Applications^</a^>
>> "components\header.html" echo       ^<a href="/publications/"^>Publications^</a^>
>> "components\header.html" echo       ^<a href="/education/"^>Education^</a^>
>> "components\header.html" echo       ^<a href="/consortium/"^>Consortium^</a^>
>> "components\header.html" echo       ^<a href="/events/"^>Events^</a^>
>> "components\header.html" echo       ^<a href="/news/"^>News^</a^>
>> "components\header.html" echo       ^<a href="/contact/"^>Contact^</a^>
>> "components\header.html" echo       ^<span class="lang"^>JP / EN^</span^>
>> "components\header.html" echo     ^</nav^>
>> "components\header.html" echo   ^</div^>
>> "components\header.html" echo ^</header^>
)

if not exist "components\footer.html" (
> "components\footer.html" echo ^<footer class="site-footer"^>
>> "components\footer.html" echo   ^<div class="footer-inner"^>
>> "components\footer.html" echo     ^<span^>© 2026 AQUANTA Inc.^</span^>
>> "components\footer.html" echo     ^<span^>Aquaphotomics® · Aquagram® · Contact^</span^>
>> "components\footer.html" echo   ^</div^>
>> "components\footer.html" echo ^</footer^>
)

if not exist "components\navigation.html" type nul > "components\navigation.html"
if not exist "components\hero.html" type nul > "components\hero.html"
if not exist "components\cards.html" type nul > "components\cards.html"

REM ============================================================
REM INDEX.HTML
REM ============================================================

if not exist "index.html" (
> "index.html" echo ^<!doctype html^>
>> "index.html" echo ^<html lang="en"^>
>> "index.html" echo ^<head^>
>> "index.html" echo   ^<meta charset="utf-8"^>
>> "index.html" echo   ^<meta name="viewport" content="width=device-width, initial-scale=1"^>
>> "index.html" echo   ^<title^>AQUANTA ^| Aquaphotomics Science and Technology^</title^>
>> "index.html" echo   ^<meta name="description" content="AQUANTA scientific corporate website for Aquaphotomics, water science, technologies and applications."^>
>> "index.html" echo   ^<link rel="stylesheet" href="assets/css/aquanta-theme.css"^>
>> "index.html" echo ^</head^>
>> "index.html" echo ^<body^>
>> "index.html" echo   ^<header class="site-header"^>
>> "index.html" echo     ^<div class="header-inner"^>
>> "index.html" echo       ^<a class="brand" href="index.html"^>AQUANTA^</a^>
>> "index.html" echo       ^<nav class="nav"^>
>> "index.html" echo         ^<a href="about/"^>About^</a^>
>> "index.html" echo         ^<a href="research/"^>Research^</a^>
>> "index.html" echo         ^<a href="technologies/"^>Technologies^</a^>
>> "index.html" echo         ^<a href="applications/"^>Applications^</a^>
>> "index.html" echo         ^<a href="publications/"^>Publications^</a^>
>> "index.html" echo         ^<a href="education/"^>Education^</a^>
>> "index.html" echo         ^<a href="consortium/"^>Consortium^</a^>
>> "index.html" echo         ^<a href="events/"^>Events^</a^>
>> "index.html" echo         ^<a href="news/"^>News^</a^>
>> "index.html" echo         ^<a href="contact/"^>Contact^</a^>
>> "index.html" echo         ^<span class="lang"^>JP / EN^</span^>
>> "index.html" echo       ^</nav^>
>> "index.html" echo     ^</div^>
>> "index.html" echo   ^</header^>
>> "index.html" echo.
>> "index.html" echo   ^<main^>
>> "index.html" echo     ^<section class="hero"^>
>> "index.html" echo       ^<div class="container"^>
>> "index.html" echo         ^<h1^>The Water Within Life^</h1^>
>> "index.html" echo         ^<p^>AQUANTA advances Aquaphotomics as a scientific and technological framework for understanding water molecular systems in life, health, agriculture, environment and industry.^</p^>
>> "index.html" echo       ^</div^>
>> "index.html" echo     ^</section^>
>> "index.html" echo.
>> "index.html" echo     ^<div class="container"^>
>> "index.html" echo       ^<section class="section"^>
>> "index.html" echo         ^<h2^>Research Areas^</h2^>
>> "index.html" echo         ^<div class="grid"^>
>> "index.html" echo           ^<article class="card"^>^<h3^>Aquaphotomics^</h3^>^<p^>Water as an integrative molecular mirror of complex systems.^</p^>^<a href="research/aquaphotomics/"^>Read more →^</a^>^</article^>
>> "index.html" echo           ^<article class="card"^>^<h3^>Health^</h3^>^<p^>Non-invasive spectral insight into biological regulation and system state.^</p^>^<a href="research/health/"^>Read more →^</a^>^</article^>
>> "index.html" echo           ^<article class="card"^>^<h3^>Agriculture^</h3^>^<p^>Monitoring plants, soils and water networks under real conditions.^</p^>^<a href="research/agriculture/"^>Read more →^</a^>^</article^>
>> "index.html" echo           ^<article class="card"^>^<h3^>Water Science^</h3^>^<p^>Spectral signatures of water structure, perturbation and adaptation.^</p^>^<a href="research/water-science/"^>Read more →^</a^>^</article^>
>> "index.html" echo         ^</div^>
>> "index.html" echo       ^</section^>
>> "index.html" echo.
>> "index.html" echo       ^<section class="section"^>
>> "index.html" echo         ^<h2^>Technologies and Applications^</h2^>
>> "index.html" echo         ^<div class="grid"^>
>> "index.html" echo           ^<article class="card"^>^<h3^>Aquagram®^</h3^>^<p^>Visualization of water absorbance patterns and system-specific water coordinates.^</p^>^<a href="technologies/"^>Explore →^</a^>^</article^>
>> "index.html" echo           ^<article class="card"^>^<h3^>Digital Twins^</h3^>^<p^>Aquaphotomics-enabled data models for dynamic biological and industrial systems.^</p^>^<a href="research/ai-digital-twins/"^>Explore →^</a^>^</article^>
>> "index.html" echo           ^<article class="card"^>^<h3^>Publications^</h3^>^<p^>Scientific papers, reviews, books and conference materials.^</p^>^<a href="publications/"^>Browse →^</a^>^</article^>
>> "index.html" echo           ^<article class="card"^>^<h3^>Consortium^</h3^>^<p^>Research, technology and industry partnerships.^</p^>^<a href="consortium/"^>Join →^</a^>^</article^>
>> "index.html" echo         ^</div^>
>> "index.html" echo       ^</section^>
>> "index.html" echo     ^</div^>
>> "index.html" echo   ^</main^>
>> "index.html" echo.
>> "index.html" echo   ^<footer class="site-footer"^>
>> "index.html" echo     ^<div class="footer-inner"^>
>> "index.html" echo       ^<span^>© 2026 AQUANTA Inc.^</span^>
>> "index.html" echo       ^<span^>Aquaphotomics® · Aquagram® · Contact^</span^>
>> "index.html" echo     ^</div^>
>> "index.html" echo   ^</footer^>
>> "index.html" echo   ^<script src="assets/js/main.js"^>^</script^>
>> "index.html" echo ^</body^>
>> "index.html" echo ^</html^>
)

REM ============================================================
REM SECTION INDEX FILES
REM ============================================================

for %%P in (
about
research
technologies
applications
publications
education
consortium
events
news
contact
research\aquaphotomics
research\health
research\agriculture
research\food
research\water-science
research\environment
research\ai-digital-twins
) do (
    if not exist "%%P\index.html" (
        > "%%P\index.html" echo ^<!doctype html^>
        >> "%%P\index.html" echo ^<html lang="en"^>
        >> "%%P\index.html" echo ^<head^>
        >> "%%P\index.html" echo   ^<meta charset="utf-8"^>
        >> "%%P\index.html" echo   ^<meta name="viewport" content="width=device-width, initial-scale=1"^>
        >> "%%P\index.html" echo   ^<title^>AQUANTA^</title^>
        >> "%%P\index.html" echo   ^<link rel="stylesheet" href="../assets/css/aquanta-theme.css"^>
        >> "%%P\index.html" echo ^</head^>
        >> "%%P\index.html" echo ^<body^>
        >> "%%P\index.html" echo   ^<header class="site-header"^>^<div class="header-inner"^>^<a class="brand" href="../index.html"^>AQUANTA^</a^>^<nav class="nav"^>^<a href="../about/"^>About^</a^>^<a href="../research/"^>Research^</a^>^<a href="../technologies/"^>Technologies^</a^>^<a href="../applications/"^>Applications^</a^>^<a href="../publications/"^>Publications^</a^>^<a href="../contact/"^>Contact^</a^>^<span class="lang"^>JP / EN^</span^>^</nav^>^</div^>^</header^>
        >> "%%P\index.html" echo   ^<main^>^<section class="hero"^>^<div class="container"^>^<h1^>AQUANTA^</h1^>^<p^>This page is prepared for structured scientific and corporate content.^</p^>^</div^>^</section^>^<div class="container"^>^<section class="section"^>^<div class="card"^>Content coming soon.^</div^>^</section^>^</div^>^</main^>
        >> "%%P\index.html" echo   ^<footer class="site-footer"^>^<div class="footer-inner"^>^<span^>© 2026 AQUANTA Inc.^</span^>^<span^>Aquaphotomics® · Aquagram®^</span^>^</div^>^</footer^>
        >> "%%P\index.html" echo ^</body^>
        >> "%%P\index.html" echo ^</html^>
    )
)

REM ============================================================
REM DATA FILES
REM ============================================================

if not exist "data\publications.json" echo []> "data\publications.json"
if not exist "data\news.json" echo []> "data\news.json"
if not exist "data\events.json" echo []> "data\events.json"

REM ============================================================
REM DOCUMENTATION
REM ============================================================

if not exist "docs\style-guide.md" (
> "docs\style-guide.md" echo # AQUANTA Design Standard v1.0
>> "docs\style-guide.md" echo.
>> "docs\style-guide.md" echo Text color: #FFFFFF
>> "docs\style-guide.md" echo Common background: #113959
>> "docs\style-guide.md" echo Card background: #00577a
>> "docs\style-guide.md" echo Header and footer are always visible.
>> "docs\style-guide.md" echo Minimal empty space between elements.
)

if not exist "docs\sitemap.md" (
> "docs\sitemap.md" echo # Sitemap
>> "docs\sitemap.md" echo.
>> "docs\sitemap.md" echo - Home
>> "docs\sitemap.md" echo - About
>> "docs\sitemap.md" echo - Research
>> "docs\sitemap.md" echo - Technologies
>> "docs\sitemap.md" echo - Applications
>> "docs\sitemap.md" echo - Publications
>> "docs\sitemap.md" echo - Education
>> "docs\sitemap.md" echo - Consortium
>> "docs\sitemap.md" echo - Events
>> "docs\sitemap.md" echo - News
>> "docs\sitemap.md" echo - Contact
)

if not exist "docs\content-plan.md" (
> "docs\content-plan.md" echo # Content Plan
>> "docs\content-plan.md" echo.
>> "docs\content-plan.md" echo 1. Home page
>> "docs\content-plan.md" echo 2. Research pages
>> "docs\content-plan.md" echo 3. Technologies
>> "docs\content-plan.md" echo 4. Publications database
>> "docs\content-plan.md" echo 5. JP / EN language versions
)

echo.
echo ============================================================
echo AQUANTA website structure v2 has been created successfully.
echo Existing files were not overwritten.
echo ============================================================
echo.

tree /F
echo.
pause
endlocal
