class App < Sinatra::Base
  enable :sessions
  register Sinatra::Partial
  set :partial_template_engine, :erb

  get '/' do
    redirect '/login'
  end

  get '/login' do
    if session[:user_id]
      @user = User.get(session[:user_id])
      redirect '/my_tickets'
    else
      @user = User.all
    erb :login, layout: false
    end
  end

  post '/login' do
    user = User.first(email: params["email"])
    if user && user.password == params["password"]
      session[:user_id] = user.id
    end
    redirect '/my_tickets'
  end

  post '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/my_tickets' do
    if session[:user_id]
      @user = User.get(session[:user_id])
      @tickets = Ticket.all(user_id: @user.id)
      @articles = Article.all
      erb :tickets
    else
      redirect '/'
    end

  end

  get '/my_tickets/:ticket' do |id|
    if session[:user_id]
      @user = User.get(session[:user_id])
      @ticket = Ticket.first(id: id)
      erb :ticket
    else
      redirect '/'
    end
  end

  get '/create_ticket' do
    if session[:user_id]
      @user = User.get(session[:user_id])
      @tags = Tag.all
      erb :create_ticket
    else
      redirect '/'
    end
  end

  post '/create_ticket' do
    ticket = Ticket.create(title: params['title'],
                           description: params['description'],
                           alt_email: params['alt_email'])
    if ticket.valid?
      redirect "/my_tickets/#{params['ticket_id']}"
    else
      redirect back
    end
  end

  get '/faq' do
    if session[:user_id]
      @articles = Article.all
      erb :faq
    else
      redirect '/'
    end
  end
end