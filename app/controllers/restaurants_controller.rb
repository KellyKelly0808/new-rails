class RestaurantsController < ApplicationController
  
    def index
    end 

    def new
    end

    def list 
      # 寫入資料庫
      # redirect -> 列表頁   (轉址到餐廳列表)
      # render html: "title is #{params[:title]}"
      redirect_to'/restaurants'
    end

end   

  # 可以很多個controller都繼承  ApplicationController，而重複功能可以寫在 ApplicationController，比較方便




#   def b
    # render ({html: 'hello,k'})
# html: 是 key 而 'hello'是value
# render是一個方法 是繼承來的方法,繼承自ActionController::Base

# end 