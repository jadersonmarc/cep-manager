require 'rails_helper'

RSpec.describe Address, type: :model do

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of :cep }
  it { is_expected.to validate_presence_of :user_id }

  it { is_expected.to respond_to(:uf) }
  it { is_expected.to respond_to(:cidade) }
  it { is_expected.to respond_to(:bairro) }
  it { is_expected.to respond_to(:endereco_completo) }
end
