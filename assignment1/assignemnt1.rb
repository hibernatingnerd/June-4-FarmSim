require "pry"
class Task

  def initialize(description, due_date)
    @description = description
    @due_date = due_date
  end

  attr_accessor :description, :due_date

end

x = Task.new("pass go", "July 1st")
y = Task.new("collect 200 dollars", "June 1st")
z = Task.new("go to jail", "May 1st")

class TodoList < Task

  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end

end
binding.pry
