require "sinatra/test/rspec"
require "habit_trail"

describe "Habit Trail" do
  
  it "should show a basic homepage" do
    get("/")
    @response.should be_ok
    @response.body.should =~ /Habit Trail/
  end
  
  it "should provide a screen stylesheet" do
    get("/screen.css")
    @response.should be_ok
    @response["Content-Type"].should =~ /text\/css/
    @response.body.should =~ /Arial/
  end
  
end