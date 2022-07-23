class HotelsController < ApplicationController
  def index
    @hotels=Hotel
      .all
    @q = Hotel.ransack(params[:q])
    @hotels = @q.result.includes(:reviews).page(params[:page]).per(6)
    if current_user
      render :index
    else
      redirect_to '/login'
    end
  end

  def show
    @hotel=Hotel.find(params[:id])
    if current_user
      render :show
    else
      redirect_to '/login'
    end
  end

  def new
    if current_user
      if current_user.admin
        @hotel = Hotel.new
      else
        redirect_to '/signup'
      end
    else
      redirect_to '/login'
    end
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to @hotel
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if current_user
      if current_user.admin
        @hotel = Hotel.find(params[:id])
      else
        redirect_to '/signup'
      end
    else
      redirect_to '/login'
    end
  end

  def update
    @hotel = Hotel.find(params[:id])

    if @hotel.update(hotel_params)
      redirect_to @hotel
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :price, :contact_email, :image)
  end
end
