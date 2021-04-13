class RestaurantsController < ApplicationController
     before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
 
  
    def index
      # @restaurants = Restaurant.where(deleted_at: nil)
      # 只要刪除欄時間戳記是空的就顯示出來!!
      @restaurants = Restaurant.all
                                      
    end 

    def show
      # begin
   
        #  Exception例外
        # Error錯誤
      # rescue
      #   redirect_to restaurants_path
      # end                                      
    end

    def new
      @restaurant = Restaurant.new
    end

    def create
        # 寫入資料庫
       @restaurant = Restaurant.new(restaurant_params)

        if @restaurant.save
          redirect_to restaurants_path
        else
          render :new # 借 new.html.erb
        end
    end

    def edit
    
    end
    
    def update
      
      if @restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant)
      else
        render :edit
      end
    end

    def destroy
      
      @restaurant.destroy
      # @restaurant.update(deleted_at: Time.now)
      redirect_to restaurants_path
    end

    private
      def find_restaurant
        @restaurant =  Restaurant.find(params[:id])
      end

      def restaurant_params
        params.require(:restaurant).permit(:title, :tel, :address, :email, :description)
      end

     

end   






