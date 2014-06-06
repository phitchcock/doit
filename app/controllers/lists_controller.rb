class ListsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    # @lists = List.all
    @lists = policy_scope(List)
  end

  def show
    @task = Task.new
  end

  def new 
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to @list, notice: "#{@list.name} was created!"
    else
      flash[:error] = "List did not save, please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: "#{@list.name} was updated"
    else
      flash[:error] = "List not saved, please try again"
      render :edit
    end
  end

  def destroy
    if @list.destroy
      redirect_to lists_path, notice: "#{@list.name} was destroyed!"
    else
      flash[:error] = "List was not destroyed"
      redirect_to @list
    end
  end

  private

  def list_params
    params.require(:list).permit!
  end

  def set_list
    @list = List.find(params[:id])
  end

end