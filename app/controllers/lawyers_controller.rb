class LawyersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_lawyer, only: [:show, :edit, :update, :destroy, :dashboard]
  before_action :all_spec, only: [:new, :edit]

  # new lawyer form
  def new
    @lawyer = Lawyer.new
  end

  # creates new lawyer and shows the new lawyer
  def create
    @lawyer = Lawyer.new(lawyer_params)
    @lawyer.user_id = current_user.id
    @lawyer.save
    redirect_to cases_path
  end

  # shows lawyer profile
  def show
    @user = @lawyer.user
  end

  # edit lawyer profile
  def edit
  end

  # updates the lawyer profile
  def update
    @lawyer.update(lawyer_params)
    redirect_to @lawyer
  end

  # lawyer's dashboard
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

  # find the lawyer by the URL params
  def find_lawyer
    @lawyer = Lawyer.find(params[:id])
  end

  def all_spec
    @specialization = Specialization.all
  end

end