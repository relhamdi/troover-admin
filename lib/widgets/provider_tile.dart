import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';

class ProviderTile extends StatelessWidget {
  const ProviderTile({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final GenericProvider provider;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context);
    if (userProvider.token != null) {
      provider.fetchItems(userProvider.token!);
    }

    List<DataColumn> columns = [];
    List<DataRow> rows = [];

    for (JsonSerializable item in provider.items) {
      List<DataCell> cells = [];
      item.toJson().forEach((key, value) {
        if (provider.items.indexOf(item) == 0) {
          columns.add(DataColumn(label: Text(key)));
        }
        cells.add(DataCell(Text(value.toString())));
      });

      // Adding action buttons for update and delete
      cells.add(DataCell(Row(
        children: [
          // Button - Update item
          if (provider.canUpdate())
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                // Open update dialog
                showDialog(
                  context: context,
                  builder: (context) => provider.createFormDialog(item: item),
                );
              },
            ),

          // Button - Delete item
          if (provider.canDelete())
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () async {
                await provider.deleteItem(userProvider.token!, item);
              },
            ),
        ],
      )));
      rows.add(DataRow(cells: cells));
    }

    // Add an action column for buttons
    if (columns.isNotEmpty) {
      columns.add(const DataColumn(label: Text('Actions')));
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        leading: const Icon(Icons.data_array),
        title: Text(provider.runtimeType.toString()),
        children: [
          // Button - Add item
          if (provider.canAdd())
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Open add dialog
                  showDialog(
                    context: context,
                    builder: (context) => provider.createFormDialog(),
                  );
                },
                child: const Text('Add Item'),
              ),
            ),

          // Table - items
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: columns.isNotEmpty
                ? DataTable(columns: columns, rows: rows)
                : const Center(child: Text('No data available')),
          )
        ],
      ),
    );
  }
}
