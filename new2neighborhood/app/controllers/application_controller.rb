class ApplicationController < ActionController::API

    def user_id
        decoded_token.first['id']
    end

    def current_user
        @user ||= User.find_by(id: user_id)
    end

    def issue_token(payload)
        JWT.encode(payload, ENV['secret'], 'HS256')
    end

    def decode_token
        begin
            JWT.decode(token, ENV['secret'], true, {:algorithm => 'HS256'})
        rescue JWT::DecodeError
            [{}]
        end
    end
end
