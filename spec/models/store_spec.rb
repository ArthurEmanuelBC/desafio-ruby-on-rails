require 'rails_helper'

RSpec.describe Store, type: :model do
  it { should belong_to :cnab }
end
