class Product
  include YAML::Serializable

  property name : String
  property type : String
  property image : String
  property srp : Int64?
  property price : Int64
  property cm : CM

  def id
    name.downcase.split.join('_')
  end

  def to_json(json : JSON::Builder)
    json.object do
      json.field "id", id
      json.field "name", name
      json.field "type", type
      json.field "image", image
      json.field "price", price
    end
  end
end
