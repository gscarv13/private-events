require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(username: 'webdev2000')
    @invalid = User.new(username: ' ')
    @invalid2 = User.new(username: 'abc')
    @invalid3 = User.new(username: 'abc123asd123asd123asd123asd123asd123asd123')
  end

  context 'validations' do
    it 'user should be valid' do
      expect(@user).to be_valid
    end

    it 'should have matching username' do
      expect(@user.username).to eq('webdev2000')
    end

    it 'should not accept empty username' do
      expect(@invalid).to_not be_valid
    end

    it 'should not accept less than 4 characters' do
      expect(@invalid2).to_not be_valid
    end

    it 'should not accept more than 15 characters' do
      expect(@invalid3).to_not be_valid
    end

    it 'should save if valid' do
      expect(@user.save).to be true
    end
  end

  context 'associations' do
    it { is_expected.to have_many(:events) }
    it { is_expected.to have_many(:attendances) }
  end
end
