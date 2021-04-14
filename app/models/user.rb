

module Hasher
    require 'digest'
    def self.encrypt(password)
        Digest::SHA1.hexdigest(password)
    end

    def self.salted(password)
        "123#{password}xx"
    end
end

class User < ApplicationRecord
    validates :email, presence: true,
                      uniqueness: true,
                      format: {with: /.+\@.+\..+/ }
    validates :password, presence: true,
                         confirmation: true

   before_create :encrypt_password                      

   def self.login(params)
    email = params[:email]
    password = params[:password]

    salted_password = Hasher.salted(password)
    encrypt_password = Hasher.encrypt(salted_password)

    find_by(email: email, password: encrypt_password)
   
   end

    private
        def encrypt_password
             salted_pwd = Hasher.salted(password)
            self.password = Hasher.encrypt(salted_pwd)
        end

   
end
