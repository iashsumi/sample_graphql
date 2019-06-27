RSpec.describe Queries::UserQueries::IndexUserQuery do
  describe '#resolve' do
    let(:task) {  Queries::UserQueries::IndexUserQuery.new(object: nil, context: nil) }

    subject { task.resolve(hash) }

    before do
      create(:user, name: 'name1')
      create(:user, name: 'name2')
    end

    context 'serach all' do
      let(:hash) { { name: nil } }
      it 'to be all' do
        expect(subject.count).to eq 2
      end
    end

    context 'serach name' do
      let(:hash) { { name: 'name1' } }
      it 'to be all' do
        expect(subject.count).to eq 1
      end
    end
  end
end