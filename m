<!DOCTYPE html>
<html lang="hi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Smart Shopping Club - Online shopping deals and products">
  <title>Smart Shopping Club</title>
  <style>
    *{box-sizing:border-box;margin:0;padding:0}
    body{font-family:Arial,Helvetica,sans-serif;background:#f5f7fb;color:#172033}
    header{background:linear-gradient(135deg,#111827,#2563eb);color:#fff;padding:18px 16px 24px;position:sticky;top:0;z-index:10}
    .top{max-width:1100px;margin:auto;display:flex;align-items:center;justify-content:space-between;gap:12px}
    .logo{font-size:23px;font-weight:800}
    .tag{font-size:12px;opacity:.85;margin-top:4px}
    .search{margin:18px auto 0;max-width:700px;display:flex;background:#fff;border-radius:12px;overflow:hidden}
    .search input{flex:1;border:0;outline:0;padding:13px;font-size:15px}
    .search button{border:0;background:#f59e0b;color:#111;padding:0 18px;font-weight:700}
    .hero{max-width:1100px;margin:22px auto;padding:28px 20px;border-radius:18px;background:linear-gradient(135deg,#dbeafe,#eff6ff);text-align:center}
    .hero h1{font-size:30px;margin-bottom:8px}
    .hero p{color:#475569;line-height:1.5}
    .section{max-width:1100px;margin:24px auto;padding:0 12px}
    .section h2{font-size:22px;margin-bottom:14px}
    .categories{display:flex;gap:10px;overflow:auto;padding-bottom:5px}
    .cat{background:#fff;border:1px solid #e2e8f0;border-radius:999px;padding:10px 15px;white-space:nowrap;cursor:pointer}
    .products{display:grid;grid-template-columns:repeat(4,1fr);gap:14px}
    .card{background:#fff;border-radius:15px;overflow:hidden;border:1px solid #e5e7eb;box-shadow:0 4px 14px rgba(15,23,42,.06)}
    .pic{height:170px;background:#eaf0f8;display:flex;align-items:center;justify-content:center;font-size:55px}
    .info{padding:13px}
    .info h3{font-size:16px;margin-bottom:7px}
    .price{font-size:18px;font-weight:800;color:#111827}
    .old{font-size:12px;text-decoration:line-through;color:#94a3b8;margin-left:6px}
    .deal{font-size:12px;color:#16a34a;margin:6px 0 11px}
    .btn{display:block;text-align:center;text-decoration:none;background:#2563eb;color:#fff;padding:10px;border-radius:9px;font-weight:700;font-size:14px}
    .note{background:#fff7ed;border:1px solid #fed7aa;border-radius:12px;padding:14px;margin:20px 0;color:#7c2d12;font-size:13px;line-height:1.5}
    footer{margin-top:35px;background:#111827;color:#cbd5e1;text-align:center;padding:25px 15px;font-size:13px}
    @media(max-width:800px){.products{grid-template-columns:repeat(2,1fr)}}
    @media(max-width:420px){.products{grid-template-columns:1fr 1fr}.pic{height:135px}.hero h1{font-size:25px}}
  </style>
</head>
<body>
<header>
  <div class="top">
    <div>
      <div class="logo">🛍️ Smart Shopping Club</div>
      <div class="tag">Smart deals • Smart shopping</div>
    </div>
  </div>
  <div class="search">
    <input id="search" type="search" placeholder="Product search karein...">
    <button onclick="searchProducts()">Search</button>
  </div>
</header>

<main>
  <section class="hero">
    <h1>Best Deals, Ek Hi Jagah 🔥</h1>
    <p>Trending products aur useful shopping deals dekhiye. Product par tap karke shopping page par ja sakte hain.</p>
  </section>

  <section class="section">
    <h2>Categories</h2>
    <div class="categories">
      <button class="cat" onclick="filterProducts('all')">All</button>
      <button class="cat" onclick="filterProducts('fashion')">Fashion</button>
      <button class="cat" onclick="filterProducts('shoes')">Shoes</button>
      <button class="cat" onclick="filterProducts('electronics')">Electronics</button>
      <button class="cat" onclick="filterProducts('home')">Home</button>
    </div>
  </section>

  <section class="section">
    <h2>🔥 Featured Products</h2>
    <div class="products" id="products"></div>
    <div class="note">
      <b>Affiliate note:</b> Kuch product links affiliate links ho sakte hain. Agar aap link se purchase karte hain to website owner ko commission mil sakta hai, aapke extra charge ke bina.
    </div>
  </section>
</main>

<footer>
  <b>Smart Shopping Club</b><br>
  © 2026 All Rights Reserved
</footer>

<script>
const products = [
  {name:"Premium Men's Shoes",price:"₹999",old:"₹1,799",cat:"shoes",icon:"👟",link:"#"},
  {name:"Stylish Casual Sneakers",price:"₹799",old:"₹1,499",cat:"shoes",icon:"👟",link:"#"},
  {name:"Men's Casual T-Shirt",price:"₹499",old:"₹899",cat:"fashion",icon:"👕",link:"#"},
  {name:"Wireless Earbuds",price:"₹699",old:"₹1,499",cat:"electronics",icon:"🎧",link:"#"},
  {name:"Smart Watch",price:"₹1,299",old:"₹2,499",cat:"electronics",icon:"⌚",link:"#"},
  {name:"LED Table Lamp",price:"₹399",old:"₹799",cat:"home",icon:"💡",link:"#"},
  {name:"Travel Backpack",price:"₹649",old:"₹1,199",cat:"fashion",icon:"🎒",link:"#"},
  {name:"Kitchen Storage Set",price:"₹549",old:"₹999",cat:"home",icon:"🏠",link:"#"}
];

function render(list=products){
  const box=document.getElementById("products");
  box.innerHTML=list.map(p=>`
    <div class="card">
      <div class="pic">${p.icon}</div>
      <div class="info">
        <h3>${p.name}</h3>
        <div><span class="price">${p.price}</span><span class="old">${p.old}</span></div>
        <div class="deal">Special deal available</div>
        <a class="btn" href="${p.link}" target="_blank" rel="noopener">View Deal</a>
      </div>
    </div>`).join("");
}
function filterProducts(cat){
  render(cat==="all"?products:products.filter(p=>p.cat===cat));
}
function searchProducts(){
  const q=document.getElementById("search").value.toLowerCase().trim();
  render(q?products.filter(p=>p.name.toLowerCase().includes(q)):products);
}
document.getElementById("search").addEventListener("keydown",e=>{if(e.key==="Enter")searchProducts()});
render();
</script>
</body>
</html>
