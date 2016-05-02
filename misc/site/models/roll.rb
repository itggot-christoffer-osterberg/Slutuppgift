class Roll
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true

  has n, :users

end