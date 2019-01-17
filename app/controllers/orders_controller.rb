class OrdersController < ApiController
    before_action :require_login, :current_user

    def index
        render json: @current_user.orders.find_by(status: "cart").products
    end

    def create
        order = @current_user.orders.new_orders(
            params[:name],
            params[:price]
        )
    end
end
