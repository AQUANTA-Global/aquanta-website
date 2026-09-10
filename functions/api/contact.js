export async function onRequestPost(context) {
  try {
    const formData = await context.request.formData();
    const name = formData.get('name');
    const email = formData.get('email');
    const message = formData.get('message');

    const res = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${context.env.RESEND_API_KEY}`,
      },
      body: JSON.stringify({
        from: 'no-reply@aquanta.co.jp', // Трябва да е верифициран домейн
        to: 'contact@aquanta.co.jp',
        subject: `Ново запитване от ${name}`,
        html: `<p><strong>Име:</strong> ${name}</p>
               <p><strong>Имейл:</strong> ${email}</p>
               <p><strong>Съобщение:</strong> ${message}</p>`,
      }),
    });

    if (res.ok) {
      return new Response(JSON.stringify({ success: true }), { status: 200 });
    } else {
      return new Response(JSON.stringify({ error: 'Грешка при изпращане към Resend' }), { status: 500 });
    }
  } catch (err) {
    return new Response(JSON.stringify({ error: 'Сървърна грешка' }), { status: 500 });
  }
}