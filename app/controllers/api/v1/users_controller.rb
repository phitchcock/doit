module Api
  module V1
    class UsersController < ApplicationController

      skip_before_filter :verify_authenticity_token
      respond_to :json

      def index
        respond_with(User.all.order("created_at ASC").order('id DESC'))
      end

    end
  end
end