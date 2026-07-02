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

async function updateBrandBreadcrumb() {
    console.log("updateBrandBreadcrumb()");
    const brand = document.querySelector('#brand-breadcrumb');
    if (!brand) return;

    let path = window.location.pathname;

    if (!path.endsWith('/')) {
        path += '/';
    }

    const route = AQUANTA.routes[path];

    if (!route) {
        brand.textContent = AQUANTA.site.site.siteName;
        return;
    }

    brand.textContent = route.label;
}

document.addEventListener('DOMContentLoaded', async () => {

    await loadComponent('[data-header]', '/components/header.html');

    await updateBrandBreadcrumb();

    await loadComponent('[data-footer]', '/components/footer.html');

    const year = document.querySelector('#year');

    if (year) {
        year.textContent = new Date().getFullYear();
    }

    if (document.body.dataset.page === 'home') {
        await loadHomeContent();
    }

});
