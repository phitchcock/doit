class TasksController < ApplicationController

  before_action :authenticate_user!

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(params.require(:task).permit!)

    if @task.save
      redirect_to @list, notice: "created task"
    else
      flash[:error] = "nope"
      redirect_to @list
    end
  end

end