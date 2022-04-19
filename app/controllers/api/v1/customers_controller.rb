# frozen_string_literal: true

module Api
  module V1
    class CustomersController < ApplicationController
      def create
        customer = Customer.find_or_create_by!(customer_params)
        render json: CustomerSerializer.new(customer), status: 201
      end

      private

      def customer_params
        params.permit(:first_name, :last_name, :email, :address)
      end
    end
  end
end
