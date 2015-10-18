require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build :user).to be_valid
  end
  describe "validation" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of :password }
  end
end
