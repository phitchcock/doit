module Api
  module V1
    class TasksController < ApiController

      skip_before_filter :verify_authenticity_token
      respond_to :json

      def index
        tasks = Task.all
        respond_with tasks
      end

      def create
        list = List.find(params[:list_id])
        task = list.tasks.build(params.require(:task).permit!)

        if task.save
          respond_with task
        else
          render :json, task.errors, status: :unprocessable_entity
        end
      end

      def destroy
        task = Task.find(params[:id])
        task.destroy
        respond_with task
      end

    end
  end
end