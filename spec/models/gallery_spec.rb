require 'rails_helper'
require 'spec_helper'

RSpec.describe Gallery, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of :name }
  it { should have_one_attached(:image) }
end
