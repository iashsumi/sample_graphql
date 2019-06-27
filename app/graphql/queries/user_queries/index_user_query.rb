module Queries
  module UserQueries
    class IndexUserQuery < Queries::BaseQuery
      type [Types::UserType], null: true
      description 'Search user by argument'
      argument :name, String, required: false, default_value: nil

      def resolve(name:)
        return User.all if name.blank?

        User.where(name: name)
      end
    end
  end
end
