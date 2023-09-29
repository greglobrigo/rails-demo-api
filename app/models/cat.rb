class Cat < ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true
    validates :breed, presence: true
    validates :price, presence: true
end
