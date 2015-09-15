# Homepage (Root path)
get '/' do
  @musics = Music.all
  erb :'index'
end

get '/new' do
  @musics = Music.new
  erb :'new'
end

get '/:id' do
  @musics = Music.find params[:id]
  erb :'show'
end

post '/' do
  @musics = Music.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url]
    )
  if @musics.save
    redirect '/'
  else
    erb :'new'
  end
end