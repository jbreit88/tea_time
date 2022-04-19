# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customers API' do
  describe 'POST /customers' do
    describe 'happy path' do
      it 'returns a new customer as a json object' do
        customer_params = {
          first_name: 'Miguel',
          last_name: 'Andrage',
          email: 'miguel@andrage.com',
          address: '1435 Nogunna Live Here, Boulder, CO 80906'
        }

        post '/api/v1/customers', params: customer_params

        created_user = Customer.last

        expect(response.status).to eq(201)
        expect(created_user.first_name).to eq(customer_params[:first_name])
        expect(created_user.last_name).to eq(customer_params[:last_name])
        expect(created_user.email).to eq(customer_params[:email])
        expect(created_user.address).to eq(customer_params[:address])
      end
    end

    describe 'sad path' do
      it 'sends an error when params are incorrect' do
        customer_params = {
          first_name: 'Miguel',
          email: 'miguel@andrage.com',
          address: '1435 Nogunna Live Here, Boulder, CO 80906'
        }

        post '/api/v1/customers', params: customer_params

        expect(response.status).to eq(400)
        expect(response.body).to match(/Validation failed/)
      end

      it 'ignores attributes that are not permitted' do
        customer_params = {
          first_name: 'Miguel',
          last_name: 'Andrage',
          email: 'miguel@andrage.com',
          address: '1435 Nogunna Live Here, Boulder, CO 80906',
          non_permitted_attribute: 'not ok'
        }

        post '/api/v1/customers', params: customer_params

        customer = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(201)
        expect(customer[:data][:attributes]).to_not have_key(:non_permitted_attribute)
      end
    end
  end
end
