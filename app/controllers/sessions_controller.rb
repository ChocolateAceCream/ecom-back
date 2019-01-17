class SessionsController < ApiController
    skip_before_action :require_login, only: [:login, :signup], raise: false

    def signup
        if user = User.valid_email?(params[:email], params[:password])
            user.allow_token_to_be_used_only_once
            send_auth_token_for_valid_login_of(user)
            Order.new_user(user)
        else
            render_unauthorized("Email already taken")
        end
    end

    def login
        if user = User.valid_login?(params[:email], params[:password])
            user.allow_token_to_be_userd_only_once
            send_auth_token_for_valid_login_of(user)
        else
            render_unauthorized("Error with your login or password")
        end
    end

    def destroy
        current_user.logout
        head :ok
    end

    private

    def send_auth_token_for_valid_login_of(user)
        render json: { token: user.token}
    end

end
