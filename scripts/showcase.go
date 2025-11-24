package main

import (
	"fmt"
	"sort"
	"time"
)

// Priority represents the task priority level
type Priority int

const (
	PriorityLow    Priority = 1
	PriorityMedium Priority = 2
	PriorityHigh   Priority = 3
)

// PriorityName maps Priority values to their string representations
var PriorityName = map[Priority]string{
	PriorityLow:    "LOW",
	PriorityMedium: "MEDIUM",
	PriorityHigh:   "HIGH",
}

// Task represents a single task with metadata
type Task struct {
	ID          int
	Title       string
	Description string
	Priority    Priority
	Completed   bool
	CreatedAt   time.Time
}

// NewTask creates a new task with the given parameters
func NewTask(id int, title, description string, priority Priority) *Task {
	return &Task{
		ID:          id,
		Title:       title,
		Description: description,
		Priority:    priority,
		Completed:   false,
		CreatedAt:   time.Now(),
	}
}

// Complete marks the task as completed
func (t *Task) Complete() {
	t.Completed = true
}

// IsCompleted checks if the task is completed
func (t *Task) IsCompleted() bool {
	return t.Completed
}

// String returns a string representation of the task
func (t *Task) String() string {
	status := "○"
	if t.Completed {
		status = "✓"
	}
	return fmt.Sprintf("%s [%s] %s", status, PriorityName[t.Priority], t.Title)
}

// TaskManager manages a collection of tasks
type TaskManager struct {
	tasks  map[int]*Task
	nextID int
}

// NewTaskManager creates a new task manager instance
func NewTaskManager() *TaskManager {
	return &TaskManager{
		tasks:  make(map[int]*Task),
		nextID: 1,
	}
}

// AddTask adds a new task to the manager
func (tm *TaskManager) AddTask(title, description string, priority Priority) int {
	id := tm.nextID
	tm.nextID++
	task := NewTask(id, title, description, priority)
	tm.tasks[id] = task
	fmt.Printf("✓ Added task: %s\n", title)
	return id
}

// CompleteTask marks a task as completed
func (tm *TaskManager) CompleteTask(id int) bool {
	if task, exists := tm.tasks[id]; exists {
		task.Complete()
		fmt.Printf("✓ Completed: %s\n", task.Title)
		return true
	}
	return false
}

// GetTask retrieves a task by ID
func (tm *TaskManager) GetTask(id int) (*Task, bool) {
	task, exists := tm.tasks[id]
	return task, exists
}

// PendingTasks returns all incomplete tasks
func (tm *TaskManager) PendingTasks() []*Task {
	var pending []*Task
	for _, task := range tm.tasks {
		if !task.Completed {
			pending = append(pending, task)
		}
	}
	return pending
}

// HighPriorityTasks returns all high-priority incomplete tasks
func (tm *TaskManager) HighPriorityTasks() []*Task {
	var highPriority []*Task
	for _, task := range tm.tasks {
		if task.Priority == PriorityHigh && !task.Completed {
			highPriority = append(highPriority, task)
		}
	}
	return highPriority
}

// FilterTasks returns tasks matching the given criteria
func (tm *TaskManager) FilterTasks(completed *bool, priority *Priority) []*Task {
	var filtered []*Task
	for _, task := range tm.tasks {
		if completed != nil && *completed != task.Completed {
			continue
		}
		if priority != nil && *priority != task.Priority {
			continue
		}
		filtered = append(filtered, task)
	}
	return filtered
}

// SortBy defines sorting criteria
type SortBy int

const (
	SortByTitle SortBy = iota
	SortByPriority
	SortByCreatedAt
)

// SortTasks returns sorted tasks
func (tm *TaskManager) SortTasks(sortBy SortBy, ascending bool) []*Task {
	tasks := make([]*Task, 0, len(tm.tasks))
	for _, task := range tm.tasks {
		tasks = append(tasks, task)
	}

	sort.Slice(tasks, func(i, j int) bool {
		var cmp int
		switch sortBy {
		case SortByTitle:
			if tasks[i].Title < tasks[j].Title {
				cmp = -1
			} else if tasks[i].Title > tasks[j].Title {
				cmp = 1
			}
		case SortByPriority:
			if tasks[i].Priority < tasks[j].Priority {
				cmp = -1
			} else if tasks[i].Priority > tasks[j].Priority {
				cmp = 1
			}
		case SortByCreatedAt:
			if tasks[i].CreatedAt.Before(tasks[j].CreatedAt) {
				cmp = -1
			} else if tasks[i].CreatedAt.After(tasks[j].CreatedAt) {
				cmp = 1
			}
		}

		if ascending {
			return cmp < 0
		}
		return cmp > 0
	})

	return tasks
}

// Stats represents task statistics
type Stats struct {
	Total          int
	Completed      int
	Pending        int
	HighPriority   int
	CompletionRate float64
}

// GetStats returns task statistics
func (tm *TaskManager) GetStats() Stats {
	total := len(tm.tasks)
	completed := 0
	highPriority := 0

	for _, task := range tm.tasks {
		if task.Completed {
			completed++
		}
		if task.Priority == PriorityHigh && !task.Completed {
			highPriority++
		}
	}

	completionRate := 0.0
	if total > 0 {
		completionRate = float64(completed) / float64(total) * 100
	}

	return Stats{
		Total:          total,
		Completed:      completed,
		Pending:        total - completed,
		HighPriority:   highPriority,
		CompletionRate: completionRate,
	}
}

// PrintStats prints task statistics
func (tm *TaskManager) PrintStats() {
	stats := tm.GetStats()
	fmt.Println("\n📊 Task Statistics:")
	fmt.Printf("  Total tasks: %d\n", stats.Total)
	fmt.Printf("  Completed: %d\n", stats.Completed)
	fmt.Printf("  Pending: %d\n", stats.Pending)
	fmt.Printf("  High priority: %d\n", stats.HighPriority)
	fmt.Printf("  Completion rate: %.1f%%\n", stats.CompletionRate)
}

// PrintTasks prints a formatted list of tasks
func printTasks(tasks []*Task, title string) {
	fmt.Printf("\n%s (%d):\n", title, len(tasks))
	if len(tasks) == 0 {
		fmt.Println("  No tasks")
		return
	}
	for _, task := range tasks {
		fmt.Printf("  %s\n", task)
	}
}

// main demonstrates the task manager functionality
func main() {
	manager := NewTaskManager()

	// Add sample tasks
	manager.AddTask(
		"Implement authentication",
		"Add user login and session management to the application",
		PriorityHigh,
	)
	manager.AddTask(
		"Write unit tests",
		"Create comprehensive test suite for the core modules",
		PriorityMedium,
	)
	manager.AddTask(
		"Update documentation",
		"Refresh API documentation and add examples",
		PriorityLow,
	)
	manager.AddTask(
		"Performance optimization",
		"Profile and optimize hot code paths",
		PriorityHigh,
	)

	// Complete some tasks
	manager.CompleteTask(2)

	// Display statistics
	manager.PrintStats()

	// Display pending tasks
	printTasks(manager.PendingTasks(), "⏳ Pending Tasks")

	// Display high priority tasks
	printTasks(manager.HighPriorityTasks(), "🔴 High Priority Tasks")

	// Display tasks sorted by priority (descending)
	printTasks(manager.SortTasks(SortByPriority, false), "📋 Tasks by Priority")

	// Filter tasks by priority
	fmt.Println("\n🔍 Filtering by Medium Priority:")
	priority := PriorityMedium
	mediumTasks := manager.FilterTasks(nil, &priority)
	for _, task := range mediumTasks {
		fmt.Printf("  %s\n", task)
	}
}
