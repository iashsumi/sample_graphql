# mutation {
#   createUser(name: "", emails: ["vdtfsatudtsa@dsdas.dsadsa", "dsadsads@dsadsa.dsa"]) 
#   {
#     message,
#     errors
#   }
# }
module Mutations
  module UserMutations
    class CreateUserMutation < BaseMutation
      include Common
      # define return fields
      field :message, String, null: true
      field :errors, [String], null: false

      # define arguments
      argument :name, String, required: true
      argument :emails_attributes, [Types::EmailsAttributes], required: false

      # define resolve method
      def resolve(**params)
        user_params = create_user_params(params)
        user = User.new(user_params)
        user.save
        create_response(user)
      end
    end
  end
end
