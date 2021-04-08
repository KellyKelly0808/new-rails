class Restaurant < ApplicationRecord
    validates :title, presence: true
    validates :email, presence: true, uniqueness: true
end
