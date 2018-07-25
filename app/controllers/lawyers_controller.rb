class LawyersController < ApplicationController

  # find lawyer by params[:id] for show, edit, update and destroy actions
  before_action :find_lawyer, only: [:show, :edit, :update, :destroy]

  # new lawyer form
  def new
    @lawyer = Lawyer.new
  end

  # creates new lawyer and shows the new lawyer
  def create
    @lawyer = Lawyer.new(lawyer_params)
    @lawyer.save
    redirect_to @lawyer
  end


  def show
    @case = Case.where(specialization: @lawyer.specialization)
  end

  def edit
  end

  def update
    @lawyer.update(lawyer_params)
    redirect_to @lawyer
  end

private

  def lawyer_params
    params.require(:lawyer).permit(:number, :specialization, :description, :photo, :firm, :address)
  end

  def find_lawyer
    @lawyer = Lawyer.find(params[:id])
  end

end