require "json"
require "yaml"
require "kilt/slang"
require "./models/*"
require "./helper"

module AsaCoco::Store
  include Helper
  VERSION = "0.1.0"

  class_property! products : Array(Product)

  def self.load
    @@products = Array(Product).from_yaml(File.read("src/products.yml"))
  end

  def self.run
    load
    Dir.mkdir_p "dist"
    `cp -r src/assets dist`
    render "index"
    products.each do |product|
      render "product", product.id
    end
  end
end

AsaCoco::Store.run
