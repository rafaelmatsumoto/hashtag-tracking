require 'rails_helper'

RSpec.describe Tweet, type: :model do
  subject { 
    described_class.new(text: "Foo bar", published_date: DateTime.new(2001,2,3,4,5,6))
  } 

  it "is valid with attributes" do
    expect(subject).to be_valid  
  end
  
  it "is not valid without a text" do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a publishment date" do
    subject.published_date = nil
    expect(subject).to_not be_valid
  end

end
