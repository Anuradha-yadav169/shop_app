class Product < ApplicationRecord
    has_many_attached :images
    has_many :line_items, dependent: :destroy

    validates :name, presence: true   
    validates :price, presence: true, numericality: {:greater_than => 0} 
    validates :description, presence: true   
end
