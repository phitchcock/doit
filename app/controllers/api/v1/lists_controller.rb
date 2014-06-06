module Api
  module V1
    class ListsController < ApplicationController

      #before_filter :authenticate_user!
      skip_before_filter :verify_authenticity_token
      respond_to :json

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

      def default_serializer_options
        {root: false}
      end

    end
  end
end