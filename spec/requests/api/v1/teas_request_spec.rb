require 'rails_helper'

RSpec.describe 'Teas API' do
  describe 'POST /teas' do
    describe 'happy path' do
      it 'returns a new tea as a jsopn object' do
        tea_params = {
          title: 'Jasmine',
          description: 'A fine tea',
          temperature: 120,
          brew_time: 180
        }

        post '/api/v1/teas', params: tea_params

        created_tea = Tea.last

        expect(response.status).to eq(201)
        expect(created_tea.title).to eq(tea_params[:title])
        expect(created_tea.description).to eq(tea_params[:description])
        expect(created_tea.temperature).to eq(tea_params[:temperature])
        expect(created_tea.brew_time).to eq(tea_params[:brew_time])
      end
    end

    describe 'sad path' do
      it 'sends an error when params are incorrect' do
        tea_params = {
          title: 'Jasmine',
          temperature: 120,
          brew_time: 180
        }

        post '/api/v1/teas', params: tea_params

        expect(response.status).to eq(400)
        expect(response.body).to match(/Validation failed/)
      end

      it 'ignores attributes that are not permitted' do
        tea_params = {
          title: 'Jasmine',
          description: 'A fine tea',
          temperature: 120,
          brew_time: 180,
          non_permitted_attribute: 'this should not be here'
        }

        post '/api/v1/teas', params: tea_params

        tea = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(201)
        expect(tea[:data][:attributes]).to_not have_key(:non_permitted_attribute)
      end
    end
  end
end
