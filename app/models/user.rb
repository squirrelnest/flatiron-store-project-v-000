class User < ActiveRecord::Base

  belongs_to :current_cart, class_name: 'Cart', foreign_key: 'current_cart_id'

  has_many :orders
  has_many :carts
  has_many :items, through: :carts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def current_cart
    Cart.find_by(id: self.cart_ids.last)
  end

end
