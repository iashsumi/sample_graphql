module Types
  class EmailsAttributes < BaseInputObject
    description 'Attributes for creating or updating a user'
    argument :id, ID, required: false
    argument :email, String, required: true
  end
end
