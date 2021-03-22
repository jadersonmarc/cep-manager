module Api
    class AddressesController < ApplicationController
        respond_to :json

        def index
            
            address = Address.joins("INNER JOIN users ON users.id = addresses.user_id ")
            render json: { address: address }, status: 200
        end
    
      def show
        address = current_user.address.find(address_params[:id])
        render json: address, status: 200
      end
    
      def create
        address_cep = address_params[:cep]
        address = Address.new

        response = RestService.new.send(address_cep)
        user_address = JSON.parse(response.to_json)  

        address.cep               = user_address['cep']
        address.uf                = user_address['uf']
        address.cidade            = user_address['cidade']
        address.bairro            = user_address['bairro']
        address.endereco_completo = user_address['logradouro']
        address.user_id           = current_user.id

        if address.save
          render json: address, status: 201
        else
          render json: { errors: address.errors }, status: 422
        end
      end
    


        protected
   
        def address_params
         params.required(:addresses)
               .permit(:cep, :uf, :cidade, :bairro, :endereco_completo)
        end
    end
end