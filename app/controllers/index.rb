get '/' do
	@notes = Note.all
  erb :index
end

post '/new' do
	title = params[:title]
	content = params[:content]
	Note.create({title: title, content: content})
	redirect to('/')
end

get '/edit/:id' do
	id = params[:id].to_i
	@note = Note.find(id)
	erb :edit
end

put '/edit/:id' do
	id = params[:id]
	title = params[:title]
	content = params[:content]
	Note.update(id, title: title, content: content)
	redirect to('/')
end

delete '/delete/:id' do
	id = params[:id].to_i
	Note.destroy(id)
	redirect to('/')
end