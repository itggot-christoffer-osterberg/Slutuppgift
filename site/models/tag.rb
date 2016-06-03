class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true

  has n, :articles, :through => Resource
  has n, :tickets, :through => Resource

end