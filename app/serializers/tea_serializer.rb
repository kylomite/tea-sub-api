class TeaSerializer
  include JSONAPI::Serializer
  attributes  :title,
              :description,
              :temp,
              :brew_time,
              :price,
              :image
end
