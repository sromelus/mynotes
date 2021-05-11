require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user) {
    User.new(first_name: "John", last_name: "James", email: "john@mail.com", password: "password", confirm_password: "password")
  }

  subject {
    described_class.new(title: "things to do",
                        body: "laundry, cleaning",
                        user_id: 1
    )
  }

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "title length is less then equal 30 characters" do
    len = subject.title.length
    expect(len).to be <= 30
  end
  
  it "body length is less then equal 1000 characters" do
    len = subject.body.length
    expect(len).to be <= 1000
  end

  describe "Associations" do
    it { should belong_to(:user) }
  end
end


