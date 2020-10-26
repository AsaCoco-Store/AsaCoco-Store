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
end
