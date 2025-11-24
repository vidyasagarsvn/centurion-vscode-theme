/**
 * Centurion Theme Showcase - JavaScript
 * Demonstrates syntax highlighting with modern JavaScript patterns
 */

/**
 * Priority enumeration for tasks
 */
const Priority = Object.freeze({
  LOW: { value: 1, name: "LOW" },
  MEDIUM: { value: 2, name: "MEDIUM" },
  HIGH: { value: 3, name: "HIGH" },
});

/**
 * Task class representing a single task
 */
class Task {
  /**
   * Create a new task
   * @param {number} id - Unique task identifier
   * @param {string} title - Task title
   * @param {string} description - Task description
   * @param {Object} priority - Priority level
   */
  constructor(id, title, description, priority = Priority.MEDIUM) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.priority = priority;
    this.completed = false;
    this.createdAt = new Date();
  }

  /**
   * Mark task as completed
   */
  complete() {
    this.completed = true;
  }

  /**
   * Check if task is completed
   * @returns {boolean}
   */
  isCompleted() {
    return this.completed;
  }

  /**
   * String representation of task
   * @returns {string}
   */
  toString() {
    const status = this.completed ? "✓" : "○";
    return `${status} [${this.priority.name}] ${this.title}`;
  }
}

/**
 * TaskManager class for managing multiple tasks
 */
class TaskManager {
  constructor() {
    this.tasks = new Map();
    this.nextId = 1;
  }

  /**
   * Add a new task to the manager
   * @param {string} title
   * @param {string} description
   * @param {Object} priority
   * @returns {number} Task ID
   */
  addTask(title, description, priority = Priority.MEDIUM) {
    const id = this.nextId++;
    const task = new Task(id, title, description, priority);
    this.tasks.set(id, task);
    console.log(`✓ Added task: ${title}`);
    return id;
  }

  /**
   * Complete a task by ID
   * @param {number} id
   * @returns {boolean}
   */
  completeTask(id) {
    const task = this.tasks.get(id);
    if (task) {
      task.complete();
      return true;
    }
    return false;
  }

  /**
   * Get task by ID
   * @param {number} id
   * @returns {Task|undefined}
   */
  getTask(id) {
    return this.tasks.get(id);
  }

  /**
   * Get all pending tasks
   * @returns {Task[]}
   */
  getPendingTasks() {
    return Array.from(this.tasks.values()).filter((task) => !task.isCompleted());
  }

  /**
   * Get high priority tasks
   * @returns {Task[]}
   */
  getHighPriorityTasks() {
    return Array.from(this.tasks.values()).filter(
      (task) => task.priority === Priority.HIGH && !task.isCompleted()
    );
  }

  /**
   * Get task statistics
   * @returns {Object}
   */
  getStats() {
    const total = this.tasks.size;
    const completed = Array.from(this.tasks.values()).filter((t) =>
      t.isCompleted()
    ).length;
    const pending = total - completed;
    const highPriority = Array.from(this.tasks.values()).filter(
      (t) => t.priority === Priority.HIGH
    ).length;

    return {
      total,
      completed,
      pending,
      highPriority,
      completionRate: total > 0 ? ((completed / total) * 100).toFixed(1) : 0,
    };
  }

  /**
   * Filter tasks by criteria
   * @param {Object} criteria - Filter criteria
   * @returns {Task[]}
   */
  filterTasks(criteria = {}) {
    let filtered = Array.from(this.tasks.values());

    if (criteria.completed !== undefined) {
      filtered = filtered.filter(
        (task) => task.isCompleted() === criteria.completed
      );
    }

    if (criteria.priority) {
      filtered = filtered.filter((task) => task.priority === criteria.priority);
    }

    return filtered;
  }

  /**
   * Sort tasks by criteria
   * @param {string} sortBy - Sort key (title, priority, createdAt)
   * @param {boolean} ascending
   * @returns {Task[]}
   */
  sortTasks(sortBy = "priority", ascending = false) {
    const tasks = Array.from(this.tasks.values());

    return tasks.sort((a, b) => {
      let compareA, compareB;

      switch (sortBy) {
        case "title":
          compareA = a.title.toLowerCase();
          compareB = b.title.toLowerCase();
          break;
        case "priority":
          compareA = a.priority.value;
          compareB = b.priority.value;
          break;
        case "createdAt":
          compareA = a.createdAt;
          compareB = b.createdAt;
          break;
        default:
          return 0;
      }

      if (compareA < compareB) return ascending ? -1 : 1;
      if (compareA > compareB) return ascending ? 1 : -1;
      return 0;
    });
  }
}

/**
 * Demo: Create and manage tasks
 */
function main() {
  const manager = new TaskManager();

  // Add sample tasks
  manager.addTask(
    "Setup development environment",
    "Install dependencies and configure tools",
    Priority.HIGH
  );

  manager.addTask(
    "Implement core features",
    "Build the main functionality",
    Priority.HIGH
  );

  manager.addTask(
    "Write unit tests",
    "Achieve 85% code coverage",
    Priority.MEDIUM
  );

  manager.addTask("Documentation", "Write API documentation", Priority.LOW);

  // Complete some tasks
  manager.completeTask(1);
  manager.completeTask(3);

  // Display statistics
  console.log("\n" + "=".repeat(50));
  console.log("Task Statistics");
  console.log("=".repeat(50));

  const stats = manager.getStats();
  Object.entries(stats).forEach(([key, value]) => {
    const label = key.replace(/([A-Z])/g, " $1").trim();
    console.log(
      `${label.charAt(0).toUpperCase() + label.slice(1)}:`.padEnd(20),
      value
    );
  });

  // Display pending tasks
  console.log("\n" + "=".repeat(50));
  console.log("Pending Tasks");
  console.log("=".repeat(50));

  manager.getPendingTasks().forEach((task) => {
    console.log(`  ${task}`);
  });

  // Display high priority tasks
  console.log("\n" + "=".repeat(50));
  console.log("High Priority Tasks");
  console.log("=".repeat(50));

  const highPriority = manager.getHighPriorityTasks();
  if (highPriority.length === 0) {
    console.log("  No high priority tasks");
  } else {
    highPriority.forEach((task) => {
      console.log(`  ${task}`);
    });
  }

  // Display sorted tasks
  console.log("\n" + "=".repeat(50));
  console.log("All Tasks (sorted by priority)");
  console.log("=".repeat(50));

  manager.sortTasks("priority", false).forEach((task) => {
    console.log(`  ${task}`);
  });
}

// Run demo
main();
