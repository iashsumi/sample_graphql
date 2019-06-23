# mutation {
#   updateUser(
#       id: 1
#       name: "update"
#   )
# }
module Mutations
  module UserMutations
    class UpdateUserMutation < BaseMutation
      # define return fields
      type String

      # define arguments
      argument :id, ID, required: true
      argument :name, String, required: true

      # define resolve method
      def resolve(id:, name:)
        user = User.find(id)
        user.name = name
        user.save
        return 'ok'
      end
    end
  end
end
