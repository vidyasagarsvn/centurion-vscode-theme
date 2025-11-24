/**
 * Centurion Theme Showcase - React (TypeScript/TSX)
 * Demonstrates syntax highlighting with modern React patterns
 */

import React, { useState, useCallback, useMemo } from "react";

interface Task {
  id: number;
  title: string;
  priority: "low" | "medium" | "high";
  completed: boolean;
}

interface TaskListProps {
  initialTasks?: Task[];
  onTasksChange?: (tasks: Task[]) => void;
}

const PriorityBadge: React.FC<{ priority: Task["priority"] }> = ({ priority }) => {
  const colors = {
    low: "#acda8a",
    medium: "#ffae00",
    high: "#FF5370",
  };

  return (
    <span
      style={{
        backgroundColor: colors[priority],
        color: "#1a2225",
        padding: "4px 8px",
        borderRadius: "4px",
        fontSize: "12px",
        fontWeight: "bold",
      }}
    >
      {priority.toUpperCase()}
    </span>
  );
};

const TaskItem: React.FC<{
  task: Task;
  onToggle: (id: number) => void;
  onDelete: (id: number) => void;
}> = ({ task, onToggle, onDelete }) => (
  <div
    style={{
      display: "flex",
      alignItems: "center",
      gap: "12px",
      padding: "12px",
      backgroundColor: task.completed ? "#2a3a3d" : "#1f3036",
      borderLeft: `4px solid #${task.priority === "high" ? "D946EF" : "7dc2fc"}`,
      marginBottom: "8px",
      borderRadius: "4px",
      textDecoration: task.completed ? "line-through" : "none",
      opacity: task.completed ? 0.7 : 1,
    }}
  >
    <input
      type="checkbox"
      checked={task.completed}
      onChange={() => onToggle(task.id)}
      style={{ cursor: "pointer" }}
    />
    <div style={{ flex: 1 }}>
      <div style={{ color: "#EEFFFF", fontWeight: 500 }}>{task.title}</div>
    </div>
    <PriorityBadge priority={task.priority} />
    <button
      onClick={() => onDelete(task.id)}
      style={{
        backgroundColor: "transparent",
        color: "#FF5370",
        border: "none",
        cursor: "pointer",
        fontSize: "18px",
      }}
    >
      ✕
    </button>
  </div>
);

export const TaskList: React.FC<TaskListProps> = ({
  initialTasks = [],
  onTasksChange,
}) => {
  const [tasks, setTasks] = useState<Task[]>(initialTasks);
  const [filter, setFilter] = useState<"all" | "pending" | "completed">("all");

  const handleToggleTask = useCallback(
    (id: number) => {
      setTasks((prev) => {
        const updated = prev.map((task) =>
          task.id === id ? { ...task, completed: !task.completed } : task
        );
        onTasksChange?.(updated);
        return updated;
      });
    },
    [onTasksChange]
  );

  const handleDeleteTask = useCallback(
    (id: number) => {
      setTasks((prev) => {
        const updated = prev.filter((task) => task.id !== id);
        onTasksChange?.(updated);
        return updated;
      });
    },
    [onTasksChange]
  );

  const filteredTasks = useMemo(() => {
    return tasks.filter((task) => {
      if (filter === "pending") return !task.completed;
      if (filter === "completed") return task.completed;
      return true;
    });
  }, [tasks, filter]);

  const stats = useMemo(() => {
    const completed = tasks.filter((t) => t.completed).length;
    return {
      total: tasks.length,
      completed,
      pending: tasks.length - completed,
    };
  }, [tasks]);

  return (
    <div style={{ maxWidth: "600px", margin: "0 auto", padding: "20px" }}>
      <h1 style={{ color: "#D946EF", marginBottom: "20px" }}>📋 Task Manager</h1>

      {/* Statistics */}
      <div
        style={{
          display: "grid",
          gridTemplateColumns: "repeat(3, 1fr)",
          gap: "12px",
          marginBottom: "20px",
        }}
      >
        {[
          { label: "Total", value: stats.total, color: "#7dc2fc" },
          { label: "Completed", value: stats.completed, color: "#acda8a" },
          { label: "Pending", value: stats.pending, color: "#ffae00" },
        ].map((stat) => (
          <div
            key={stat.label}
            style={{
              backgroundColor: "#1f3036",
              padding: "16px",
              borderRadius: "8px",
              textAlign: "center",
            }}
          >
            <div style={{ color: stat.color, fontSize: "24px", fontWeight: "bold" }}>
              {stat.value}
            </div>
            <div style={{ color: "#8ccdfc", fontSize: "12px", marginTop: "4px" }}>
              {stat.label}
            </div>
          </div>
        ))}
      </div>

      {/* Filter Buttons */}
      <div style={{ display: "flex", gap: "8px", marginBottom: "16px" }}>
        {(["all", "pending", "completed"] as const).map((f) => (
          <button
            key={f}
            onClick={() => setFilter(f)}
            style={{
              backgroundColor: filter === f ? "#D946EF" : "#2a3a3d",
              color: filter === f ? "#1a2225" : "#EEFFFF",
              border: "none",
              padding: "8px 16px",
              borderRadius: "4px",
              cursor: "pointer",
              fontWeight: filter === f ? "bold" : "normal",
            }}
          >
            {f.charAt(0).toUpperCase() + f.slice(1)}
          </button>
        ))}
      </div>

      {/* Task List */}
      <div>
        {filteredTasks.length > 0 ? (
          filteredTasks.map((task) => (
            <TaskItem
              key={task.id}
              task={task}
              onToggle={handleToggleTask}
              onDelete={handleDeleteTask}
            />
          ))
        ) : (
          <div style={{ color: "#8ccdfc", textAlign: "center", padding: "20px" }}>
            No tasks found
          </div>
        )}
      </div>
    </div>
  );
};

export default TaskList;
