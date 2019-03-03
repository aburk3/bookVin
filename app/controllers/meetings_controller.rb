class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destory]
  def index
    if params[:club_id]
      @meetings = Club.find(params[:club_id]).meetings
    else
      @meetings = Meetings.all
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @club = Club.find(params[:club_id])
    @meeting = Meeting.new
  end

  def create
    binding.pry
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      binding.pry
      redirect_to club_path, notice: "Meeting was succesfully created."
    else
      render :new
    end
  end

  private
    def meeting_params
      params.require(:meeting).permit(
        :name,
        :description,
        :count,
        :meeting_datetime,
      )
    end

    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

end
