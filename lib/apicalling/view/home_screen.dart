import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/apicalling/view_model/user_view_model.dart';
import '../utils/routes/route_name.dart';
import '../view_model/auth_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          TextButton(
            onPressed: () {
              context.read<UserViewModel>().remove().then((value) {
                Navigator.pushNamed(context, RouteName.login);
              });
            },
            child: Text("LogOut"),
          ),
        ],
      ),
      body: Consumer<AuthViewModel>(
        builder: (context, authViewModel, child) {
          if (authViewModel.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (authViewModel.getTodoList.isEmpty) {
            return Center(child: Text("No Todo available"));
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              final todo = authViewModel.getTodoList[index];
              return ListTile(
                title: Text(todo.title.toString()),
                leading: CircleAvatar(child: Text(todo.id.toString())),
                trailing: todo.completed!
                    ? Text(
                  "Completed",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                )
                    : Text(
                  "Pending",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: authViewModel.getTodoList.length,
          );
        },
      ),
    );
  }
}


