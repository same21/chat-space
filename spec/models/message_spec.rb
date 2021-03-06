require 'rails_helper'
describe Message do
  describe '#create' do
   it "is invalid without a body" do
    message = build(:message, body: "" )
    message.valid?
    expect(message.errors[:body]).to include("を入力してください")
   end
   it "is valid with a body that has some words" do
    message = build(:message, body:"hello")
    expect(message).to be_valid
   end

  end
end
