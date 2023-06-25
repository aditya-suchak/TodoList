class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end
end
