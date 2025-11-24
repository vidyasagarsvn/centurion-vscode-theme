#!/usr/bin/env python3
"""
Centurion Theme Showcase - Python
Demonstrates the theme's syntax highlighting with modern Python code patterns.
"""

from dataclasses import dataclass
from enum import Enum
from abc import ABC, abstractmethod


class Priority(Enum):
    """Task priority levels."""

    LOW = 1
    MEDIUM = 2
    HIGH = 3


@dataclass
class Task:
    """A task with title, description, and priority."""

    title: str
    description: str
    priority: Priority = Priority.MEDIUM
    completed: bool = False

    def __repr__(self) -> str:
        status = "✓" if self.completed else "○"
        return f"{status} [{self.priority.name}] {self.title}"


class TaskManager(ABC):
    """Abstract base class for task management."""

    @abstractmethod
    def add_task(self, task: Task) -> None:
        """Add a new task."""
        pass

    @abstractmethod
    def complete_task(self, task_id: int) -> bool:
        """Mark task as completed."""
        pass


class LocalTaskManager(TaskManager):
    """In-memory task manager implementation."""

    def __init__(self) -> None:
        self.tasks: list[Task] = []
        self.completed: int = 0

    def add_task(self, task: Task) -> None:
        """Add task to the list."""
        self.tasks.append(task)
        print(f"✓ Added: {task.title}")

    def complete_task(self, task_id: int) -> bool:
        """Mark task as completed and update counter."""
        if 0 <= task_id < len(self.tasks):
            self.tasks[task_id].completed = True
            self.completed += 1
            return True
        return False

    def get_summary(self) -> dict[str, int]:
        """Get task statistics."""
        high_priority = sum(1 for t in self.tasks if t.priority == Priority.HIGH)
        return {
            "total": len(self.tasks),
            "completed": self.completed,
            "pending": len(self.tasks) - self.completed,
            "high_priority": high_priority,
        }


def create_sample_tasks() -> list[Task]:
    """Generate sample tasks for demonstration."""
    return [
        Task(
            title="Setup development environment",
            description="Install dependencies and configure tools",
            priority=Priority.HIGH,
        ),
        Task(
            title="Implement core features",
            description="Build the main functionality",
            priority=Priority.HIGH,
        ),
        Task(
            title="Write unit tests",
            description="Achieve 85% code coverage",
            priority=Priority.MEDIUM,
        ),
        Task(
            title="Documentation",
            description="Write API documentation",
            priority=Priority.LOW,
        ),
    ]


def main() -> None:
    """Demonstrate the task manager."""
    manager = LocalTaskManager()

    # Add tasks
    for task in create_sample_tasks():
        manager.add_task(task)

    # Complete some tasks
    manager.complete_task(0)
    manager.complete_task(2)

    # Display results
    print("\n" + "=" * 50)
    print("Task Summary")
    print("=" * 50)

    summary = manager.get_summary()
    for key, value in summary.items():
        print(f"{key.replace('_', ' ').title():.<30} {value}")

    print("\n" + "=" * 50)
    print("All Tasks")
    print("=" * 50)

    for idx, task in enumerate(manager.tasks, 1):
        print(f"{idx}. {task}")


if __name__ == "__main__":
    main()
