# frozen_string_literal: true

class CustomerAndSubscriptionsSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :email, :address

  attribute :subscriptions, &:subscriptions
end
