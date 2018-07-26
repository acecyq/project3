class ClientsController < ApplicationController

    before_action :authenticate_user!
    before_action :find_client, only: [:show, :edit, :update, :destroy]

    def index
        # @client = Client.all
      end
    
    def show
    #Show all instances of cases created by the client
    #so find cases by client_id(from cases table foreign key) while client is an activerecord object 
      @cases = Case.where(client_id: @client.id)
    # Also need to display current user name or email (once devise implemented)
      @user = User.find(current_user.id)
        
    # Also buttons leading to cases#edit and  cases#destroy should be in the show
      end
    
      def new
      # renders new.html.erb client form with new empty instance of client model
      @user = User.find(current_user.id)  
      @client = Client.new
      end
    
      def create
      # this posts clients/new.html.erb client form to the database and redirect to that client's page
        @client = Client.new(client_params)
        @client.user_id = current_user.id
        @client.save
        redirect_to client_path(@client)
        
      end
    
      def edit
      @user = User.find(current_user.id)
      # this renders clients/edit.html.erb client from with previous client data already filled up
      end
    
      def update
      # this patches clients/edit.html.erb client from to the database and redirect to that client's page 
        @client.update(client_params)
        redirect_to client_path
      end
    
      private
    
      def client_params
        params.require(:client).permit(:name, :number)
      end

      def find_client
        @client = Client.find(params[:id])
      end

end