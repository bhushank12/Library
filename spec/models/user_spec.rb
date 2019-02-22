require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let!(:user) { build(:user) }

    it 'should be valid library' do
      expect(user).to be_valid
    end

    it 'validates presence of name' do 
      user.name = nil
      expect(user).to_not be_valid
      expect(user.errors['name']).to eq(["can't be blank"])
    end

    it 'validates presence of email' do
      user.email = nil
      expect(user).to_not be_valid
      expect(user.errors['email']).to eq(["can't be blank"])
    end

    it 'validates email syntax' do 
      user.email = '@gmail.com'
      expect(user).to_not be_valid
      expect(user.errors['email']).to eq(['is invalid'])
    end

    it 'validates length of password' do 
      user.password = '1'
      expect(user).to_not be_valid
      expect(user.errors['password']).to eq(['is too short (minimum is 6 characters)'])
    end

    it 'validates presence of password' do 
      user.password = nil
      expect(user).to_not be_valid
      expect(user.errors['password']).to eq(["can't be blank"])
    end
  end 
end