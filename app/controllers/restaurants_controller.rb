class RestaurantsController < ApplicationController

 
  
    def index
      @restaurants = Restaurant.all.order(id: :desc)
                                      #  :desc最新建立的會排在最上面
    end 

    def show
      # begin
      @restaurant =  Restaurant.find(params[:id]) # 只能找id
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
      @restaurant =  Restaurant.find(params[:id]) # 只能找id
    end
    
    def update
      @restaurant =  Restaurant.find(params[:id])
      if @restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant)
      else
        render :edit
      end
    end

    private
      def restaurant_params
        params.require(:restaurant).permit(:title, :tel, :address, :email, :description)
      end

     

end   






