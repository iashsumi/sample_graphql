require 'rails_helper'

RSpec.describe Mutations::UserMutations::DeleteUserMutation do
  describe '#resolve' do
    let(:task) {  Mutations::UserMutations::DeleteUserMutation.new(object: nil, context: nil) }
    let(:user) { create(:user, name:'test_name') }
    let(:email) { create(:email, user: user, email:'test_address') }

    subject { task.resolve(hash) }

    context 'delete user' do
      let(:hash) { { id: user.id } }
      it 'to be deleted' do
        subject
        expect(User.all.count).to eq 0
        expect(Email.all.count).to eq 0
      end
    end
  end
end
