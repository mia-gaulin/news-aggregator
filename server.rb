require 'sinatra'
require 'pry'
require 'csv'

ARTICLE_FILE = 'articles.csv'

get '/' do
  redirect '/articles'
end

get '/articles' do
  @articles = File.readlines('articles.csv')
  erb :article_index
end

get '/articles/new' do
  erb :articlenew_index
end

post '/articles/new' do
  add_article(params)

  redirect '/articles'
end

def add_article(params)
  article = [params[:title], params[:url], params[:description]]
  CSV.open(ARTICLE_FILE, 'a') do |file|
    file << article
  end
end
