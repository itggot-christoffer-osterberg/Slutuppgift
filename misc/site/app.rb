class App < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/login'
    end
  end

  get '/login' do
    if session[:user_id]
      @user = User.get(session[:user_id])
      redirect '/my_tickets'
    else
      @user = User.all
    erb :index, layout: false
  end

  post '/' do
    user = User.first(email: params["mail"])
    if user && user.password == params["password"]
      session[:user_id] = user.id
    end
    redirect '/my_tickets'
  end

  get '/my_tickets' do
    @tickets = Ticket.all(user: @user)
    erb :tickets
  end

  get '/my_ticket/:ticket' do

  end

  get '/faq' do
    @articles = Article.all

  end




end