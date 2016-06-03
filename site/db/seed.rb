class Seeder

  def self.seed!
    self.statuses
    self.students
    self.admins
    self.tickets
    self.comments
    self.tags
    self.articles
  end

  def self.tags
    Tag.create(name: 'Internet')
    Tag.create(name: 'inlogg')
    Tag.create(name: 'dator')
    Tag.create(name: 'hårddisk')
  end

  def self.statuses
    Status.create(name: 'OTILLDELAD')
    Status.create(name: 'BEHANDLAS')
    Status.create(name: 'BESVARAD')
    Status.create(name: 'STÄNGD')
  end

  def self.students
    Student.create(first_name: 'Grill', last_name: 'Banan', email: 'grillbanan@itggot.se', password: 'senap', klass: '1D')
    Student.create(first_name: 'Grill', last_name: 'Sven', email: 'grillsven@itggot.se', password: 'ketchup', klass: '2E')
  end

  def self.admins
    Admin.create(first_name: 'Snygg', last_name: 'Glenn', email: 'snygg_glenn@itggot.se', password: 'dressing')
    Admin.create(first_name: 'Gammel', last_name: 'Smurf', email: 'gammelsmurf@itggot.se', password: 'coleslaw')
  end

  def self.tickets
    Ticket.create(title: 'Problem med internet', description: 'hej jag heter Grill Banan och har problem', status_id: 1, student_id: 1)
    Ticket.create(title: 'Problem med dator', description: 'hej jag heter Grill Banan och har problem', status_id: 1, student_id: 2)
    Ticket.create(title: 'Problem med inlogg', description: 'hej jag heter Grill Sven och har problem', status_id: 1, student_id: 1)
    Ticket.create(title: 'Problem med internet', description: 'hej jag heter Grill Banan och har problem', status_id: 1, student_id: 2)
    Ticket.create(title: 'Problem med internet', description: 'hej jag heter Grill Banan och har problem', status_id: 2, student_id: 1, admin_id: 3)
    Ticket.create(title: 'Problem med internet', description: 'hej jag heter Grill Banan och har problem', status_id: 2, student_id: 2, admin_id: 3)
    Ticket.create(title: 'Problem med internet', description: 'hej jag heter Grill Banan och har problem', status_id: 2, student_id: 1, admin_id: 4)
    Ticket.create(title: 'Problem med internet', description: 'hej jag heter Grill Banan och har problem', status_id: 2, student_id: 2, admin_id: 4)

  end

  def self.articles
    Article.create(title: 'Problem med inlogg', description: 'det vanligaste problemet är...', answer: 'gör såhär')
    Article.create(title: 'Problem med knapp', description: 'det vanligaste problemet är...', answer: 'gör såhär')
    Article.create(title: 'Problem med whatever', description: 'det vanligaste problemet är...', answer: 'gör såhär')
  end

  def self.comments
    Comment.create(description: 'För att lösa problemet gör du...', user_id: 3, ticket_id: 1)
    Comment.create(description: 'För att lösa problemet gör du...', user_id: 3, ticket_id: 2)
    Comment.create(description: 'För att lösa problemet gör du...', user_id: 3, article_id: 1)
  end

end