require "sequel"

DB = Sequel.connect(['sqlite:',Dir.pwd,'/habit_trail.db'].join)

module HabitTrail
  
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
  
end