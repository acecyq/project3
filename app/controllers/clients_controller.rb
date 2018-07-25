class ClientsController < ApplicationController

    #before_action :authenticate_user!

    def index
        # @heros = Hero.all
      end
    
      def show
    #Show all instances of cases created by the client
    #so find cases by client_id(from cases table foreign key) while client is an activerecord object 
        @client = Client.find(params[:id])
        @cases = Case.where(client_id: @client.id)
    # Also need to display current user name or email (once devise implemented)
        # @user = User.find(current_user.id)
    # Also buttons leading to cases#edit and  cases#destroy should be in the show
      end
    
      def new
      # renders new.html.erb client form with new empty instance of client model
        @client = Client.new
      end
    
      def create
      # this posts clients/new.html.erb client form to the database and redirect to that client's page
        @client = Client.new(client_params)
        @client.save
        redirect_to clients_path
        
      end
    
      def edit
      # this renders clients/edit.html.erb client from with previous client data already filled up
        @client = Client.find(params[:id])
      end
    
      def update
      # this patches clients/edit.html.erb client from to the database and redirect to that client's page 
        @client = Client.find(params[:id])
        @client.update(client_params)
        redirect_to client_path
      end

    
      private
    
      def client_params
        params.require(:client).permit(:number)
      end

end