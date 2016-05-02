class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String, required: true
  property :last_name, String, required: true
  property :email, String, required: true
  property :password, BCryptHash, required: true
  property :klass, String, required: true

  has n, :tickets
  belongs_to :roll
  has n, :articles
end