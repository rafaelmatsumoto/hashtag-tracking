require 'rails_helper'

RSpec.describe Hashtag, type: :model do
    subject { 
        described_class.new(name: "Foo bar")
    } 
    
    it "is valid with attributes" do
        expect(subject).to be_valid  
    end
      
    it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it { should have_many(:tweets) } 
end
