import 'dart:io';

class Task {
  String title;
  bool isCompleted;

  Task(this.title) : isCompleted = false;

  @override
  String toString() {
    return '${isCompleted ? '[x]' : '[ ]'} $title';
  }
}

class TodoList {
  List<Task> tasks = [];

  void addTask(String title) {
    tasks.add(Task(title));
    print('Task added: $title');
  }

  void viewTasks() {
    if (tasks.isEmpty) {
      print('No tasks available.');
    } else {
      print('Tasks:');
      for (var i = 0; i < tasks.length; i++) {
        print('${i + 1}. ${tasks[i]}');
      }
    }
  }

  void deleteTask(int index) {
    if (index < 0 || index >= tasks.length) {
      print('Invalid task number.');
    } else {
      print('Task deleted: ${tasks[index].title}');
      tasks.removeAt(index);
    }
  }

  void updateTask(int index, String newTitle) {
    if (index < 0 || index >= tasks.length) {
      print('Invalid task number.');
    } else {
      tasks[index].title = newTitle;
      print('Task updated to: $newTitle');
    }
  }
}

void main() {
  final todoList = TodoList();
  while (true) {
    print('\nTo-Do List Menu:');
    print('1. View all tasks');
    print('2. Add new task');
    print('3. Delete a task');
    print('4. Update an existing task');
    print('5. Exit');
    stdout.write('Choose an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        todoList.viewTasks();
        break;
      case '2':
        stdout.write('Enter task title: ');
        String? title = stdin.readLineSync();
        if (title != null && title.isNotEmpty) {
          todoList.addTask(title);
        } else {
          print('Task title cannot be empty.');
        }
        break;
      case '3':
        stdout.write('Enter task number to delete: ');
        int? taskNumber = int.tryParse(stdin.readLineSync() ?? '');
        if (taskNumber != null) {
          todoList.deleteTask(taskNumber - 1);
        } else {
          print('Invalid input. Please enter a valid task number.');
        }
        break;
      case '4':
        stdout.write('Enter task number to update: ');
        int? updateTaskNumber = int.tryParse(stdin.readLineSync() ?? '');
        if (updateTaskNumber != null) {
          stdout.write('Enter new task title: ');
          String? newTitle = stdin.readLineSync();
          if (newTitle != null && newTitle.isNotEmpty) {
            todoList.updateTask(updateTaskNumber - 1, newTitle);
          } else {
            print('New task title cannot be empty.');
          }
        } else {
          print('Invalid input. Please enter a valid task number.');
        }
        break;
      case '5':
        print('Exiting the application.');
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}
