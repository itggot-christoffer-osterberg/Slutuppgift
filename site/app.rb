class App < Sinatra::Base
  enable :sessions
  register Sinatra::Partial
  set :partial_template_engine, :erb

  get '/' do
    redirect '/login'
  end

  get '/login' do
    # if session[:user_id]
    #   @user = User.get(session[:user_id])
    #   redirect '/my_tickets'
    # else
    @student = Student.all
    @admin = Admin.all
    erb :login, layout: false
    end
  # end

  post '/login' do
    user = User.first(email: params["email"])
    if user && user.password == params["password"]
      p 'asdfasd'
      session[:user_id] = user.id
      if user.admin?
        redirect '/admin/unassigned'
      else
        redirect '/student/my_tickets'
      end
    else
      redirect '/noworkerino'
    end

  end

  post '/student/logout' do
    session.destroy
    redirect '/'
  end

  post '/admin/logout' do
    session.destroy
    redirect '/'
  end

  get '/student/my_tickets' do
    if session[:user_id]
      @user = User.get(session[:user_id])
      @tickets = Ticket.all(user_id: @user.id)
      erb :tickets
    else
      redirect '/'
    end

  end

  get '/student/my_tickets/:id' do |id|
    if session[:user_id]
      @user = User.get(session[:user_id])
      @ticket = Ticket.get(id)
      erb :ticket
    else
      redirect '/'
    end
  end

  get '/student/create_ticket' do
    if session[:user_id]
      @user = User.get(session[:user_id])
      @tags = Tag.all
      erb :create_ticket
    else
      redirect '/'
    end
  end

  post '/student/create_ticket' do
    p "#" * 60
    p params
    if session[:user_id]
      p "USER FOUND"
      p params
      if params["tags"] == nil
        p "MUAHAHAHAHAHA"
        redirect back
      end
      user = User.get(session[:user_id])
      p "USER"
      #p user
      ticket = Ticket.create(title: params["title"],
                             description: params["description"],
                             status_id: 1,
                             alt_email: params["alt-mail"],
                             user: user)
      p "TICKET"
      p ticket
      p ticket.errors
      unless params["files"] == [""]
        params["files"].each do |file|
          uuid = SecureRandom.hex
          File.open("./public/files/#{uuid}.#{file[:filename].scan(/\.(.+)$/)[0][0]}", "w+") do |f|
            f.write file[:tempfile].read
          end
          Attachement.create(name: file[:filename],
                             path: "#{uuid}.#{file[:filename].scan(/\.(.+)$/)[0][0]}")
        end
      end
      params["tags"].each do |tag|
        ticket.tags << Tag.get(tag)
      end
      p ticket
      p ticket.errors
      ticket.save
      redirect '/student/my_tickets'
    end
  end

  get '/student/faq' do
    if session[:user_id]
      @articles = Article.all
      erb :faq
    else
      redirect '/'
    end
  end

  get '/admin/unassigned' do
    if session[:user_id]
      @tickets = Ticket.all(status_id: 1)
      @admins = Admin.all
      erb :unassigned, :layout => :adminlayout
    end
  end

  get '/admin/active' do
    "Hello World"
    erb :active, :layout => :adminlayout
  end

  get '/admin/create_ticket' do
    "Hello World"
    erb :adminticket, :layout => :adminlayout
  end

  get '/admin/all_tickets' do
    "Hello World"
    erb :alltickets, :layout => :adminlayout
  end

  get '/admin/faq' do
    @articles = Article.all
    erb :adminfaq, :layout => :adminlayout
  end

  get '/admin/admins' do
    "Hello World"
    erb :admins, :layout => :adminlayout
  end
end