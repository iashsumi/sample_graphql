# mutation {
#   updateUser(
#       id: 1
#       name: "update"
#   )
# }
module Mutations
  module UserMutations
    class UpdateUserMutation < BaseMutation
      include Common

      # define return fields
      field :message, String, null: true
      field :errors, [String], null: false

      # define arguments
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :emails_attributes, [Types::EmailsAttributes], required: false

      # define resolve method
      def resolve(**params)
        user_params = create_user_params(params)
        user = User.find(user_params[:id])
        user.update(user_params)
        create_response(user)
      end
    end
  end
end
