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
        list = List.create(list_params)
        respond_with list
      end

      def destroy
        respond_with List.destroy(params[:id])
      end

      private

      def list_params
        params.require(:list).permit! if params[:list]
      end

    end
  end
end