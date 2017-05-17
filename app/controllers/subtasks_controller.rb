class SubtasksController < ApplicationController
  before_action :set_task, only: [:new, :create, :edit]
  before_action :set_subtask, only: [:edit, :update, :destroy]

  def new
    @subtask = Subtask.new
  end

  def create
    @subtask = @task.subtasks.new(subtask_params)
    if @subtask.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end


  def update
    if @subtask.update(subtask_params)
      redirect_to tasks_path
    else
      render :new
    end
  end

  def destroy
    @subtask.destroy
    redirect_to tasks_path
  end

  private
    def set_task
      @task = Task.find(params[:task_id])
    end

    def set_subtask
      @subtask = Subtask.find(params[:id])
    end

    def subtask_params
      params.require(:subtask).permit(:title, :description, :status)
    end

end
