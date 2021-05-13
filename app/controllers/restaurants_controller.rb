class RestaurantsController < ApplicationController
     before_action :find_restaurant, only: [:edit, :update, :destroy]
     before_action :check_user!, except: [:index, :show, :hello]
    #  skip_before_action :verify_authenticity_token, only: [:pocket_list]
    
    def index
      # @restaurants = Restaurant.where(deleted_at: nil)
      # 只要刪除欄時間戳記是空的就顯示出來!!
      @restaurants = Restaurant.all
                                      
    end 

    def show
      @restaurant = Restaurant.find(params[:id])
      @comment = @restaurant.comments.new
      @comments = @restaurant.comments.order(id: :desc)
      # begin
   
        #  Exception例外
        # Error錯誤
      # rescue
      #   redirect_to restaurants_path
      # end                                      
    end

    def pocket_list
      render json: params
    end

    def new
        @restaurant = Restaurant.new
    end

    def create
        # 寫入資料庫
      #  @restaurant = Restaurant.new(restaurant_params)
      #  @restaurant.user_id = current_user.id
      @restaurant = current_user.restaurants.new(restaurant_params)

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
      # authentication 驗證(你有沒有登入)
      #  authorization 授權(你可不可做這件事情)
      def find_restaurant
        # @restaurant =  Restaurant.find(params[:id])
        # 1
        # @restaurant = Restaurant.find_by!(
        #  id: params[:id],
        #  user_id: current_user.id
        #  )
        #  2
        @restaurant = current_user.restaurants.find(params[:id])
      end

      def restaurant_params
        params.require(:restaurant).permit(:title, :tel, :address, :email, :description)
      end

      # def current_user
      #   User.find_by(id: session[ENV['session_name']])
      # end

     
end   






