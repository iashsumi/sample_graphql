module Types
  class EmailType < Types::BaseObject
    field :id, ID, null: true
    field :email, String, null: true
  end
end
