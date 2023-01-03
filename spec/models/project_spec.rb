require 'rails_helper'

RSpec.describe Project, type: :model do
  it "does not allow duplicate project names per user" do
    user = User.create(
      first_name: "Joe",
      last_name: "tester",
      email: "joetest@example.com",
      password: "123456-123456-joe"
    )

    user.projects.create(
      name: "Test Project",
    )

    new_project = user.projects.build(
      name: "Test Project",
    )

    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end

  it "allows two users to share a project name" do
    user = User.create(
      first_name: "joe",
      last_name: "tester",
      email: "joetester@example.com",
      password: "123456-test"
    )

    user.projects.create(
      name: "test project"
    )

    other_user = User.create(
      first_name: "jane",
      last_name: "tester",
      email: "test@example.com",
      password: "1234567"
    )

    other_project = other_user.projects.build(
      name: "test project"
    )

    expect(other_project).to be_valid
  end
end
