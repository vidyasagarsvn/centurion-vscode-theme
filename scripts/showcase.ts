/**
 * Centurion Theme Showcase - TypeScript
 * Demonstrates syntax highlighting with modern TypeScript patterns
 */

interface Task {
  id: number;
  title: string;
  description: string;
  priority: "low" | "medium" | "high";
  completed: boolean;
}

interface TaskFilter {
  priority?: "low" | "medium" | "high";
  completed?: boolean;
}

class TaskManager {
  private tasks: Map<number, Task> = new Map();
  private nextId: number = 1;

  /**
   * Add a new task to the manager
   */
  addTask(
    title: string,
    description: string,
    priority: "low" | "medium" | "high" = "medium"
  ): Task {
    const task: Task = {
      id: this.nextId++,
      title,
      description,
      priority,
      completed: false,
    };

    this.tasks.set(task.id, task);
    console.log(`✓ Added task: ${title}`);
    return task;
  }

  /**
   * Get all tasks or filter by criteria
   */
  getTasks(filter?: TaskFilter): Task[] {
    const allTasks = Array.from(this.tasks.values());

    return allTasks.filter((task) => {
      if (filter?.priority && task.priority !== filter.priority) {
        return false;
      }
      if (filter?.completed !== undefined) {
        return task.completed === filter.completed;
      }
      return true;
    });
  }

  /**
   * Complete a task by ID
   */
  completeTask(id: number): boolean {
    const task = this.tasks.get(id);
    if (task) {
      task.completed = true;
      return true;
    }
    return false;
  }

  /**
   * Get statistics about tasks
   */
  getStats() {
    const tasks = Array.from(this.tasks.values());
    const completed = tasks.filter((t) => t.completed).length;
    const highPriority = tasks.filter((t) => t.priority === "high").length;

    return {
      total: tasks.length,
      completed,
      pending: tasks.length - completed,
      highPriority,
      completionRate: tasks.length > 0 ? (completed / tasks.length) * 100 : 0,
    };
  }
}

// Usage Example
function main(): void {
  const manager = new TaskManager();

  // Add tasks
  manager.addTask("Setup development environment", "Install all dependencies", "high");
  manager.addTask("Implement core features", "Build main functionality", "high");
  manager.addTask("Write unit tests", "Target 85% coverage", "medium");
  manager.addTask("Documentation", "API docs and examples", "low");

  // Complete some tasks
  manager.completeTask(1);
  manager.completeTask(3);

  // Display statistics
  const stats = manager.getStats();
  console.log("\n=== Task Statistics ===");
  console.log(`Total tasks: ${stats.total}`);
  console.log(`Completed: ${stats.completed}`);
  console.log(`Pending: ${stats.pending}`);
  console.log(`High Priority: ${stats.highPriority}`);
  console.log(`Completion: ${stats.completionRate.toFixed(1)}%`);

  // Display pending tasks
  console.log("\n=== Pending Tasks ===");
  const pending = manager.getTasks({ completed: false });
  pending.forEach((task) => {
    console.log(`  • [${task.priority.toUpperCase()}] ${task.title}`);
  });
}

main();
