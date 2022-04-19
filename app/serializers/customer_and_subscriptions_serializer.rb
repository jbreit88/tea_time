class CustomerAndSubscriptionsSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :email, :address

  attribute :subscriptions do |object|
    object.subscriptions
  end
end
