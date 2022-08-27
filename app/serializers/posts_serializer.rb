class PostSerializer < ActiveModel::Serializer
  attributes: :id, :Text, :Title
  has_many: comments
end    