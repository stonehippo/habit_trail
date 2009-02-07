require "rubygems"
require "sinatra"
require "png"
require "base64"
require "sequel"

db = Sequel.connect(['sqlite:',Dir.pwd,'/habit_trail.db'].join)

class User < Sequel::Model
  one_to_many :items
end

class Item < Sequel::Model
  one_to_many :streaks
  
  def day_count
    self.streaks.size
  end
  
  def streak_data
    data = []
    self.streaks.each do |streak|
      data << ((streak.task_done) ? 1 : 0)
    end
    data
  end
end

class Streak < Sequel::Model
end

get "/" do
  @users = User.all
  haml :index
end

get "/screen.css" do
  content_type "text/css", :charset => "utf-8"
  sass :screencss
end

get "/:name" do
  if (@user = User.filter('username = ?', params[:name]).first)
    @items = @user.items
    
    haml :user
  else
    # TODO handle this a bit better!
    halt 500, "no such user, dude"
  end
end

get "/:name/items" do
  
end

post "/:name/items" do
  
end

put "/:name/items/:item" do
  
end

delete "/:name/items/:item" do
  
end

helpers do
  def get_title
    return "Habit Trail"
  end
  
  def generate_sparkline(data=[], options={})
    @height = 10
    @graphic_height = @height - 1
    
    @canvas = PNG::Canvas.new data.size * 4, @height, PNG::Color::White 
    
    i = 0
    data.each do |datum|
      @color = (datum == 1) ? PNG::Color::Red : PNG::Color::White
      @canvas.line i, 0, i, @graphic_height, @color
      @canvas.line i+1, 0, i+1, @graphic_height, @color
      i += 4
    end

    png = PNG.new @canvas
    Base64.encode64(png.to_blob)
  end
end
  