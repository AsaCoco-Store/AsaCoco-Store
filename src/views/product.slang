doctype html
html
  head
    title = product.name + " - AsaCoco Store"
    meta charset="UTF-8"
    meta name="viewport" content="width=device-width,initial-scale=1.0"
    link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"
    link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"
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
            img src="assets/#{product.image}" style="max-width: 100%;"
          .col.s12.m6
            h3
              b = product.name
            h4 = product.type
            div Quantity:
              .input-field.inline
                input#quantity type="number" value="1" onchange="update()"
            p Price:
              - if srp = product.srp
                del ¥
                  span#srp default="#{product.srp}" = product.srp
              | ¥
              span#prize default="#{product.price}" = product.price
            a.waves-effect.waves-light.btn-large.black href="https://youtu.be/#{product.cm.id}?t=#{product.cm.start_time}" target="_blank" Buy
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
        iframe src="https://www.youtube.com/embed/#{product.cm.id}?start=#{product.cm.start_time}&end=#{product.cm.end_time}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" style="width: 100%; min-height: 540px"
    == component "footer"
