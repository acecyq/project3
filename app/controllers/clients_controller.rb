class ClientsController < ApplicationController

    def index
        # @heros = Hero.all
      end
    
      def show
        # @hero = Hero.find(params[:id])
        # @items = @hero.items
      end
    
      def new
        @client = Client.new
      end
    
      def create
        @client = Client.new(client_params)
        @client.save
        #redirect_to hero_path(@hero)
      end
    
      def edit
        @client = Client.find(params[:id])
      end
    
      def update
        @client = Client.find(params[:id])
        @client.update(client_params)
        #redirect_to hero_path(@hero)
      end
    
      def delete
        # @hero = Hero.find(params[:id])
        # @hero.destroy
        # redirect_to heros_path
      end
    
      private
    
      def client_params
        params.require(:client).permit(:name, :email, :number)
      end

end