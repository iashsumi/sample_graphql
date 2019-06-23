module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::UserMutations::UpdateUserMutation
    field :create_user, mutation: Mutations::UserMutations::CreateUserMutation
  end
end
