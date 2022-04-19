# frozen_string_literal: true

module Api
  module V1
    class SubscriptionsController < ApplicationController
      def create
        customer = Customer.find(params[:customer_id])
        tea = Tea.find(params[:tea_id])

        subscription = customer.subscriptions.create!(subscription_params)

        render json: SubscriptionSerializer.new(subscription), status: 201
      end

      private

      def subscription_params
        params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
      end
    end
  end
end
