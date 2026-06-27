
// AQUANTA JavaScript
async function checkApiHealth() {
  const el = document.getElementById("api-status");
  if (!el) return;

  try {
    const response = await fetch("http://127.0.0.1:8000/health");
    const data = await response.json();
    el.textContent = `API status: ${data.status}`;
  } catch (error) {
    el.textContent = "API status: offline";
  }
}

checkApiHealth();