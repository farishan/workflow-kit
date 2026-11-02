require_relative "../app"

RSpec.describe "greet" do
  it "returns greeting" do
    expect(greet("Ruby")).to eq("Hello, Ruby!")
  end
end
