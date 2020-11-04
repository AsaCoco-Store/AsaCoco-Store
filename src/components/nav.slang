.navbar-fixed
  nav style="box-shadow: unset; -webkit-box-shadow: unset;"
    .nav-wrapper.orange.darken-3 style="white-space: nowrap;"
      a.brand-logo.left style="left: 1rem;" href="/"
        img src="assets/logo.png" alt="Logo" width="40" height="40" style="position: relative; top: 7px"
        | AsaCoco Store
      .right style="height: 100%"
        .input-field
          input.orange-text.text-darken-3 id="search" type="search" required=true data-products=products.to_json style="padding-left: 2rem; width: calc(100% - 2rem); -webkit-appearance: none;"
          label id="search-icon" class="label-icon" for="search" style="left: unset; right: 1rem"
            i class="material-icons" search

javascript:
  document.addEventListener('DOMContentLoaded', () => {
    let input = document.getElementById('search')
    let products = JSON.parse(input.getAttribute('data-products'))
    M.Autocomplete.init(document.querySelectorAll('#search'), {
      data: Object.fromEntries(products.map(product => [product.name, `assets/${product.image}`])),
      onAutocomplete: () => {
        window.location.href = `/#${products[input.value].id}`
        input.value = ""
      }
    })
    input.after(document.getElementById('search-icon'))
    products = Object.fromEntries(products.map(product => [product.name, {id: product.id, image: product.image}]))
  })

css:
  .autocomplete-content { width: 300px !important; left: unset !important; right: 0; }
  .dropdown-content li > span { color: black; }
  .autocomplete-content li .highlight { color: #ef6c00; }
  .autocomplete-content li img { object-fit: contain; }
