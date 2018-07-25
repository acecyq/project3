class CasesController < ApplicationController

before_action :authenticate_user!
before_action :find_case, only: [:edit, :update, :delete]

    def index
        @client = Client.find_by user_id: current_user.id
        @lawyer = Lawyer.find_by user_id: current_user.id
        if @client == nil && @lawyer == nil
            render "selection"
        elsif @client == nil
            redirect_to lawyer_path(@lawyer)
        else @lawyer == nil
            redirect_to client_path(@client)
        end
    end

    def create
        @case = Case.new(case_params)
        # @client = Client.find(params[:client_id]).id
        # @case.client_id << @client
        @case.save
        redirect_to '/'
    end

    def new
        @case = Case.new
    end

    def edit
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