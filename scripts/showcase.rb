#!/usr/bin/env ruby
# frozen_string_literal: true

##
# Centurion Theme Showcase - Ruby
# Demonstrates syntax highlighting with modern Ruby patterns
#

# Priority module with constants
module Priority
  LOW = 1
  MEDIUM = 2
  HIGH = 3

  NAMES = {
    LOW => "LOW",
    MEDIUM => "MEDIUM",
    HIGH => "HIGH",
  }.freeze

  def self.name(priority)
    NAMES[priority] || "UNKNOWN"
  end
end

##
# Task class representing a single task
#
class Task
  attr_reader :id, :title, :description, :priority, :created_at
  attr_accessor :completed

  ##
  # Initialize a new task
  #
  # @param [Integer] id Unique task identifier
  # @param [String] title Task title
  # @param [String] description Task description
  # @param [Integer] priority Priority level
  #
  def initialize(id, title, description, priority = Priority::MEDIUM)
    @id = id
    @title = title
    @description = description
    @priority = priority
    @completed = false
    @created_at = Time.now
  end

  ##
  # Mark task as completed
  #
  def complete
    @completed = true
  end

  ##
  # Check if task is completed
  #
  # @return [Boolean]
  #
  def completed?
    @completed
  end

  ##
  # String representation of task
  #
  # @return [String]
  #
  def to_s
    status = completed? ? "✓" : "○"
    "[#{status}] [#{Priority.name(priority)}] #{title}"
  end
end

##
# TaskManager class for managing multiple tasks
#
class TaskManager
  def initialize
    @tasks = {}
    @next_id = 1
  end

  ##
  # Add a new task to the manager
  #
  # @param [String] title Task title
  # @param [String] description Task description
  # @param [Integer] priority Priority level
  #
  # @return [Integer] Task ID
  #
  def add_task(title, description, priority = Priority::MEDIUM)
    id = @next_id
    @next_id += 1
    task = Task.new(id, title, description, priority)
    @tasks[id] = task
    puts "✓ Added task: #{title}"
    id
  end

  ##
  # Complete a task by ID
  #
  # @param [Integer] id Task ID
  #
  # @return [Boolean]
  #
  def complete_task(id)
    task = @tasks[id]
    return false unless task

    task.complete
    true
  end

  ##
  # Get task by ID
  #
  # @param [Integer] id Task ID
  #
  # @return [Task, nil]
  #
  def get_task(id)
    @tasks[id]
  end

  ##
  # Get all pending tasks
  #
  # @return [Array<Task>]
  #
  def pending_tasks
    @tasks.values.reject(&:completed?)
  end

  ##
  # Get high priority tasks
  #
  # @return [Array<Task>]
  #
  def high_priority_tasks
    @tasks.values.select do |task|
      task.priority == Priority::HIGH && !task.completed?
    end
  end

  ##
  # Get task statistics
  #
  # @return [Hash]
  #
  def stats
    total = @tasks.size
    completed = @tasks.values.count(&:completed?)
    pending = total - completed
    high_priority = @tasks.values.count { |t| t.priority == Priority::HIGH }

    {
      total: total,
      completed: completed,
      pending: pending,
      high_priority: high_priority,
      completion_rate: total.positive? ? ((completed.to_f / total) * 100).round(1) : 0,
    }
  end

  ##
  # Filter tasks by criteria
  #
  # @param [Hash] criteria Filter criteria
  #
  # @return [Array<Task>]
  #
  def filter_tasks(criteria = {})
    filtered = @tasks.values

    if criteria[:completed].is_a?(TrueClass) || criteria[:completed].is_a?(FalseClass)
      filtered = filtered.select { |task| task.completed? == criteria[:completed] }
    end

    if criteria[:priority]
      filtered = filtered.select { |task| task.priority == criteria[:priority] }
    end

    filtered
  end

  ##
  # Sort tasks by criteria
  #
  # @param [String] sort_by Sort key
  # @param [Boolean] ascending Sort direction
  #
  # @return [Array<Task>]
  #
  def sort_tasks(sort_by = :priority, ascending = false)
    sorted = @tasks.values.sort do |a, b|
      compare_value = case sort_by
                      when :title
                        a.title.downcase <=> b.title.downcase
                      when :priority
                        a.priority <=> b.priority
                      when :created_at
                        a.created_at <=> b.created_at
                      else
                        0
                      end

      ascending ? compare_value : -compare_value
    end

    sorted
  end
end

##
# Demo: Create and manage tasks
#
def main
  manager = TaskManager.new

  # Add sample tasks
  manager.add_task(
    "Setup development environment",
    "Install dependencies and configure tools",
    Priority::HIGH
  )

  manager.add_task(
    "Implement core features",
    "Build the main functionality",
    Priority::HIGH
  )

  manager.add_task(
    "Write unit tests",
    "Achieve 85% code coverage",
    Priority::MEDIUM
  )

  manager.add_task(
    "Documentation",
    "Write API documentation",
    Priority::LOW
  )

  # Complete some tasks
  manager.complete_task(1)
  manager.complete_task(3)

  # Display statistics
  puts "\n#{"=" * 50}"
  puts "Task Statistics"
  puts "=" * 50

  stats = manager.stats
  stats.each do |key, value|
    label = key.to_s.gsub("_", " ").capitalize
    puts "#{label}:".ljust(25) + value.to_s
  end

  # Display pending tasks
  puts "\n#{"=" * 50}"
  puts "Pending Tasks"
  puts "=" * 50

  manager.pending_tasks.each do |task|
    puts "  #{task}"
  end

  # Display high priority tasks
  puts "\n#{"=" * 50}"
  puts "High Priority Tasks"
  puts "=" * 50

  high_priority = manager.high_priority_tasks
  if high_priority.empty?
    puts "  No high priority tasks"
  else
    high_priority.each do |task|
      puts "  #{task}"
    end
  end

  # Display sorted tasks
  puts "\n#{"=" * 50}"
  puts "All Tasks (sorted by priority)"
  puts "=" * 50

  manager.sort_tasks(:priority, false).each do |task|
    puts "  #{task}"
  end
end

# Run demo if executed directly
main if __FILE__ == $PROGRAM_NAME
