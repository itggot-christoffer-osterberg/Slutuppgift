class Ticket
  include DataMapper::Resource

  property :id, Serial
  property :title, String, required: true
  property :description, Text ,required: true
  property :status, String
  property :alt_email, String

  belongs_to :user
  has n, :tags, :through => Resource
  has n, :attachements
  has n, :comments
end