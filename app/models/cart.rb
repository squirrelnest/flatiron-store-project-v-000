class Cart < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  has_many :categories, through: :items

  def total
    sum = 0
    self.line_items.each do |line_item|
      sum += (line_item.item.price * line_item.quantity)
    end
    sum
  end

  def number_to_currency(total)
    Money.us_dollar(total).format
  end

end
