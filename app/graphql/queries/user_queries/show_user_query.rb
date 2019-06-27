module Queries
  module UserQueries
    class ShowUserQuery < Queries::BaseQuery
      type Types::UserType, null: false
      description 'Find a user by ID'
      argument :id, ID, required: true

      def resolve(id:)
        User.find(id)
      end
    end
  end
end
