class Restaurant < ApplicationRecord
    validates :title, presence: true
    validates :email, presence: true, uniqueness: true

    default_scope { available }
    scope :available, -> { where(deleted_at: nil) }
   
    
    # def self.available
    #     where(deleted_at: nil)
    # end

    def destroy
        update(deleted_at: Time.now)
    end
end
