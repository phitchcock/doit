module Api
  module V1
    class UsersController < ApiController

      def index
        users = User.all
        respond_with users
      end

      def show
        user = User.find(params[:id])
        respond_with user
      end

      def create
        user = User.create(params.require(:user).permit!)
        respond_with user
      end

    end
  end
end