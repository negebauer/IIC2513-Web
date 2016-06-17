class Api::V1::BaseController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json
    skip_before_filter  :verify_authenticity_token
    before_filter :check_auth

    def index
        render json: {'api': 'v1'}
    end

    private

    def check_auth
        authenticate_or_request_with_http_basic do |username, password|
            @user, @error = User.login(username, password)
            return !@user.nil?
        end
    end

end
