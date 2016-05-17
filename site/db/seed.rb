class Seeder

  def self.seed!
    self.users
    self.tickets
    self.comments
    self.rolls
    self.tags
    self.articles
  end

  def self.tags
    Tag.create(name: 'Internet')
    Tag.create(name: 'inlogg')
    Tag.create(name: 'dator')
    Tag.create(name: 'hårddisk')
  end

  def self.rolls
    Roll.create(name: 'Student')
    Roll.create(name: 'Teacher')
    Roll.create(name: 'admin')
  end

  def self.users
    User.create(first_name: 'Grill', last_name: 'Banan', email: 'grillbanan@itggot.se', password: 'senap', klass: '1D', roll_id: 1)
    User.create(first_name: 'Grill', last_name: 'Sven', email: 'grillsven@itggot.se', password: 'ketchup', klass: '2E', roll_id: 1)
    User.create(first_name: 'Admin', last_name: 'Glenn', email: 'adminglenn@itggot.se', password: 'dressing', roll_id: 3)
  end

  def self.tickets
    Ticket.create(title: 'Problem med internet', description: 'hej jag heter Grill Banan och har problem', status: 'behandlas', user_id: 1)
    Ticket.create(title: 'Problem med dator', description: 'hej jag heter Grill Banan och har problem', status: 'behandlas', user_id: 1)
    Ticket.create(title: 'Problem med inlogg', description: 'hej jag heter Grill Sven och har problem', status: 'behandlas', user_id: 2)
  end

  def self.articles
    Article.create(title: 'Problem med inlogg', description: 'det vanligaste problemet är...', user_id: 3, tag_id: 2)
    Article.create(title: 'Problem med knapp', description: 'det vanligaste problemet är...', user_id: 3, tag_id: 3)
  end

  def self.comments
    Comment.create(description: 'För att lösa problemet gör du...', user_id: 3, ticket_id: 1)
    Comment.create(description: 'För att lösa problemet gör du...', user_id: 3, ticket_id: 2)
    Comment.create(description: 'För att lösa problemet gör du...', user_id: 3, article_id: 1)
  end

end