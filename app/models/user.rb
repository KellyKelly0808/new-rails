class User < ApplicationRecord
    validates :email, presence: true,
                      uniqueness: true,
                      format: {with: /.+\@.+\..+/ }
    validates :password, presence: true,
                         confirmation: true

   before_create :encrypt_password                      

   def self.hello(params)
    email = params[:email]
    password = params[:password]

    encrypt_password =  Digest::SHA1.hexdigest("123#{password}xx")

    find_by(email :email, password: encrypt_password)
   end

    private
        def encrypt_password
            #加密
            require 'digest'
            self.password = Digest::SHA1.hexdigest(salted_pwd)
        end

    def salted_pwd
        "123#{self.password}xx"
    end
end
