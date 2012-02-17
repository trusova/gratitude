require 'spec_helper'

describe Day do
  
  context "Sharing" do
    
    it 'Should have at least 3 gratitudes before you can share' do
      day = Day.create()
      
      day.canShare.should be_false
      
      user = User.make!
      
      gratitudeOne = Gratitude.make!(:user => user)
      gratitudeTwo = Gratitude.make!(:user => user)
      gratitudeThree = Gratitude.make!(:user => user)
      
      gratitudeOne.update_attribute(:day, day)
      gratitudeTwo.update_attribute(:day, day)
      day.reload
      
      day.canShare.should be_false
      day.reload
      
      gratitudeThree.update_attribute(:day, day)
      
      day.canShare.should be_true
    end
  end
  
end
