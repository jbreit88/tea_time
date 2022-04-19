# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Subscriptions API' do
  describe 'POST /subscriptions' do
    before(:each) do
      create(:customer, id: 1)
      create(:tea, id: 1)
    end

    describe 'happy path' do
      it 'returns a new subscription as a json object' do
        subscription_params = {
          title: 'Teas Please',
          price: 1700,
          frequency: 'weekly',
          customer_id: 1,
          tea_id: 1
        }

        post '/api/v1/subscriptions', params: subscription_params

        created_subscription = Subscription.last
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(201)
        expect(created_subscription.title).to eq(subscription_params[:title])
        expect(created_subscription.price).to eq(subscription_params[:price])
        expect(created_subscription.frequency).to eq(subscription_params[:frequency])
        expect(created_subscription.customer_id).to eq(subscription_params[:customer_id])
        expect(created_subscription.tea_id).to eq(subscription_params[:tea_id])

        expect(response_body[:data][:attributes]).to have_key(:customer)
        expect(response_body[:data][:attributes][:customer]).to have_key(:first_name)
        expect(response_body[:data][:attributes][:customer]).to have_key(:last_name)
        expect(response_body[:data][:attributes][:customer]).to have_key(:email)
        expect(response_body[:data][:attributes][:customer]).to have_key(:address)

        expect(response_body[:data][:attributes]).to have_key(:tea)
        expect(response_body[:data][:attributes][:tea]).to have_key(:title)
        expect(response_body[:data][:attributes][:tea]).to have_key(:description)
        expect(response_body[:data][:attributes][:tea]).to have_key(:temperature)
        expect(response_body[:data][:attributes][:tea]).to have_key(:brew_time)
      end
    end

    describe 'sad path' do
      it 'sends a 400 error when params are incorrect' do
        subscription_params = {
          title: 'Teas Please',
          frequency: 'weekly',
          customer_id: 1,
          tea_id: 1
        }

        post '/api/v1/subscriptions', params: subscription_params

        expect(response.status).to eq(400)
        expect(response.body).to match(/Validation failed/)
      end

      it 'sends a 404 error when customer id is missing' do
        subscription_params = {
          title: 'Teas Please',
          description: 'This is a fine tea',
          frequency: 'weekly',
          tea_id: 1
        }

        post '/api/v1/subscriptions', params: subscription_params

        expect(response.status).to eq(404)
        expect(response.body).to match(/Couldn't find Customer/)
      end

      it 'sends a 404 error when customer id is invalid' do
        subscription_params = {
          title: 'Teas Please',
          description: 'This is a fine tea',
          frequency: 'weekly',
          customer_id: 'hello',
          tea_id: 1
        }

        post '/api/v1/subscriptions', params: subscription_params

        expect(response.status).to eq(404)
        expect(response.body).to match(/Couldn't find Customer/)
      end

      it 'sends a 404 error when tea id is missing' do
        subscription_params = {
          title: 'Teas Please',
          description: 'This is a fine tea',
          frequency: 'weekly',
          customer_id: 1
        }

        post '/api/v1/subscriptions', params: subscription_params

        expect(response.status).to eq(404)
        expect(response.body).to match(/Couldn't find Tea/)
      end

      it 'sends a 404 error when tea_id is invalid' do
        subscription_params = {
          title: 'Teas Please',
          description: 'This is a fine tea',
          frequency: 'weekly',
          customer_id: 1,
          tea_id: 'hello'
        }

        post '/api/v1/subscriptions', params: subscription_params

        expect(response.status).to eq(404)
        expect(response.body).to match(/Couldn't find Tea/)
      end
    end
  end

  describe 'PATCH /subscriptions' do
    let!(:customer) { Customer.create!(first_name: 'Margaret', last_name: 'Thatcher', email: 'm@t.com', address: 'I live here st, boulder, co 80506') }
    let!(:tea) { Tea.create!(title: 'Teas Please', description: 'This is a fine tea.', temperature: 120, brew_time: 180) }

    describe 'happy path' do
      it 'returns an updated subscription object' do
        subscription = Subscription.create!(title: 'Teas for Days', price: 1799, status: 'active', frequency: 'monthly', customer_id: customer.id, tea_id: tea.id)

        expect(subscription.status).to eq('active')

        update_params = {
          id: subscription.id,
          status: 'cancelled'
        }

        patch '/api/v1/subscriptions', params: update_params

        updated = Subscription.find(subscription.id)

        expect(response.status).to eq(202)
        expect(updated.status).to eq('cancelled')
      end
    end

    describe 'sad path' do
      it 'returns an error when no invalid id is passed' do
        subscription = Subscription.create!(title: 'Teas for Days', price: 1799, status: 'active', frequency: 'monthly', customer_id: customer.id, tea_id: tea.id)

        expect(subscription.status).to eq('active')

        update_params = {
          id: 'invalid_id',
          status: 'cancelled'
        }

        patch '/api/v1/subscriptions', params: update_params

        expect(response.status).to eq(404)
        expect(response.body).to match(/Couldn't find Subscription/)
      end

      it 'ignores attributes that are not assigned to the subscription' do
        subscription = Subscription.create!(title: 'Teas for Days', price: 1799, status: 'active', frequency: 'monthly', customer_id: customer.id, tea_id: tea.id)

        expect(subscription.status).to eq('active')

        update_params = {
          id: subscription.id,
          status: 'cancelled',
          non_permitted_attribute: 'this should be ignored'
        }

        patch '/api/v1/subscriptions', params: update_params

        updated = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(202)
        expect(updated[:data][:attributes]).to_not have_key(:non_permitted_attribute)
      end
    end
  end
end
