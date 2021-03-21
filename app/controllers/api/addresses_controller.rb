module Api
    class AddressesController < ApplicationController
        def cep
            '25220680'
        end
        
        def index
            account_id = '25220680'
            endereco = RestService.new.entities(cep)
            render json: endereco
        end

    end
end