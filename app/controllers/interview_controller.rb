class InterviewController < ApplicationController
  before_action :authenticate_user!

  def index
    @interviews = Interview.joins(:user).where(recipient_id: current_user.id).where.not(status: 3)
  end

  def reply
    @interview = Interview.find(params.require(:patch)[:id])
    if @interview.update(interview_params)
      @to_user = User.find(@interview.recipient_id)
      InterviewMailer.reply(@to_user.email).deliver
      flash[:success] = "replied!"
      redirect_to  controller: 'interview', action: 'index'
    end
  end

  def new
  end

  def make
    @reservation_date = make_params['reservation_date(1i)']+'-'+make_params['reservation_date(2i)']+'-'+make_params['reservation_date(3i)']+' '+make_params['reservation_date(4i)']+':'+make_params['reservation_date(5i)']
    if Interview.create(users_id: current_user.id, reservation_date: @reservation_date, recipient_id: make_params[:recipient_id])
      @to_user = User.find(make_params[:recipient_id])
      InterviewMailer.make(@to_user.email).deliver
      redirect_to :root
    end
  end

  def delete
    @interview = Interview.find(params.require(:patch)[:id])
    if @interview.update(status: 3)
      redirect_to :root
    end
  end

  private
    def interview_params
      params.require(:patch).permit(:status)
    end
    def make_params
      params.require(:patch).permit(:recipient_id, :reservation_date)
    end
    def authenticate_user!
      if !user_signed_in?
        redirect_to '/users/sign_in'
      end
    end
end
