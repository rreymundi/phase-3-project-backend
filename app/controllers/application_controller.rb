class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Welcome to List dot IT!" }.to_json
  end

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
    list.to_json
  end

  # updated this request in case i end up using this endpoint to get my tasks
  get "/tasks" do
    tasks = Task.all
    tasks.to_json(include: { user: { include: :lists } })
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
      user_id: params[:user_id],
      list_id: params[:list_id],
      status: false
    )
    task.to_json
  end

  patch '/tasks/:id' do
    task = Task.find(params[:id])
    task.update(
      # name: params[:name],
      # description: params[:description],
      saved: params[:saved],
      # list_id: params[:list_id],
      status: params[:status]
    )
    task.to_json
  end

  # post '/login' do
  #   user = User.where(params[:username], params[:password])
  #   (err, user) => {
  #    if err
  #     r.send({err: err})
  #    end

  #    if user
  #     user.to_json(include: { lists: { include: :tasks } })
  #    elsif r.send({ message: "Wrong username/password comination!"})
  #    end
  #   }
  #   # user.to_json(include: { lists: { include: :tasks } })
  # end

end
