import 'package:flutter/material.dart';
import 'package:state_managment/todo_app/data/tasks_data.dart';
import 'package:state_managment/todo_app/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  Function fun;
  Task task;
  TaskWidget(this.task, this.fun);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: task.isCompleted ? Colors.green : Colors.black45,
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              task.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  fun(task);
                  tasksList.removeWhere((item) => item.title == task.title);
                },
                icon: Icon(Icons.delete)),
            Checkbox(
              value: task.isCompleted,
              onChanged: (v) {
                fun(task);
              },
            ),
          ],
        ));
  }
}
