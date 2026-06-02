<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PetHub Smart AI Tools</title>
<link rel="stylesheet" href="pethub-responsive.css">
<style>
:root {
    --ink: #152238;
    --muted: #607086;
    --teal: #137a6f;
    --blue: #2563eb;
    --amber: #f59e0b;
    --paper: #fff;
    --line: #dde8f2;
}
body {
    margin: 0;
    font-family: Arial, sans-serif;
    color: var(--ink);
    background: #f3f8fb;
}
.smart-wrap {
    width: min(1180px, calc(100% - 32px));
    margin: 28px auto 54px;
}
.ai-hero {
    min-height: 330px;
    border-radius: 8px;
    overflow: hidden;
    background: linear-gradient(90deg, rgba(21,34,56,.94), rgba(19,122,111,.68)), url('Health/dogvet.jpg');
    background-size: cover;
    background-position: center;
    color: #fff;
    display: grid;
    grid-template-columns: 1fr 360px;
    gap: 20px;
    align-items: end;
    padding: 36px;
}
.ai-hero h1 {
    margin: 10px 0;
    font-size: clamp(34px, 5vw, 58px);
    line-height: 1.04;
    max-width: 760px;
}
.ai-hero p {
    margin: 0;
    max-width: 690px;
    line-height: 1.7;
    color: rgba(255,255,255,.9);
}
.badge {
    display: inline-block;
    border: 1px solid rgba(255,255,255,.32);
    border-radius: 999px;
    padding: 7px 12px;
    font-size: 12px;
    letter-spacing: .08em;
    text-transform: uppercase;
}
.hero-panel {
    background: rgba(255,255,255,.94);
    color: var(--ink);
    border-radius: 8px;
    padding: 18px;
    box-shadow: 0 18px 46px rgba(0,0,0,.22);
}
.hero-panel strong {
    display: block;
    font-size: 30px;
}
.quick-grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0,1fr));
    gap: 16px;
    margin: 20px 0;
}
.quick-card, .tool {
    background: #fff;
    border: 1px solid var(--line);
    border-radius: 8px;
    box-shadow: 0 14px 34px rgba(15,23,42,.08);
}
.quick-card {
    padding: 18px;
}
.quick-card strong {
    display: block;
    margin-bottom: 6px;
}
.tools {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 18px;
}
.tool {
    overflow: hidden;
}
.tool-head {
    padding: 22px;
    color: #fff;
    min-height: 120px;
}
.tool:nth-child(1) .tool-head { background: linear-gradient(135deg, #2563eb, #0f766e); }
.tool:nth-child(2) .tool-head { background: linear-gradient(135deg, #f59e0b, #be185d); }
.tool:nth-child(3) .tool-head { background: linear-gradient(135deg, #17202a, #7c3aed); }
.tool-icon {
    width: 52px;
    height: 52px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(255,255,255,.18);
    font-size: 24px;
    font-weight: 900;
    margin-bottom: 12px;
}
.tool-head h2 {
    margin: 0 0 8px;
    font-size: 22px;
}
.tool-head p {
    margin: 0;
    line-height: 1.45;
    color: rgba(255,255,255,.9);
}
.tool-body {
    padding: 20px;
}
.row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px;
}
label {
    display: block;
    margin: 10px 0 6px;
    font-weight: 800;
    color: #415166;
    font-size: 13px;
}
input, select, textarea {
    width: 100%;
    box-sizing: border-box;
    padding: 12px 13px;
    border: 1px solid #cbd8e6;
    border-radius: 8px;
    font-size: 14px;
    background: #fff;
}
textarea {
    min-height: 88px;
    resize: vertical;
}
button {
    width: 100%;
    margin-top: 14px;
    border: 0;
    border-radius: 8px;
    padding: 13px;
    background: var(--teal);
    color: #fff;
    font-weight: 900;
    cursor: pointer;
}
.result {
    margin-top: 14px;
    min-height: 92px;
    padding: 15px;
    border-radius: 8px;
    border: 1px solid #dbeafe;
    background: #f8fbff;
    color: #26323f;
    line-height: 1.55;
}
@media(max-width: 980px) {
    .ai-hero, .tools, .quick-grid {
        grid-template-columns: 1fr;
    }
}
@media(max-width: 560px) {
    .ai-hero {
        padding: 24px;
    }
    .row {
        grid-template-columns: 1fr;
    }
}
</style>
</head>
<body>
<%@include file="Header1.jsp"%>
<main class="smart-wrap">
    <section class="ai-hero">
        <div>
            <span class="badge">Cleaner Smart Tools</span>
            <h1>Practical AI help for food, vaccines, and vet visits</h1>
            <p>A cleaner smart-tools screen focused on useful, explainable recommendations for real pet-care workflows.</p>
        </div>
        <aside class="hero-panel">
            <strong>3 tools</strong>
            <p>Less clutter, stronger results, and clearer guidance for pet parents.</p>
        </aside>
    </section>

    <section class="quick-grid">
        <div class="quick-card"><strong>Vet-safe guidance</strong> Health answers recommend appointments instead of unsafe diagnosis.</div>
        <div class="quick-card"><strong>Catalog aware</strong> Food AI suggests PetHub-style products by age and need.</div>
        <div class="quick-card"><strong>Demo friendly</strong> Each result is formatted like a smart assistant response.</div>
    </section>

    <section class="tools">
        <section class="tool">
            <div class="tool-head">
                <div class="tool-icon">V</div>
                <h2>Smart Vaccination Reminder</h2>
                <p>Calculate next vaccine timing from the last dose.</p>
            </div>
            <div class="tool-body">
                <div class="row">
                    <div><label>Pet Name</label><input id="vPetName" placeholder="Bruno"></div>
                    <div><label>Pet Type/Age</label><input id="vPetType" placeholder="adult dog, puppy, kitten"></div>
                </div>
                <label>Last Vaccination Date</label><input id="vLastDate" type="date">
                <button onclick="runFeature('vaccine')">Calculate Reminder</button>
                <div id="vaccineResult" class="result">Your reminder appears here.</div>
            </div>
        </section>

        <section class="tool">
            <div class="tool-head">
                <div class="tool-icon">F</div>
                <h2>AI Food Recommendation</h2>
                <p>Match pet type, age, and dietary need to product ideas.</p>
            </div>
            <div class="tool-body">
                <div class="row">
                    <div><label>Pet Type</label><select id="foodPetType"><option>Dog</option><option>Cat</option><option>Bird</option><option>Fish</option></select></div>
                    <div><label>Age</label><select id="foodAge"><option>Adult</option><option>Puppy</option><option>Kitten</option><option>Senior</option></select></div>
                </div>
                <label>Need</label><input id="foodNeed" placeholder="protein, grain free, senior, training">
                <button onclick="runFeature('food')">Recommend Food</button>
                <div id="foodResult" class="result">Recommended products appear here.</div>
            </div>
        </section>

        <section class="tool">
            <div class="tool-head">
                <div class="tool-icon">A</div>
                <h2>AI Appointment Prep</h2>
                <p>Turn symptoms into a vet visit checklist.</p>
            </div>
            <div class="tool-body">
                <div class="row">
                    <div><label>Pet Type</label><select id="apptPetType"><option>Dog</option><option>Cat</option><option>Bird</option><option>Fish</option></select></div>
                    <div><label>Urgency</label><select id="apptUrgency"><option>Normal</option><option>Today</option><option>Emergency</option></select></div>
                </div>
                <label>Symptoms</label><textarea id="apptSymptoms" placeholder="vomiting, fever, itching, not eating..."></textarea>
                <button onclick="runFeature('appointment')">Prepare Vet Visit</button>
                <div id="appointmentResult" class="result">Appointment preparation appears here.</div>
            </div>
        </section>
    </section>
</main>

<script>
function paramsFor(feature) {
    if (feature === 'vaccine') return {feature, petName: vPetName.value, petType: vPetType.value, lastDate: vLastDate.value};
    if (feature === 'food') return {feature, petType: foodPetType.value, age: foodAge.value, need: foodNeed.value};
    return {feature, petType: apptPetType.value, urgency: apptUrgency.value, symptoms: apptSymptoms.value};
}
function resultBox(feature) {
    return document.getElementById(feature === 'vaccine' ? 'vaccineResult' : feature === 'food' ? 'foodResult' : 'appointmentResult');
}
async function runFeature(feature) {
    const box = resultBox(feature);
    box.textContent = 'Analyzing...';
    try {
        const res = await fetch('ai-features', {method:'POST', headers:{'Content-Type':'application/x-www-form-urlencoded'}, body:new URLSearchParams(paramsFor(feature))});
        const data = await res.json();
        box.textContent = data.result || 'No result generated.';
    } catch (e) {
        box.textContent = 'This AI tool is unavailable right now.';
    }
}
</script>
</body>
</html>
