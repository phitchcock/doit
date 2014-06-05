module Api
  module V1
    class ListsController < ApplicationController

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

    end
  end
end