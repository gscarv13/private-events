require 'rails_helper'

RSpec.describe User, type: :model do
  # variables
  let(:user) { User.new(username: 'webdev2000') }

  it 'user should be valid' do
    expect(user).to be_valid
  end
end
