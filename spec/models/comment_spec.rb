require 'spec_helper'

describe Comment do

  describe 'associations' do
    it {should belong_to :article}
  end

  describe 'validations' do
    it {should validate_length_of :body}
  end

end