class TasksController < ApplicationController

  def index
    @tasks = current_user.tasks.where(completed: [false, nil])
    @ctasks = current_user.tasks.where(completed: true)
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: "Task was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def check
    @task = current_user.tasks.find(params[:id])
    @task.update(completed: params[:completed])

    render turbo_stream: turbo_stream.append(
      "dom_id #{@task}",
      partial: "task",
      locals: { task: @task }
    )
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: "Task was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: "task was successfully deleted."
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end

end
