require 'rails_helper'

RSpec.describe Mutations::UserMutations::UpdateUserMutation do
  describe '#resolve' do
    let(:task) {  Mutations::UserMutations::UpdateUserMutation.new(object: nil, context: nil) }
    let(:user) { create(:user, name:'test_name') }
    let(:email) { create(:email, user: user, email:'test_address') }

    subject { task.resolve(hash) }

    context 'update user' do
      let(:hash) { { id: user.id, name: 'update_name', emails_attributes: [{ id: email.id, email: 'test_email@example.com' }]} }
      it 'to be updated' do
        subject
        expect(user.reload.name).to eq 'update_name'
        expect(email.reload.email).to eq 'test_email@example.com'
      end
    end

    context 'success response' do
      let(:hash) { { id: user.id, name: 'update_name', emails_attributes: [{ id: email.id, email: 'test_email@example.com' }]} }
      it 'to be message ok' do
        response = subject
        expect(response[:message]).to eq 'ok'
        expect(response[:errors]).to eq []
      end
    end

    context 'error response' do
      let(:hash) { { id: user.id, name: '', emails_attributes: [{ id: email.id, email: 'test_email@example.com' }]} }
      it 'to be message ng' do
        response = subject
        expect(response[:message]).to eq 'ng'
        expect(response[:errors].length).to eq 1
      end
    end
  end
end
