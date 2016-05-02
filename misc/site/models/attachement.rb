class Attachement
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  belongs_to :ticket
  belongs_to :comment
  belongs_to :article

end