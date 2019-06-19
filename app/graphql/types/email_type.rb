module Types
  class EmailType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: true
  end
end
