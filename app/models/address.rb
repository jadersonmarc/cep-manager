class Address < ApplicationRecord
  belongs_to :user, foreign_key: :user_id

  ATTRIBUTES = %i[
    cep
    uf
    cidade
    bairro
    endereco_completo
    user_id
    email
  ]

  validates_presence_of :cep
  validates_presence_of :user_id 
end
