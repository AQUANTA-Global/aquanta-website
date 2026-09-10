const AQUANTA = {
    site: null,
    routes: null
};

async function loadSiteData() {

    AQUANTA.site =
        await fetch('/data/site.json').then(r => r.json());

    AQUANTA.routes =
        await fetch('/data/routes.generated.json').then(r => r.json());

}

function versioned(path) {
  return `${path}?v=1`;
  return `${path}?v=${AQUANTA.version.version}`;
}

async function loadComponent(selector, url) {
  const target = document.querySelector(selector);
  if (!target) return;

  const response = await fetch(url);
  target.innerHTML = await response.text();
}

function currentPath() {
  return window.location.pathname.replace(/\/?$/, "/");
}

async function loadHomeContent() {
  const response = await fetch('/data/content.json');
  const data = await response.json();

  document.querySelector('[data-hero-eyebrow]').textContent = data.hero.eyebrow;
  document.querySelector('[data-hero-title]').textContent = data.hero.title;
  document.querySelector('[data-hero-body]').textContent = data.hero.body;

  const grid = document.querySelector('[data-cards]');
  grid.innerHTML = data.cards.map(card => `
    <article class="card">
      <h2>${card.title}</h2>
      <p>${card.body}</p>
      <a href="${card.url}">Explore</a>
    </article>
  `).join('');
}

function updateBrandBreadcrumb() {
  console.log("Breadcrumb function called");

  const brand = document.querySelector('#brand-breadcrumb');
  console.log("brand =", brand);

  let path = window.location.pathname;
  if (!path.endsWith('/')) path += '/';

  console.log("path =", path);
  console.log("AQUANTA.routes =", AQUANTA.routes);

  const route = AQUANTA.routes[path];
  console.log("route =", route);

  if (!brand) return;

  if (!route || !route.label) {
    brand.textContent = AQUANTA.site.site.siteName;
    return;
  }

  brand.textContent = route.label;
}
document.addEventListener('DOMContentLoaded', async () => {
  console.log("1 DOMContentLoaded");
  await loadSiteData();
  console.log("2 loadSiteData OK");
  
  await loadComponent('[data-header]', '/components/header.html');
  console.log("3 header loaded");

  await loadComponent('[data-particles]', '/components/particles.html');
  console.log("3 header loaded");

  updateBrandBreadcrumb();
  console.log("4 ubreadcrumb updated");

  await loadComponent('[data-footer]', '/components/footer.html');
  console.log("5 footer loaded");

  const year = document.querySelector('#year');
  if (year) year.textContent = new Date().getFullYear();

  if (document.body.dataset.page === 'home') {
    await loadHomeContent();
  }
});
