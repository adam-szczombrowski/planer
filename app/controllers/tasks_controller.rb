class TasksController < ApplicationController
before_filter :logged_in?
before_filter :require_permission, only: [:edit, :show, :update]

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.where(user_id: current_user.id)
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      flash[:success] = "Task created successfully!"
      redirect_to @task
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = 'Task edited successfully'
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = 'Your task has been deleted'
    redirect_to tasks_path
  end

  private

    def task_params
      params.require(:task).permit(:name, :description, :category)
    end

    def require_permission
      if current_user != Task.find(params[:id]).user
        flash[:danger] = 'This is not your task'
        redirect_to root_path
      end
    end
end
