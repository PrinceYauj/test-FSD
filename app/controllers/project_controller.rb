class ProjectController < ApplicationController
  def index
    @projects = Project.all
    @todos = Todo.all
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update!(isCompleted: !@todo.isCompleted)
  end

  def create
    if params[:id] == "0"
      Project.create!({title: params[:title]})
      params[:id] = Project.last.id
    end
    create_todo(params)
  end

  private

  def create_todo(params)
    Todo.create!(prepare(params))
  end

  def prepare(params)
    res = {}
    res[:project_id] = params[:id]
    res[:text] = params[:text]
    res[:isCompleted] = false
    res
  end
end
