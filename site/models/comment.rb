class Comment
  include DataMapper::Resource

  property :id, Serial
  property :description, Text, required: true

  has n, :attachements
  belongs_to :user
  belongs_to :ticket, required: false
  belongs_to :article, required: false

end