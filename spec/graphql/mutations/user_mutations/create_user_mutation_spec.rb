require 'rails_helper'

RSpec.describe Mutations::UserMutations::CreateUserMutation do
  describe '#resolve' do
    let(:task) {  Mutations::UserMutations::CreateUserMutation.new(object: nil, context: nil) }

    subject { task.resolve(hash) }

    context 'create user' do
      let(:hash) { { name: 'test_name', emails_attributes: [{ email: 'test_email@example.com' }]} }
      it 'to be created' do
        subject
        expect(User.all.count).to eq 1
        expect(Email.all.count).to eq 1
      end
    end

    context 'success response' do
      let(:hash) { { name: 'test_name', emails_attributes: [{ email: 'test_email@example.com' }]} }
      it 'to be message ok' do
        response = subject
        expect(response[:message]).to eq 'ok'
        expect(response[:errors]).to eq []
      end
    end

    context 'error response' do
      let(:hash) { { name: '', emails_attributes: [{ email: 'test_email@example.com' }]} }
      it 'to be message ng' do
        response = subject
        expect(response[:message]).to eq 'ng'
        expect(response[:errors].length).to eq 1
      end
    end
  end
end
