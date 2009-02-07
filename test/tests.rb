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
  
  it "should get the home page for a user" do
    get("/stonehippo")
    @response.should be_ok
  end
  
  it "should list items for a user" do
    get("/foo/items")
    @response.should be_ok
  end
  
  it "should create a new item to track" do
    post("/foo/items")
    @response.should be_ok
  end
  
  it "should update an existing item" do
    put("/foo/items/1")
    @response.should be_ok
  end
  
  it "should create when updating a non-existent item"
  
  it "should delete an existing item" do
    delete("/foo/items/1")
    @response.should be_ok
  end
  
  it "should error when deleting a non-existent item"
  
  it "should reorder items" do
    pending "implementation of the list behavior"
  end
  
end
