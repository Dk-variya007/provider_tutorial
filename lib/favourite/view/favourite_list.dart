import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/favourite_view_model.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favourite Items")),
      body: Consumer<FavouriteViewModel>(
        builder: (ctx, value, child) {
          final selectedItems = value.selectedItem;
          return ListView.separated(
            itemCount: selectedItems.length,
            itemBuilder: (context, index) {
              final item = selectedItems[index];
              return ListTile(
                title: Text("Item $item"),
                trailing: IconButton(
                  onPressed: () {
                    ctx.read<FavouriteViewModel>().removeFavourite(item);
                  },
                  icon: Icon(Icons.favorite_outline),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
          );
        },
      ),
    );
  }
}
