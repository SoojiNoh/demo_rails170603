class Api::V1::UsersController < Api::V1::BaseController
  # protect_from_forgery with: :null_session
  
  #   def show
  #       user = User.find(params[:id])
    
  #       render(json: Api::V1::UserSerializer.new(user).to_json)
  #   end
end
