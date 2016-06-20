class Api::V1::BaseController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json
    skip_before_filter  :verify_authenticity_token
    before_action :check_auth

    def index
        render json: {'api': 'v1'}
    end

    private

    def check_auth
        @auth_called = false
        authenticate_with_http_basic do |username, password|
            @auth_called = true
            @user, @error = User.login(username, password)
            if @user.nil?
                request_http_basic_authentication
            end
        end
        if !@auth_called
            request_http_basic_authentication
        end
    end

    def admin_required
        if @user.nil? || !@user.admin
            render html: 'HTTP Basic: Access denied.', status: 401
        end
    end

end
