require "sequel"

DB = Sequel.connect(['sqlite:',Dir.pwd,'/habit_trail.db'].join)

DB.create_table :users do
  primary_key :id
  column :email, :string
  column :username, :string
end

DB.create_table :items do
  primary_key :id
  column :user_id, :int
  column :description, :string
  column :start_date, :date
  column :display_order, :int
end

DB.create_table :streaks do
  primary_key :id
  column :item_id, :int
  column :task_done, :boolean
end

users = DB[:users]

users << {:email => "stonehippo@gmail.com", :username => "stonehippo"}
users << {:email => "ka20sea@mac.com", :username => "karen"}

items = DB[:items]

items << {:user_id => 1, :description => "Wash the dishes", :start_date => Date.today, :display_order => 1}
items << {:user_id => 1, :description => "Make the bed", :start_date => Date.today, :display_order => 2}

streaks = DB[:streaks]

90.times do
  streaks << {:item_id => 1, :task_done => rand.round}
end

90.times do
  streaks << {:item_id => 2, :task_done => rand.round}
end

