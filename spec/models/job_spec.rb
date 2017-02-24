require 'rails_helper'

RSpec.describe Job, type: :model do
  it{ should belong_to :user }
  it{ should belong_to :worker }
end
