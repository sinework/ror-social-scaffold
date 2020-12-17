require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:test_user) { User.create(name: 'Test User', email: 'john@doe.com', password: '123456') }
  let(:test_friend) { User.create(name: 'Test Friend', email: 'john@doe.com', password: '123456') }

  let(:subject) do
    described_class.new(
      user_id: test_user.id,
      friend_id: test_friend.id
    )
  end

  describe 'validations' do
    it 'is not valid without a user' do
      subject.user_id = ''
      expect(subject).not_to be_valid
    end

    it 'is not valid without a friend' do
      subject.friend_id = ''
      expect(subject).not_to be_valid
    end
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:friend) }
end
