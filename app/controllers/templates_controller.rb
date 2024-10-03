class TemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)

    if @template.save
      redirect_to new_template_question_path(@template), notice: "Template created successfully."
    else
      render :new
    end
  end

  private

  def template_params
    params.require(:template).permit(:name, :description)
  end

  def check_admin
    redirect_to root_path, alert: "You are not authorized." unless current_user.admin?
  end

end
