footer.page-footer.white-text.orange.darken-2
  .container
    .row
      .col.m6.s12
        h5 Products
        ul
          - products.each do |product|
            li style="white-space: nowrap; overflow-x: hidden;"
              a.grey-text.text-lighten-3 href="/##{product.id}" = product.name
      .col.m4.offset-m2.s12
        h5 Kiryu Coco
        ul
          li
            a.grey-text.text-lighten-4 href="https://www.youtube.com/channel/UCS9uQI-jC3DE0L4IpXyvr6w" target="_blank" YouTube
          li
            a.grey-text.text-lighten-4 href="https://twitter.com/kiryucoco" target="_blank" Twitter
  .footer-copyright
    .container
      | Copyright © 2020 AsaCoco Store
      a.grey-text.text-lighten-4.right href="https://github.com/AsaCoco-Store/AsaCoco-Store" GitHub
script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"
