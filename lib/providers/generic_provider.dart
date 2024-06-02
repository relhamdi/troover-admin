import 'package:flutter/material.dart';
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/utils/_utils.dart';
import 'package:troover_admin/widgets/_widgets.dart';

class GenericProvider<T extends JsonSerializable> with ChangeNotifier {
  List<T> _items = [];
  List<T> get items => _items;
  bool fetched = false;

  final T Function(Map<String, dynamic>) fromJson;
  final List<ModelField> modelFields;
  final Future<List<T>> Function(String token)? fetchItemsFunc;
  final Future<T> Function(String token, T item)? addItemFunc;
  final Future<T> Function(String token, T item)? updateItemFunc;
  final Future<bool> Function(String token, T item)? deleteItemFunc;

  GenericProvider({
    required this.fromJson,
    required this.modelFields,
    this.fetchItemsFunc,
    this.addItemFunc,
    this.updateItemFunc,
    this.deleteItemFunc,
  });

  bool canAdd() => addItemFunc != null;
  bool canUpdate() => updateItemFunc != null;
  bool canDelete() => deleteItemFunc != null;

  void reset() {
    _items = [];
    fetched = false;
  }

  Future<void> fetchItems(String token) async {
    if (fetchItemsFunc != null) {
      if (!fetched) {
        _items = await fetchItemsFunc!(token);
        notifyListeners();
        fetched = true;
      }
    }
  }

  Future<bool> addItem(String token, T item) async {
    if (addItemFunc != null) {
      item = await addItemFunc!(token, item);
      _items.add(item);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> updateItem(String token, T oldItem, T newItem) async {
    if (updateItemFunc != null) {
      _items.remove(oldItem);
      newItem = await updateItemFunc!(token, newItem);
      _items.add(newItem);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> deleteItem(String token, T item) async {
    if (deleteItemFunc != null) {
      bool result = await deleteItemFunc!(token, item);
      _items.remove(item);
      notifyListeners();
      return result;
    }
    return false;
  }

  FormDialog<T> createFormDialog({T? item}) {
    return FormDialog<T>(
      provider: this,
      fields: modelFields,
      serializeFunc: fromJson,
      item: item,
    );
  }
}
