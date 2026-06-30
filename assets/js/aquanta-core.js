async function loadComponent(selector, url) {
  const target = document.querySelector(selector);
  if (!target) return;
  const response = await fetch(url);
  target.innerHTML = await response.text();
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

document.addEventListener('DOMContentLoaded', async () => {
  await loadComponent('[data-header]', '/components/header.html');
  await loadComponent('[data-footer]', '/components/footer.html');

  const year = document.querySelector('#year');
  if (year) year.textContent = new Date().getFullYear();

  if (document.body.dataset.page === 'home') {
    await loadHomeContent();
  }
});
