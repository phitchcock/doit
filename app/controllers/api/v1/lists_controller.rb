module Api
  module V1
    class ListsController < ApiController

      def index
        lists = List.all
        respond_with lists
      end

      def show
        list = List.find(params[:id])
        respond_with list
      end

      def create
        list = List.new(list_params)
        if list.save
          respond_with list
        else
          render json: list.errors, status: 422
        end
      end

      def destroy
        list = List.find(params[:id])
        list.destroy
        respond_with list
      end

      private

      def list_params
        params.require(:list).permit! if params[:list]
      end

    end
  end
end