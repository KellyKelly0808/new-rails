class ApplicationController < ActionController::Base
  rescue_from   ActiveRecord::RecordNotFound, with: :not_found
              #在所有controller 只要資料找不到就給你404 

  private
      def not_found
        # redirect_to restaurants_path
        render file: "public/404.html",
            status: 404
      end
end

  #  ActionController::Base 這是rails內建的東西 你是改不了的,所以才會很多controller都是繼承ApplicationController
  # 另外寫法是"#{Rails.root}/public/404.html"