import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/apicalling/view_model/user_view_model.dart';

import '../utils/routes/route_name.dart';
import '../view_model/auth_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    if (authViewModel.getList.isEmpty && !authViewModel.loading) {
      authViewModel.getPostData(context);
    }

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
              child: Text("LogOut"))
        ],
      ),
      body: Consumer<AuthViewModel>(
        builder: (context, authViewModel, child) {
          if (authViewModel.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (authViewModel.getList.isEmpty) {
            return Center(child: Text("No posts available"));
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              final post = authViewModel.getList[index];
              return ListTile(
                title: Text(post.title.toString()),
                subtitle: Text(post.body.toString()),
                leading: Text(post.id.toString()),
                trailing: Text(post.userId.toString()),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: authViewModel.getList.length,
          );
        },
      ),
    );
  }
}
