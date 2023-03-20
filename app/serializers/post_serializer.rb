class PostSerializer < ActiveModel::Serializer
  attributes :id,:article,:image


  attribute :image do |object, params|
    # byebug
      if object.object.image.attached?
        # object.object.image.map do |img|
          if Rails.env == 'development' || Rails.env == 'test'
            Rails.application.routes.url_helpers.url_for(object.object.image)
          else
            object.object.image.service_url.split('?').first
          end
      end
    end
end
