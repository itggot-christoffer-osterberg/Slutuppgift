class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String, required: true
  property :last_name, String, required: true
  property :email, String, required: true
  property :password, BCryptHash, required: true
  property :klass, String
  property :type, Discriminator



  def admin?
    self.is_a? Admin
  end

end

class Admin   < User
  has n, :tickets
end

class Student < User
  has n, :tickets
end