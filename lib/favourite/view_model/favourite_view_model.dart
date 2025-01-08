import 'package:flutter/cupertino.dart';
import 'package:provider_tutorial/apicalling/utils/log_utils.dart';

class FavouriteViewModel extends ChangeNotifier {
  final List selectedItem = [];

  List getList(int index) => selectedItem[index];

  addFavourite(int index) {
    selectedItem.add(index);
    LogUtil.debug(selectedItem);
    notifyListeners();
  }

  removeFavourite(int index) {
    selectedItem.remove(index);
    LogUtil.debug(selectedItem);
    notifyListeners();
  }
}
