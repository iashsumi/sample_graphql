module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :emails, [Types::EmailType], null: true
  end
end
