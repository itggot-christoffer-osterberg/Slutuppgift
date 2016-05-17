class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true

  has n, :articles
  has n, :tickets, :through => Resource

end