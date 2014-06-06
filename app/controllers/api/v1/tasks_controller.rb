module Api
  module V1
    class TasksController < ApplicationController

      skip_before_filter :verify_authenticity_token
      respond_to :json

      def index
        tasks = Task.all
        respond_with tasks
      end

      def create
        list = List.find(params[:list_id])
        task = list.tasks.create(params.require(:task).permit!)
        respond_with task
      end

      def destroy
        task = Task.destroy(params[:id])
        respond_with task
      end

      private

      def default_serializer_options
        {root: false}
      end

    end
  end
end