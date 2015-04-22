require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:password).is_at_least(3) }
  it { should validate_confirmation_of(:password) }

  subject { FactoryGirl.create :user }

  describe '#admin?' do
    pending 'add implementation'
  end
end
