require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = User.new(email:'sample@sample.com', username:'Jett').save
      expect(user).to eq(false)
    end
    it 'ensures email presence' do
      user = User.new(username:'Jett', name:'Jett Duelist').save
      expect(user).to eq(false)
    end
    it 'ensures username presence' do
      user = User.new(email:'sample@sample.com', name:'Jett Duelist' ).save
      expect(user).to eq(false)
    end
  end
end
