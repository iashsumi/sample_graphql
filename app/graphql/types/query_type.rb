module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # First describe the field signature:
    field :user, UserType, null: true do
      description "Find a user by ID"
      argument :id, ID, required: true
    end

    # Then provide an implementation:
    def user(id:)
      User.find(id)
    end
  end
end
