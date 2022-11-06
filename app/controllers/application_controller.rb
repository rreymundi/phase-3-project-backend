class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Welcome to my Phase 3 project!" }.to_json
  end

  get "/lists" do
    lists = List.all 
    lists.to_json
  end

  get "/lists/:id" do
    list = List.find(params[:id])
    list.to_json(include: :tasks)
  end

  delete '/lists/:id' do
    list = List.find(params[:id])
    list.destroy
    list.to_json
  end

  post '/lists' do
    list = List.create(
      name: params[:name],
    )
    list.to_json
  end

  patch '/lists/:id' do
    list = List.find(params[:id])
    list.update(
      name: params[:name]
    )
    list.to_json
  end

end
