class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = @current_user
    if @room.save
      flash[:notice] = "ルームを登録しました"
      redirect_to room_path
    else
      render "new"
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @reservations = @room.reservations
  end
  
  def posts
    @posts= Room.all
  end
  
  private
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image, :user_id).merge(user_id: current_user.id)
  end
end