class Api::V1::SubscriptionsController < ApplicationController
    def index
      subscriptions = Subscription.all
      render json: SubscriptionSerializer.new(subscriptions).serializable_hash
    end

    def show
      begin
        subscription = Subscription.find(params[:id])
        render json: SubscriptionSerializer.new(subscription).serializable_hash
      rescue ActiveRecord::RecordNotFound => e
        render json: ErrorSerializer.serialize_error(e.message, 404), status: :not_found
      end
    end

    def update
      subscription = Subscription.find_by(id: params[:id].to_i)

      if params[:toggle_active]
        subscription.toggle_active
        subscription.save!
      end

      render json: SubscriptionSerializer.new(subscription).serializable_hash
    end

    private

    def subscription_params
        params.permit(:active)
    end
end