import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/favourite/view/favourite_list.dart';
import 'package:provider_tutorial/favourite/view_model/favourite_view_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FavouriteList(),
                ));
              },
              icon: Icon(Icons.favorite))
        ],
      ),
      body: ListView.separated(
          shrinkWrap: true,
          primary: true,
          physics: ScrollPhysics(),
          itemBuilder: (context, index) {
            return Consumer<FavouriteViewModel>(
                builder: (ctx, value, child) => ListTile(
                      title: Text("Item $index"),
                      trailing: IconButton(
                          onPressed: () {
                            if (value.selectedItem.contains(index)) {
                              ctx
                                  .read<FavouriteViewModel>()
                                  .removeFavourite(index);
                            } else {
                              ctx
                                  .read<FavouriteViewModel>()
                                  .addFavourite(index);
                            }
                          },
                          icon: ctx
                                  .watch<FavouriteViewModel>()
                                  .selectedItem
                                  .contains(index)
                              ? Icon(Icons.favorite_outlined)
                              : Icon(Icons.favorite_outline)),
                    ));
          },
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: 10),
    );
  }
}
