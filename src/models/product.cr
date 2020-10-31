class Product
  include YAML::Serializable

  property name : String
  property type : String?
  property image : String
  property srp : Int64?
  property price : Int64
  property monthly : Bool?
  setter url : String?
  property cm : CM

  def id
    name.downcase.split.join('_')
  end

  def url
    @url || "https://youtu.be/#{cm.id}?t=#{cm.start_time}"
  end

  def to_json(json : JSON::Builder)
    json.object do
      json.field "id", id
      json.field "name", name
      json.field "type", type
      json.field "image", image
      json.field "price", price
      json.field "monthly", monthly || false
    end
  end
end
