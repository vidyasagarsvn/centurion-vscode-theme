/**
 * Centurion Theme Showcase - Rust
 * Demonstrates syntax highlighting with modern Rust patterns
 */

use std::fmt;
use std::collections::HashMap;

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
enum Priority {
    Low = 1,
    Medium = 2,
    High = 3,
}

impl fmt::Display for Priority {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            Priority::Low => write!(f, "LOW"),
            Priority::Medium => write!(f, "MEDIUM"),
            Priority::High => write!(f, "HIGH"),
        }
    }
}

#[derive(Debug, Clone)]
pub struct Task {
    id: u32,
    title: String,
    description: String,
    priority: Priority,
    completed: bool,
}

impl Task {
    pub fn new(id: u32, title: String, description: String, priority: Priority) -> Self {
        Task {
            id,
            title,
            description,
            priority,
            completed: false,
        }
    }

    pub fn complete(&mut self) {
        self.completed = true;
    }

    pub fn is_completed(&self) -> bool {
        self.completed
    }
}

impl fmt::Display for Task {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let status = if self.completed { "✓" } else { "○" };
        write!(
            f,
            "{} [{}] {}",
            status, self.priority, self.title
        )
    }
}

pub struct TaskManager {
    tasks: HashMap<u32, Task>,
    next_id: u32,
}

impl TaskManager {
    pub fn new() -> Self {
        TaskManager {
            tasks: HashMap::new(),
            next_id: 1,
        }
    }

    pub fn add_task(&mut self, title: String, description: String, priority: Priority) -> u32 {
        let id = self.next_id;
        let task = Task::new(id, title.clone(), description, priority);
        self.tasks.insert(id, task);
        self.next_id += 1;
        println!("✓ Added task: {}", title);
        id
    }

    pub fn complete_task(&mut self, id: u32) -> Result<(), String> {
        match self.tasks.get_mut(&id) {
            Some(task) => {
                task.complete();
                Ok(())
            }
            None => Err(format!("Task {} not found", id)),
        }
    }

    pub fn get_task(&self, id: u32) -> Option<&Task> {
        self.tasks.get(&id)
    }

    pub fn get_pending_tasks(&self) -> Vec<&Task> {
        self.tasks
            .values()
            .filter(|task| !task.is_completed())
            .collect()
    }

    pub fn get_high_priority_tasks(&self) -> Vec<&Task> {
        self.tasks
            .values()
            .filter(|task| task.priority == Priority::High && !task.is_completed())
            .collect()
    }

    pub fn get_stats(&self) -> TaskStats {
        let total = self.tasks.len();
        let completed = self.tasks.values().filter(|t| t.is_completed()).count();
        let pending = total - completed;
        let high_priority = self
            .tasks
            .values()
            .filter(|t| t.priority == Priority::High)
            .count();

        TaskStats {
            total,
            completed,
            pending,
            high_priority,
        }
    }
}

impl Default for TaskManager {
    fn default() -> Self {
        Self::new()
    }
}

#[derive(Debug)]
pub struct TaskStats {
    pub total: usize,
    pub completed: usize,
    pub pending: usize,
    pub high_priority: usize,
}

impl fmt::Display for TaskStats {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(
            f,
            "Total: {}, Completed: {}, Pending: {}, High Priority: {}",
            self.total, self.completed, self.pending, self.high_priority
        )
    }
}

fn main() {
    let mut manager = TaskManager::new();

    // Add sample tasks
    manager.add_task(
        "Setup development environment".to_string(),
        "Install dependencies and configure tools".to_string(),
        Priority::High,
    );

    manager.add_task(
        "Implement core features".to_string(),
        "Build the main functionality".to_string(),
        Priority::High,
    );

    manager.add_task(
        "Write unit tests".to_string(),
        "Achieve 85% code coverage".to_string(),
        Priority::Medium,
    );

    manager.add_task(
        "Documentation".to_string(),
        "Write API documentation and examples".to_string(),
        Priority::Low,
    );

    // Complete some tasks
    let _ = manager.complete_task(1);
    let _ = manager.complete_task(3);

    // Display statistics
    println!("\n{}", "=".repeat(50));
    println!("Task Statistics");
    println!("{}", "=".repeat(50));
    println!("{}", manager.get_stats());

    // Display pending tasks
    println!("\n{}", "=".repeat(50));
    println!("Pending Tasks");
    println!("{}", "=".repeat(50));
    for task in manager.get_pending_tasks().iter() {
        println!("  {}", task);
    }

    // Display high priority tasks
    println!("\n{}", "=".repeat(50));
    println!("High Priority Tasks");
    println!("{}", "=".repeat(50));
    let high_priority = manager.get_high_priority_tasks();
    if high_priority.is_empty() {
        println!("  No high priority tasks");
    } else {
        for task in high_priority.iter() {
            println!("  {}", task);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_create_task() {
        let task = Task::new(1, "Test".to_string(), "Description".to_string(), Priority::High);
        assert_eq!(task.id, 1);
        assert_eq!(task.priority, Priority::High);
        assert!(!task.is_completed());
    }

    #[test]
    fn test_complete_task() {
        let mut task =
            Task::new(1, "Test".to_string(), "Description".to_string(), Priority::Medium);
        task.complete();
        assert!(task.is_completed());
    }

    #[test]
    fn test_task_manager() {
        let mut manager = TaskManager::new();
        manager.add_task("Task 1".to_string(), "Desc 1".to_string(), Priority::High);
        manager.add_task("Task 2".to_string(), "Desc 2".to_string(), Priority::Low);

        let stats = manager.get_stats();
        assert_eq!(stats.total, 2);
        assert_eq!(stats.completed, 0);
        assert_eq!(stats.pending, 2);
    }
}
