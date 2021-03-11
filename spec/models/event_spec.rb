require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:all) do
    params = { name: 'event', date: Time.now, location: 'Online', description: 'description of the event' }
    @event = Event.new(params)
    @no_name = Event.new(params.merge(name: nil)).save
    @no_description = Event.new(params.merge(description: nil)).save
    @no_date = Event.new(params.merge(date: nil)).save
    @no_location = Event.new(params.merge(location: nil)).save
  end

  context 'validation tests' do
    it 'ensure title presence' do
      expect(@no_name).to be false
    end

    it 'ensure description presence' do
      expect(@no_description).to be false
    end

    it 'ensure date presence' do
      expect(@no_date).to be false
    end

    it 'ensure location presence' do
      expect(@no_location).to be false
    end
  end

  context 'associations' do
    it { is_expected.to have_many(:attendances) }
    it { is_expected.to belong_to(:user) }
  end
end
