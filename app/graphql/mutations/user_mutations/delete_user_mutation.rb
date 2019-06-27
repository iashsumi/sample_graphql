# mutation {
#   deleteUser(
#       id: 1
#   )
# }
module Mutations
  module UserMutations
    class DeleteUserMutation < BaseMutation
      # define return fields
      type String

      # define arguments
      argument :id, ID, required: true

      # define resolve method
      def resolve(id:)
        User.find(id).destroy
        return 'delete ok'
      end
    end
  end
end
