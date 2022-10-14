class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    
    
    
    def generate_token(user_id)
        JWT.encode({user_id:user_id}, get_secret_key)
    end
    
    def decode_token(token)
        puts token
        JWT.decode(token, get_secret_key)[0]["user_id"]
    end
    
    private
    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end
    
    def render_not_found(error)
        render json: {errors: {error.model => "Not Found"}}, status: :not_found
    end
    def get_secret_key
        "jwt"
    end
    
    end