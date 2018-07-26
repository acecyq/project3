class CasesController < ApplicationController

before_action :authenticate_user!
before_action :find_case, only: [ :update, :destroy, :show]

    def index
        @client = Client.find_by user_id: current_user.id
        @lawyer = Lawyer.find_by user_id: current_user.id
        if @client == nil && @lawyer == nil
            render "selection"
            user_session[:user] = "botak" 
        elsif @client == nil
            redirect_to dashboard_lawyer_path(@lawyer)
            user_session[:user] = "lawyer" 
        else @lawyer == nil
            redirect_to client_path(@client)
            user_session[:user] = "client"
        end
    end

    def create
        @specialization = Specialization.all
        @case = Case.new(case_params)
        @client = Client.find(params[:client_id])
        @case.client_id = @client.id
        @case.save
        redirect_to '/'
    end

    def new

        @client = Client.find(params[:client_id])
        
        @specialization = Specialization.all

        @case = Case.new
    end

    def edit
        @client = Client.find(params[:client_id])
        @case = Case.find(params[:id])
        
        @specialization = Specialization.all

    end

    def update
        @case.update(case_params)
        redirect_to '/'        
    end

    def destroy
        @case.destroy
        redirect_to '/'
    end

    def show
        @client = Client.find(@case.client_id)
        # should show case by id layout - case details followed by client details
        
    end

private

    def case_params
        params.require(:case).permit(:title, :specialization, :description, :client_id)
    end
    
    def find_case
        @case = Case.find(params[:id])
    end
end