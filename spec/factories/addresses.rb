FactoryBot.define do
  factory :address do
    cep { "MyString" }
    uf { "MyString" }
    cidade { "MyString" }
    bairro { "MyString" }
    endereco_completo { "MyString" }
    user { nil }
  end
end
