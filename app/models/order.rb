class Order
    include Mongoid::Document
    field :status, type: String
    field :subtotal, type: Float
    field :tax, type: Float
    field :total, type: Float

    embedded_in :user
    embeds_many :products

    def self.new_user(user)
        user.orders.create(status: "wish",subtotal:"0",tax:"0",total:"0")
        user.orders.create(status: "cart",subtotal:"0",tax:"0",total:"0")
    end
end
