class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :title, :price, :status, :frequency

  attribute :customer do |object|
    object.customer
  end

  attribute :tea do |object|
    object.tea
  end

end
