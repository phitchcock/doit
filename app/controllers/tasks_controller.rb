class TasksController < ApplicationController

  before_action :authenticate_user!

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(params.require(:task).permit!)

    if @task.save
      redirect_to @list, notice: "#{@task.name} was created!"
    else
      flash[:error] = "Task was not created, please try again"
      redirect_to @list
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])

    if @task.destroy
      redirect_to list_path(@list), notice: "#{@task.name} was marked as completed!"
    else
      flash.now[:error] = "Task was not destroyed"
      redirect_to list_path(@list)
    end
  end

end