class Ticket
  include DataMapper::Resource

  property :id, Serial
  property :title, String, required: true
  property :description, Text ,required: true
  property :alt_email, String

  belongs_to :student
  belongs_to :admin, required: false
  has n,     :tags, :through => Resource
  has n,     :attachements
  has n,     :comments
  belongs_to :status
end