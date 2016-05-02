class Ticket
  include DataMapper::Resource

  property :id, Serial
  property :title, String, required: true
  property :description, Text ,required: true
  property :status, String

  belongs_to :user
  belongs_to :tag
  has n, :attachements
  has n, :comments
end