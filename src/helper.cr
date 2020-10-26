module AsaCoco::Store::Helper
  macro render(source, dist = nil)
    File.write("dist/#{{{(dist || source)}}}.html", Kilt.render("src/views/{{source.id}}.slang"))
  end

  macro component(name)
    Kilt.render("src/components/{{name.id}}.slang")
  end
end
