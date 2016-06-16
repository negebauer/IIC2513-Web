class Api::V1::BaseController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json
    skip_before_filter  :verify_authenticity_token

    def index
        render json: {'api': 'v1'}
    end

    private



end
