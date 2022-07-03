class OrganisationsController < ApplicationController
  # feel free to replace this controller

  def index
    @organisations = Organisation.all
    @user = current_user
    @organisation = Organisation.new
  end

  def show 
    @organisation = Organisation.find(params[:id])
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
    if @organisation.save 
      flash[:notice] = "Organisation created successfully"
      redirect_to root_path
    else
      flash[:error] = "Organisation not created"
  end
end

def edit 
  @organisation = Organisation.find(params[:id])
end

def update
  @organisation = Organisation.find(params[:id])

  if @organisation.update(organisation_params)
    flash[:notification] = "Organisation updated"
    redirect_to root_path
  else
    flash.now[:error] = @organisation.errors.full_messages.to_sentence
    render :edit
  end
end

private
def organisation_params
  params.require(:organisation).permit(:name, :hourly_rate)
end
end