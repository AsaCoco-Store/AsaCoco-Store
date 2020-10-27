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
      section { padding: 44px; width: 100vw; font-size: 21px; }
      input:focus { border-bottom: 1px solid orange !important; -webkit-box-shadow: 0 1px 0 0 orange !important; box-shadow: 0 1px 0 0 orange !important; }
      .btn-large { font-size: 21px; }
  body
    == component "nav"
    section
      .container
        .row
          .col.s12.m6
            img src="assets/#{product.image}" style="max-width: 100%; max-height: 50vh;"
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
                input = document.getElementById('quantity');
                if (input.value < 1)
                  input.value = 1
                if (srp = document.getElementById('srp'))
                  srp.textContent = srp.getAttribute('default') * input.value
                prize = document.getElementById('prize')
                prize.textContent = prize.getAttribute('default') * input.value
              }
    section.black.white-text
      .container
        h3 CM
        iframe src="https://www.youtube.com/embed/#{product.cm.id}?start=#{product.cm.start_time}&end=#{product.cm.end_time}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" style="width: 100%; min-height: 45vw"
    == component "footer"
