<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PetHub AI Assistant</title>
<style>
:root {
    --ink: #17202a;
    --muted: #5c6670;
    --line: #d7dde5;
    --amber: #ffb703;
    --teal: #0f766e;
    --blue: #2563eb;
    --rose: #be185d;
    --paper: #ffffff;
    --soft: #f7fafc;
}
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #eef5f7;
    color: var(--ink);
}
.ai-wrap {
    max-width: 1180px;
    margin: 28px auto 42px;
    padding: 0 18px;
}
.top-panel {
    min-height: 230px;
    border-radius: 8px;
    overflow: hidden;
    background: linear-gradient(90deg, rgba(18,31,44,.92), rgba(15,118,110,.78)), url('Images1/banner.webp');
    background-size: cover;
    background-position: center;
    color: white;
    display: grid;
    grid-template-columns: 1.4fr .9fr;
    align-items: stretch;
}
.top-copy {
    padding: 34px;
}
.eyebrow {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 7px 10px;
    border: 1px solid rgba(255,255,255,.35);
    border-radius: 999px;
    font-size: 12px;
    letter-spacing: .08em;
    text-transform: uppercase;
}
.top-copy h1 {
    margin: 16px 0 10px;
    font-size: 38px;
    line-height: 1.08;
}
.top-copy p {
    max-width: 680px;
    margin: 0;
    color: #eaf6f5;
    line-height: 1.55;
}
.insight-panel {
    padding: 22px;
    background: rgba(255,255,255,.12);
    border-left: 1px solid rgba(255,255,255,.2);
    display: grid;
    align-content: center;
    gap: 12px;
}
.metric {
    background: rgba(255,255,255,.92);
    color: var(--ink);
    border-radius: 8px;
    padding: 14px;
}
.metric strong {
    display: block;
    font-size: 22px;
}
.assistant-layout {
    display: grid;
    grid-template-columns: 290px 1fr;
    gap: 18px;
    margin-top: 18px;
}
.side-panel, .chat-panel {
    background: var(--paper);
    border: 1px solid var(--line);
    border-radius: 8px;
    box-shadow: 0 10px 28px rgba(15,23,42,.08);
}
.side-panel {
    padding: 18px;
}
.side-panel h2, .chat-title h2 {
    margin: 0;
    font-size: 20px;
}
.side-panel p {
    color: var(--muted);
    line-height: 1.45;
}
.quick-actions {
    display: grid;
    gap: 9px;
}
.quick-actions button {
    text-align: left;
    background: #f8fafc;
    border: 1px solid var(--line);
    color: var(--ink);
    border-radius: 7px;
    padding: 11px;
    cursor: pointer;
    font-weight: 700;
}
.quick-actions button:hover {
    border-color: var(--teal);
    background: #ecfdf5;
}
.capabilities {
    display: grid;
    gap: 8px;
    margin-top: 18px;
}
.capabilities span {
    border-left: 4px solid var(--amber);
    background: #fff8e1;
    padding: 9px 10px;
    border-radius: 6px;
    font-size: 14px;
}
.chat-panel {
    overflow: hidden;
}
.chat-title {
    display: flex;
    justify-content: space-between;
    gap: 14px;
    align-items: center;
    padding: 16px 18px;
    border-bottom: 1px solid var(--line);
    background: #fbfdff;
}
.status-pill {
    color: #14532d;
    background: #dcfce7;
    border: 1px solid #86efac;
    padding: 7px 10px;
    border-radius: 999px;
    font-size: 13px;
    font-weight: bold;
}
.chat-window {
    height: 480px;
    overflow-y: auto;
    padding: 20px;
    background:
        linear-gradient(0deg, rgba(255,255,255,.88), rgba(255,255,255,.88)),
        url('Images1/CatBackground.jpg');
    background-size: cover;
    background-position: center;
}
.message {
    max-width: 76%;
    padding: 13px 15px;
    margin: 12px 0;
    border-radius: 8px;
    line-height: 1.5;
    box-shadow: 0 6px 16px rgba(15,23,42,.08);
}
.bot {
    background: white;
    border: 1px solid #dbeafe;
}
.user {
    background: #dbeafe;
    color: #0f2f5f;
    margin-left: auto;
    border: 1px solid #93c5fd;
}
.input-row {
    display: grid;
    grid-template-columns: 1fr auto;
    gap: 10px;
    padding: 16px 18px;
    border-top: 1px solid var(--line);
    background: white;
}
.input-row input {
    min-width: 0;
    padding: 13px 14px;
    border: 1px solid #cbd5e1;
    border-radius: 7px;
    font-size: 15px;
}
.input-row button {
    border: 0;
    background: var(--teal);
    color: white;
    padding: 0 24px;
    border-radius: 7px;
    font-weight: bold;
    cursor: pointer;
}
.input-row button:hover {
    background: #115e59;
}
@media (max-width: 860px) {
    .top-panel, .assistant-layout {
        grid-template-columns: 1fr;
    }
    .insight-panel {
        border-left: 0;
        border-top: 1px solid rgba(255,255,255,.2);
    }
    .top-copy h1 {
        font-size: 30px;
    }
    .message {
        max-width: 92%;
    }
}
</style>
</head>
<body>
<%@include file="Header1.jsp"%>
<main class="ai-wrap">
    <section class="top-panel">
        <div class="top-copy">
            <div class="eyebrow">PetHub Intelligence</div>
            <h1>Your shopping and pet-care co-pilot</h1>
            <p>Ask for product suggestions, order help, appointment guidance, food comparisons, and everyday pet-care support. It answers from your live catalog and can connect to OpenAI when an API key is configured.</p>
        </div>
        <div class="insight-panel">
            <div class="metric"><strong>106</strong> catalog products available</div>
            <div class="metric"><strong>10</strong> active shopping categories</div>
            <div class="metric"><strong>24/7</strong> local assistant support</div>
        </div>
    </section>

    <section class="assistant-layout">
        <aside class="side-panel">
            <h2>Try A Prompt</h2>
            <p>Use these shortcuts or ask your own question.</p>
            <div class="quick-actions">
                <button type="button" onclick="askQuick('recommend high protein dog food')">Recommend high protein dog food</button>
                <button type="button" onclick="askQuick('what should I buy for cat grooming?')">Cat grooming checklist</button>
                <button type="button" onclick="askQuick('how do I place an order?')">Order and checkout help</button>
                <button type="button" onclick="askQuick('my pet is sick how do I book a vet appointment?')">Vet appointment guidance</button>
                <button type="button" onclick="askQuick('best products for a puppy starter kit')">Puppy starter kit</button>
            </div>
            <div class="capabilities">
                <span>Catalog-aware recommendations</span>
                <span>Cart, order, and checkout guidance</span>
                <span>Pet-care safety suggestions</span>
                <span>Works without internet AI key</span>
            </div>
        </aside>

        <section class="chat-panel">
            <div class="chat-title">
                <h2>Live Assistant</h2>
                <div class="status-pill">Online</div>
            </div>
            <div id="chatWindow" class="chat-window">
                <div class="message bot">Hi! I am PetHub AI. Ask me what to buy, how to care for your pet, or how to use the site.</div>
            </div>
            <form class="input-row" onsubmit="sendMessage(); return false;">
                <input id="messageInput" type="text" placeholder="Ask about food, accessories, orders, appointments..." autocomplete="off">
                <button type="submit">Send</button>
            </form>
        </section>
    </section>
</main>
<script>
function addMessage(text, cssClass) {
    const chat = document.getElementById('chatWindow');
    const div = document.createElement('div');
    div.className = 'message ' + cssClass;
    div.textContent = text;
    chat.appendChild(div);
    chat.scrollTop = chat.scrollHeight;
}

function askQuick(text) {
    document.getElementById('messageInput').value = text;
    sendMessage();
}

async function sendMessage() {
    const input = document.getElementById('messageInput');
    const text = input.value.trim();
    if (!text) return;
    input.value = '';
    addMessage(text, 'user');
    addMessage('Thinking through the catalog...', 'bot');

    try {
        const response = await fetch('chatbot', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: new URLSearchParams({message: text})
        });
        const data = await response.json();
        const messages = document.querySelectorAll('.message.bot');
        messages[messages.length - 1].textContent = data.response || 'I could not answer that yet.';
    } catch (error) {
        const messages = document.querySelectorAll('.message.bot');
        messages[messages.length - 1].textContent = 'Assistant is unavailable right now. Please try again.';
    }
}
</script>
</body>
</html>
