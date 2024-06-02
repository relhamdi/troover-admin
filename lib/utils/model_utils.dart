import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/utils/_utils.dart';
import 'package:troover_admin/widgets/_widgets.dart';

class ModelField<T> {
  final String label;
  final Type fieldType;
  final T? defaultValue;
  final List<T>? items;
  final GenericProvider? provider;
  final bool pickMany;

  ModelField({
    required this.label,
    required this.fieldType,
    this.defaultValue,
    this.items,
    this.provider,
    this.pickMany = false,
  });
}

class ModelFieldBuilder {
  static Widget buildFormField(
    BuildContext context,
    ModelField field,
    Map<String, dynamic> formData,
    void Function(String, dynamic) onChanged,
  ) {
    if (field.items != null || field.provider != null) {
      return DropdownWidget(
        field: field,
        formData: formData,
        onChanged: onChanged,
        items: field.items ?? field.provider!.items,
        selectionType:
            field.pickMany ? SelectionType.multi : SelectionType.single,
        maxItems: field.pickMany
            ? field.items?.length ?? field.provider!.items.length
            : 1,
      );
    }

    switch (field.fieldType) {
      case String:
        return TextFormField(
          initialValue: formData[field.label] ?? field.defaultValue,
          decoration: InputDecoration(labelText: field.label),
          onSaved: (value) {
            onChanged(field.label, value!);
          },
        );

      case int:
        return TextFormField(
          initialValue: formData[field.label]?.toString() ??
              field.defaultValue?.toString(),
          decoration: InputDecoration(labelText: field.label),
          keyboardType: TextInputType.number,
          onSaved: (value) {
            int? parsedValue;
            try {
              parsedValue = int.parse(value!);
            } catch (e) {
              parsedValue = null;
            }
            onChanged(field.label, parsedValue);
          },
        );

      case double:
        return TextFormField(
          initialValue: formData[field.label]?.toString() ??
              field.defaultValue?.toString(),
          decoration: InputDecoration(labelText: field.label),
          keyboardType: TextInputType.number,
          onSaved: (value) {
            double? parsedValue;
            try {
              parsedValue = double.parse(value!);
            } catch (e) {
              parsedValue = null;
            }
            onChanged(field.label, parsedValue);
          },
        );

      case bool:
        return SwitchListTile(
          title: Text(field.label),
          value: formData[field.label] ?? field.defaultValue ?? false,
          onChanged: (value) {
            onChanged(field.label, value);
          },
        );

      case DateTime:
        return TextFormField(
          decoration: InputDecoration(labelText: field.label),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: formData[field.label] != null
                  ? DateTime.parse(formData[field.label])
                  : DateTime.now(),
              firstDate: DateTime(DateTime.now().year),
              lastDate: DateTime(DateTime.now().year + Constants.yearRange),
            );
            if (date != null) {
              onChanged(field.label, date.toIso8601String());
            }
          },
        );

      // Fallback
      default:
        throw Exception('Unsupported field type: ${field.fieldType}');
    }
  }
}
