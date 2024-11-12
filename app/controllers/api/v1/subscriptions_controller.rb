class Api::V1::SubscriptionsController < ApplicationController
    def index
        subscriptions = Subscription.all
        render json: SubscriptionSerializer.new(subscriptions)
    end
end