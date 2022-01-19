class RoomsController < ApplicationController
  
   before_action :authenticate_user!, only: [:show]
  
  def index
    @rooms = Room.where(user_id: current_user.id)
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "ルームを登録しました"
      redirect_to room_path(@room)
    else
      render "new"
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @user = User.find_by(id: @room.user_id)
    @reservation = Reservation.new(reservation_params)
    @reservations = @room.reservations
  end
  
  def serch
    @rooms = Room.serch(params[:keyword])
    @keyword = params[:keyword]
  end
  
  private
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image, :user_id).merge(user_id: current_user.id)
  end
  
  def reservation_params
    params.permit(:start_date, :end_date, :person_num, :room_id, :user_id)
  end
end