require 'rails_helper'

RSpec.describe "Api::Users", type: :request do
  let!(:user) { create(:user) }
  let(:json) { JSON.parse(response.body) }
  let(:user_id) { user.id }
  let(:headers) do
    {
      'Content-Type' => Mime[:json].to_s
    }
  end

  before { host! 'api.cep-manager.test' }

  describe 'GET /api/users/:id' do
    before do
     
      get "/api/users/#{user_id}", params: {}, headers: headers
    end

    context 'when the user exists' do
      it 'returns the user' do
        expect(json['id']).to eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user does not exist' do
      let(:user_id) { 10000 }        

      it 'returns status coide 404' do
        expect(response).to have_http_status(404)
      end
    end

  end

  
  describe 'PUT /api/users/:id' do
    before do
      put "/api/users/#{user_id}", params: { user: user_params }.to_json, headers: headers
    end

    context 'when the request params are valid' do
      let(:user_params) { { email: 'new_email@taskmanager.com' } }

      it 'retuns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the json data for the updated user' do
        expect(json['email']).to eq(user_params[:email])
      end
    end

    context 'when the request params are invalid' do
      let(:user_params) { { email: 'invalid_email@' } }

      it 'retuns status code 422' do
        expect(response).to have_http_status(422)
      end      

    end
  end


  describe 'DELETE /api/users/:id' do
    before do
      delete "/api/users/#{user_id}", params: {}, headers: headers
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'removes the user from database' do
      expect( User.find_by(id: user.id) ).to be_nil
    end
  end
end
