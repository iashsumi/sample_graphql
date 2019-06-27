RSpec.describe Queries::UserQueries::ShowUserQuery do
  describe '#resolve' do
    let(:task) {  Queries::UserQueries::ShowUserQuery.new(object: nil, context: nil) }
    let(:user) { create(:user) }

    subject { task.resolve(hash) }

    context 'serach id' do
      let(:hash) { { id: user.id } }
      it 'to be find' do
        expect(subject).to eq user
      end
    end
  end
end