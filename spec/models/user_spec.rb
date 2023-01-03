require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a first name, last name, email, and password" do
    user = User.new(
      first_name: "Aaron",
      last_name: "Summer",
      email: "tester@example.com",
      password: "dottle-nouveau-pavillion-tight-furze",
    )
    expect(user).to be_valid
  end
  it "is invalid without a first name" do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end
  it "is invalid without a last name"
  it "is invalid without an email address"
  it "is invalid with a duplicate email address" do
    User.create(
      first_name: "Joe",
      last_name: "Ruby",
      email: "tester@example.com",
      password: "dottle-nouveau-pavillion-tight-furze",
    )
    user = User.new(
      first_name: "Joe",
      last_name: "Ruby",
      email: "tester@example.com",
      password: "dottle-nouveau-pavillion-tight-furze",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  it "return a user`s full name as a string" do
    user = User.new(
      first_name: "Aaron",
      last_name: "Summer",
      email: "tester@example.com",
      password: "dottle-nouveau-pavillion-tight-furze",
    )
    expect(user.name).to eq "Aaron Summer"
  end
end
