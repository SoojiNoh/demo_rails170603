class Api::V1::CataloguesController < ApplicationController
before_filter :restrict_access


    def show
        catalogue = Catalogue.find(params[:id])
        render(json: Api::V1::CatalogueSerializer.new(catalogue).to_json)
    end
    
    
private

# def restrict_access
#   api_key = ApiKey.find_by_access_token(params[:access_token])
#   head :unauthorized unless api_key
# end

    def restrict_access
                puts "###########"
      authenticate_or_request_with_http_token do |token, options|
        # ApiKey.exists?(access_token: token)
        puts "###########"+token
        # puts "###########"+self.inspect
        # puts "###########"+Catalogue.find(params[:id]).api_key.methods - Object.methods
        puts "###########"+Catalogue.find(params[:id]).api_key.class.name


        Catalogue.find(params[:id]).api_key.access_token == token
      end
    end
end
