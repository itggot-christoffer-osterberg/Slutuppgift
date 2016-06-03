class Article
  include DataMapper::Resource

  property :id, Serial
  property :title, String, required: true
  property :description, Text, required: true
  property :answer, Text

  has n, :tags, :through => Resource
  has n, :attachements

end