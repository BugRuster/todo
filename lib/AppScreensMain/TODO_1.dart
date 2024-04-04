import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import '../DatabaseFiles/DataBase.dart';

class TODO_1 extends StatefulWidget {
  @override
  State<TODO_1> createState() => _TODO_1State();
}

class _TODO_1State extends State<TODO_1> {
  String selectedCategory = 'Personal'; // default category
  TextEditingController taskController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  DatabaseService databaseService = DatabaseService();

  @override
  void initState() {
    super.initState();
  }
  void _onCheckboxChanged(String taskId, bool newValue) async {
    // Update the task's completion status
    await databaseService.updateTask(taskId, {'completed': newValue});

    if (newValue) {
      // Wait for 5 seconds before deleting the task
      Future.delayed(Duration(seconds: 5), () async {
        await databaseService.deleteTask(taskId);
        // Optionally, trigger a UI update if necessary
      });
    }
  }

  StreamBuilder<dynamic> _categoryList() {
    return StreamBuilder(
      stream: databaseService.categories,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        var categories = snapshot.data.docs;
        return Container(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = categories[index]['name'];
                  });
                },
                onLongPress: () {
                  _deleteCategoryDialog(categories[index]['name']);
                },
                child: Chip(
                  label: Text(categories[index]['name']),
                  backgroundColor: selectedCategory == categories[index]['name']
                      ? Colors.blue
                      : Colors.grey,
                ),
              );
            },
          ),
        );
      },
    );
  }

  StreamBuilder<dynamic> _taskList() {
    return StreamBuilder(
      stream: databaseService.getTasks(selectedCategory),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        var tasks = snapshot.data.docs;
        return Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              var task = tasks[index];
              return ListTile(
                title: Text(task['task']),
                trailing: Checkbox(
                  value: task['completed'],
                  onChanged: (bool? value) {
                    _onCheckboxChanged(task.id, value ?? false);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _addTaskDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Task'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: 'Enter your task'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                String taskId = randomAlphaNumeric(10);
                databaseService.addTask({
                  'task': taskController.text,
                  'completed': false,
                  'category': selectedCategory,
                  'Id': taskId,
                });
                taskController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _addCategoryDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Category'),
          content: TextField(
            controller: categoryController,
            decoration: InputDecoration(hintText: 'Enter category name'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                databaseService.addCategory(categoryController.text);
                categoryController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteCategoryDialog(String categoryName) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Category'),
          content: Text('Are you sure you want to delete "$categoryName"?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                databaseService.deleteCategory(categoryName);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addCategoryDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          _categoryList(),
          _taskList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTaskDialog,
      ),
    );
  }
}
