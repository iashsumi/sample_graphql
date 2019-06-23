module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :users, resolver: Queries::UserQueries::IndexUserQuery
    field :user, resolver: Queries::UserQueries::ShowUserQuery
  end
end
