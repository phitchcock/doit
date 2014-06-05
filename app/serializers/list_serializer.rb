class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :tasks, :user
end
