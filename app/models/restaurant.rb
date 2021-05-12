class Restaurant < ApplicationRecord
    validates :title, presence: true
    validates :email, presence: true, uniqueness: true

    belongs_to :user
    has_many :comments

    has_many :favorite_restaurants
    has_many :likers, through: :favorite_restaurants,source: :user

    default_scope { available }
    scope :available, -> { where(deleted_at: nil) }
   
    #Restaurant.deleted
    def self.deleted
        unscope(:where).where.not(deleted_at: nil)
    end
   

    def destroy
        update(deleted_at: Time.now)
    end

    def really_destroy!
        super.destroy
    end
end
