class SessionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @sessions = Session.where(status: 'open')
  end

  def show
    @session = Session.find(params[:id])
    @questions = @session.template.questions
  end

  def new
    @session = Session.new
    @templates = Template.all
  end

  def create
    @session = Session.new(session_params)
    @session.user = current_user  # Admin creating the session
    if @session.save
      redirect_to sessions_path, notice: "Session created successfully."
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:name, :status, :template_id)
  end

end
