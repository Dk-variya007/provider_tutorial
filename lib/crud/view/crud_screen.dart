import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/crud_provider.dart';
import 'add_or_update_screen.dart';

class CrudScreen extends StatelessWidget {
  const CrudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("List of data")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddScreen()));
          },
          child: Icon(Icons.add),
        ),
        body: Consumer<CrudProvider>(builder: (ctx, provider, __) {
          final allData = provider.getData();
          return allData.isEmpty
              ? Center(child: Text("No Data Available"))
              : ListView.separated(
                  itemCount: allData.length,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddScreen(index: index),
                      ));
                    },
                    child: ListTile(
                      title: Text(allData[index]['name']),
                      subtitle: Text(allData[index]['profession']),
                      leading: Text(index.toString()),
                      trailing: IconButton(
                          onPressed: () {
                            provider.deleteData(index);
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16))),
                              content: Text(
                                "Data Delete Successfully",
                              ),
                            ));
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                );
        }));
  }
}
