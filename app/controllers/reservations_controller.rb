class ReservationsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end
  
  def new
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:room_id])
    if @reservation.invalid?
      render :show
    else
      @stay_days = (@reservation.end_date - @reservation.start_date).to_i
      @total_amount = (@reservation.room.price * @reservation.person_num * @stay_days).to_i
    end
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    
    if @reservation.save
      flash[:notice] = "予約を確定しました"
      redirect_to reservation_path(@reservation)
    else
      render room_path(@reservation.room.id)
      flash[:notice] = "予約できませんでした"
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
    @stay_days = (@reservation.end_date - @reservation.start_date).to_i
    @total_amount = (@reservation.room.price * @reservation.person_num * @stay_days).to_i
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :person_num, :room_id, :user_id).merge(user_id: current_user.id)
  end
  
  def stay_days
     @stay_days = (@reservation.end_date - @reservation.start_date).to_i
  end
  
  def total_amount
    @total_amount = (@reservation.room.price * @reservation.person_num * @stay_days).to_i
  end
end
