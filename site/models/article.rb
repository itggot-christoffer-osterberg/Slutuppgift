class Article
  include DataMapper::Resource

  property :id, Serial
  property :title, String, required: true
  property :description, Text, required: true

  has n, :comments
  belongs_to :tag
  has n, :attachements
  belongs_to :user

end