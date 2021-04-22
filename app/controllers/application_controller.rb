class ApplicationController < ActionController::Base
  rescue_from   ActiveRecord::RecordNotFound, with: :not_found
              #在所有controller 只要資料找不到就給你404 
helper_method :current_user, :user_signed_in?
# 把方法定義在controllers這邊 匯出給view用

  private
      def not_found
        # redirect_to restaurants_path
        render file: "public/404.html",
            status: 404
      end

      def current_user
        User.find_by(id: session[ENV['session_name']])
      end

      def user_signed_in?
          if session[ENV['session_name']] 
            return true
          else
            return false
          end
       end

      def check_user!
       redirect_to root_path if not user_signed_in?
      end
end

  #  ActionController::Base 這是rails內建的東西 你是改不了的,所以才會很多controller都是繼承ApplicationController
  # 另外寫法是"#{Rails.root}/public/404.html"