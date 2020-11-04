doctype html
html
  head
    == component "head"
    title AsaCoco Store
    meta name="description" content="Sweep all worries away. Brighten your life up."
    meta name="image" content="https://store.asacoco.moe/assets/og_logo.png"
    meta itemprop="name" content="AsaCoco Store"
    meta itemprop="description" content="Sweep all worries away. Brighten your life up."
    meta itemprop="image" content="https://store.asacoco.moe/assets/og_logo.png"
    meta name="twitter:card" content="summary"
    meta name="twitter:title" content="AsaCoco Store"
    meta name="twitter:description" content="Sweep all worries away. Brighten your life up."
    meta name="twitter:image:src" content="https://store.asacoco.moe/assets/og_logo.png"
    meta property="og:title" content="AsaCoco Store"
    meta property="og:type" content="website"
    meta property="og:description" content="Sweep all worries away. Brighten your life up."
    meta property="og:image" content="https://store.asacoco.moe/assets/og_logo.png"
    css:
      @keyframes slideDown {
        from {
          top: -64px;
          opacity: 0;
        }
        to {
          top: 0px;
          opacity: 1;
        }
      }
      @keyframes slideUp {
        from {
          top: 64px;
          opacity: 0;
        }
        to {
          top: 0px;
          opacity: 1;
        }
      }
      @keyframes scaleIn {
        from {
          transform: scale(5.0);
          opacity: 0.5;
        }
        to {
          transform: scale(1.0);
          opacity: 1;
        }
      }
      html { scroll-behavior: smooth; }
      .navbar-fixed { height: 0; }
      header { padding-top: 64px; }
      .full-screen { height: 100vh; width: 100vw; }
      .container { height: 100%; }
      .margin-auto { margin: auto; }
      @media screen and (max-height: 720px) {
        #logo { width: 140px; height: 140px; }
      }
      @media screen and (max-height: 520px) {
        #logo { display: none; }
      }
      .slide-down { animation: slideDown 0.8s forwards; position: relative; opacity: 0; }
      .slide-up { animation: slideUp 0.8s forwards; position: relative; opacity: 0; }
      .scale-in { animation: scaleIn 0.2s forwards; opacity: 0; }
      .btn-large { font-size: 21px; }
      .invis { height: 0; width: 0; }
      section { padding: 44px; width: 100vw; }
      .btn-flat { background-color: unset !important; color: #039be5; text-transform: unset; padding: 0;}
      .product-img { margin-top: 26px; max-width: 100%; max-height: 50vh; }
  body
    == component "nav"
    header.full-screen.orange.darken-3
      .container.valign-wrapper.center-align.white-text
        .margin-auto
          img.scale-in id="logo" src="assets/logo.png" alt="Logo" width="210" height="210" style="animation-delay: 4s; opacity: 0;"
          h3
            strong
              span.slide-down Healthiness. 
              span.slide-down style="animation-delay: 1s" Happiness. 
              span.slide-down style="animation-delay: 2s" Heavenliness.
          h4.slide-up style="animation-delay: 3s" Sweep all worries away. Brighten your life up.
          br
          a.waves-effect.waves-light.btn-large.black.scale-in href="#store" style="animation-delay: 4s" Explore
            i.material-icons.right keyboard_arrow_right
    #store.invis
    - products.each_with_index do |product, i|
      section id=product.id class="#{i % 2 == 0 ? "white black" : "black white" }-text"
        .container.center-align
          h3
            strong = product.name
          - if type = product.type
            h4 = type
          a.btn-large.btn-flat href=product.url target="_blank" Learn more
            i.material-icons.right keyboard_arrow_right
          a.btn-large.btn-flat href="#{product.id}.html" style="padding-left: 20px;" = product.monthly ? "Join" : "Buy"
            i.material-icons.right keyboard_arrow_right
          br
          img.product-img src="assets/#{product.image}" alt=product.name
    == component "footer"
