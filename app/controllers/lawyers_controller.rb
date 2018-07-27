class LawyersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_lawyer, only: [:show, :edit, :update, :destroy, :dashboard]

  # new lawyer form
  def new
    @lawyer = Lawyer.new
    @specialization = Specialization.all
  end

  # creates new lawyer and shows the new lawyer
  def create
    @lawyer = Lawyer.new(lawyer_params)
    @lawyer.user_id = current_user.id
    @lawyer.save
    redirect_to @lawyer
  end

  # shows lawyer profile
  def show
    @user = @lawyer.user
  end

  # edit lawyer profile
  def edit
    @specialization = Specialization.all
  end

  def update
    @lawyer.update(lawyer_params)
    redirect_to @lawyer
  end

  def dashboard
    @case = []
    @array = Case.all
    @array.each do |a|
      @lawyer.specializations.each do |s|
        if a.specialization == s.name
          @case << a
        end
      end
    end
  end

private

  def lawyer_params
    params.require(:lawyer).permit(:photo, :name, :number, :description, :firm, :address, :user_id, :specialization_ids => [])
  end

  def find_lawyer
    @lawyer = Lawyer.find(params[:id])
  end

end