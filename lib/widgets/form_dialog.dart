import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/utils/_utils.dart';

class FormDialog<T extends JsonSerializable> extends StatefulWidget {
  const FormDialog({
    Key? key,
    required this.provider,
    required this.fields,
    required this.serializeFunc,
    this.item,
  }) : super(key: key);

  final GenericProvider<T> provider;
  final List<ModelField> fields;
  final Function(Map<String, dynamic>) serializeFunc;
  final T? item;

  @override
  _FormDialogState<T> createState() => _FormDialogState<T>();
}

class _FormDialogState<T extends JsonSerializable>
    extends State<FormDialog<T>> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _formData = {};

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _formData = widget.item!.toJson();
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    final userProvider = Provider.of<AuthProvider>(context, listen: false);

    return AlertDialog(
      title: const Text('Add Item'),
      content: Form(
        key: _formKey,
        child: Container(
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              // Generate form fields dynamically based on the fields list
              children: [
                for (ModelField field in widget.fields)
                  ModelFieldBuilder.buildFormField(context, field, _formData,
                      (key, value) {
                    setState(() {
                      _formData[key] = value;
                    });
                  }),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            // Get fields
            _formKey.currentState!.save();
            T newItem = widget.serializeFunc(_formData);
            bool result = (widget.item == null)
                // Add new item
                ? await widget.provider.addItem(userProvider.token!, newItem)
                // Update existing item
                : await widget.provider
                    .updateItem(userProvider.token!, widget.item!, newItem);
            // Close dialog
            Navigator.of(context).pop();

            // Show info on operation
            Toast.show(
              result ? 'Operation successful' : 'Operation failed',
              duration: 2,
            );
          },
          child: Text(widget.item == null ? 'Add' : 'Update'),
        ),
      ],
    );
  }
}
