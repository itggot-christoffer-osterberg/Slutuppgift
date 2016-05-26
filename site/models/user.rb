class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String, required: true
  property :last_name, String, required: true
  property :email, String, required: true
  property :password, BCryptHash, required: true
  property :klass, String
  property :type, Discriminator

  has n, :tickets
  has n, :articles

  def admin?
    self.is_a? Admin
  end

end

class Admin   < User; end
class Student < User; end
class Teacher < User; end
