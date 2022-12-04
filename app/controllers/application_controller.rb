class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/lists" do
    lists = List.all 
    lists.to_json(include: :tasks)
  end

  get "/lists/:id" do
    list = List.find(params[:id])
    list.to_json(include: :tasks)
  end

  delete '/lists/:id' do
    list = List.find(params[:id])
    list.tasks.destroy_all
    list.destroy
    list.to_json(include: :tasks)
  end

  post '/lists' do
    list = List.create(
      name: params[:name],
    )
    list.to_json(include: :tasks)
  end

  patch '/lists/:id' do
    list = List.find(params[:id])
    list.update(
      name: params[:name]
    )
    list.to_json(include: :tasks)
  end

 get "/tasks" do
    tasks = Task.all
    tasks.to_json(include: :list)
  end

  get "/tasks/:id" do
    task = Task.find(params[:id])
    task.to_json
  end

  delete '/tasks/:id' do
    task = Task.find(params[:id])
    task.destroy
    task.to_json
  end

  post '/tasks' do 
    task = Task.create(
      name: params[:name],
      description: params[:description],
      saved: false,
      list_id: params[:list_id],
      status: false
    )
    task.to_json
  end

  patch '/tasks/:id' do
    task = Task.find(params[:id])
    task.update(
      name: params[:name],
      description: params[:description],
      saved: params[:saved],
      # list_id: params[:list_id],
      status: params[:status]
    )
    task.to_json
  end

end
