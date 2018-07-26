class CasesController < ApplicationController

before_action :find_case, only: [:edit, :update, :delete, :show]

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