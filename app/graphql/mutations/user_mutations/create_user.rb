# mutation {
#   createUser(name: "test", emails: ["vdtfsatudtsa@dsdas.dsadsa", "dsadsads@dsadsa.dsa"])
# }
module Mutations
  module UserMutations
    class CreateUser < BaseMutation
      type String
      argument :name, String, required: true
      argument :emails, [String], required: false

      def resolve(name: nil, emails: nil)
        user = User.create!(name: name)
        return 'OK' if emails.blank?
        emails.each do | email |
          user.emails << Email.new(email: email)
        end
        return 'OK'
      rescue ActiveRecord::RecordInvalid => e
        #GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
