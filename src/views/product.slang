doctype html
html
  head
    == component "head"
    title = product.name + " - AsaCoco Store"
    meta name="description" content=product.type
    meta name="image" content="https://store.asacoco.moe/assets/#{product.image}"
    meta itemprop="name" content="#{product.name} - AsaCoco Store"
    meta itemprop="description" content=product.type
    meta itemprop="image" content="https://store.asacoco.moe/assets/#{product.image}"
    meta name="twitter:card" content="summary"
    meta name="twitter:title" content="#{product.name} - AsaCoco Store"
    meta name="twitter:description" content=product.type
    meta name="twitter:image:src" content="https://store.asacoco.moe/assets/#{product.image}"
    meta property="og:title" content="#{product.name} - AsaCoco Store"
    meta property="og:type" content="website"
    meta property="og:description" content=product.type
    meta property="og:image" content="https://store.asacoco.moe/assets/#{product.image}"
    css:
      section { padding: 10px; width: 100vw; font-size: 21px; }
      input#quantity:focus { border-bottom: 1px solid orange !important; -webkit-box-shadow: 0 1px 0 0 orange !important; box-shadow: 0 1px 0 0 orange !important; }
      .btn-large { font-size: 21px; }
  body
    == component "nav"
    section
      .container
        .row
          .col.s12.m6
            img src="assets/#{product.image}" style="width: 100%; height: 400px; object-fit: contain;"
          .col.s12.m6
            h3
              strong = product.name
            h4 = product.type
            div Quantity:
              .input-field.inline
                input#quantity type="number" value="1" onchange="update()"
            p Price:
              - if srp = product.srp
                del style="white-space: nowrap;" ¥
                  span#srp default="#{product.srp}" = product.srp
              strong style="font-size: 32px; white-space: nowrap;" ¥
                span#prize default="#{product.price}" = product.price
            a.waves-effect.waves-light.btn-large.black href="https://youtu.be/#{product.cm.id}?t=#{product.cm.start_time}" target="_blank" style="width: 100%" Buy
            javascript:
              function update() {
                input = document.getElementById('quantity')
                if (input.value < 1)
                  input.value = 1
                if (srp = document.getElementById('srp'))
                  srp.textContent = srp.getAttribute('default') * input.value
                prize = document.getElementById('prize')
                prize.textContent = prize.getAttribute('default') * input.value
              }
    section.black.white-text
      .container
        h4 CM
        iframe src="https://www.youtube.com/embed/#{product.cm.id}?start=#{product.cm.start_time}&end=#{product.cm.end_time}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" style="width: 100%; min-height: 45vw"
    section#recommends data-recommends=products.reject(product).to_json
      .container
        h4 Recommended products
        .row
          - 4.times do |i|
            .col.s12.m6.l4 id="recommend-#{i}"
              a.black-text id="recommend-link-#{i}"
                .card
                  .card-image
                    img id="recommend-image-#{i}" height="240" style="object-fit: contain;"
                  .card-content style="overflow-x: hidden; white-space: nowrap;"
                    span.card-title
                      strong id="recommend-name-#{i}"
                    p id="recommend-type-#{i}"
                    p style="font-size: 28px;" ¥
                      span id="recommend-price-#{i}"
    == component "footer"

javascript:
  document.addEventListener('DOMContentLoaded', function() {
    let recommends = document.getElementById('recommends')
    let products = JSON.parse(recommends.getAttribute('data-recommends'))
    for (let i = 0; i != 4; i++) {
      let j = Math.floor(Math.random() * (products.length - i)) + i
      let product = products[j]
      products[j] = products[i]
      products[i] = product
      document.getElementById(`recommend-link-${i}`).setAttribute('href', `${product.id}.html`)
      document.getElementById(`recommend-image-${i}`).setAttribute('src', `assets/${product.image}`)
      document.getElementById(`recommend-name-${i}`).textContent = product.name
      document.getElementById(`recommend-type-${i}`).textContent = product.type
      document.getElementById(`recommend-price-${i}`).textContent = product.price
    }
    document.getElementById('recommend-3').classList.add('hide-on-large-only')
  })
