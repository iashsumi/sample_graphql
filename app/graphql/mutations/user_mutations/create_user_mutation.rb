# mutation {
#   createUser(name: "test", emails: ["vdtfsatudtsa@dsdas.dsadsa", "dsadsads@dsadsa.dsa"])
# }
module Mutations
  module UserMutations
    class CreateUserMutation < BaseMutation
      # define return fields
      type String

      # define arguments
      argument :name, String, required: true
      argument :emails, [String], required: false

      # define resolve method
      def resolve(name: nil, emails: nil)
        user = User.create!(name: name)
        return 'OK' if emails.blank?
        emails.each do | email |
          user.emails << Email.new(email: email)
        end
        return 'OK'
      end
    end
  end
end
