class SubtasksController < ApplicationController

  def new
    task = Task.find(params['task_id'].to_i)
    @subtask = task.subtasks.new
  end

  def create
    params
    @subtask = Subtask.new
    if @subtask.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end


  def update
    if @subtask.update
      redirect_to tasks_path
    else
      render :new
    end
  end

  def destroy

  end

end
