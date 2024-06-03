import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:troover_admin/utils/_utils.dart';

class DropdownWidget extends StatelessWidget {
  final ModelField field;
  final Map<String, dynamic> formData;
  final Function onChanged;
  final List items;
  final SelectionType selectionType;
  final int maxItems;

  const DropdownWidget({
    Key? key,
    required this.field,
    required this.formData,
    required this.onChanged,
    required this.items,
    required this.selectionType,
    required this.maxItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectDropDown(
      optionTextStyle: const TextStyle(color: Colors.black),
      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
      selectedOptionIcon: const Icon(Icons.check_circle),
      hint: field.label,
      options: items
          .map((item) => ValueItem(label: item.toString(), value: item))
          .toList(),
      // selectedOptions: formData[field.label] != null
      //     ? formData[field.label]
      //         .map((item) => ValueItem(label: item.toString(), value: item))
      //         .toList()
      //     : [],
      onOptionSelected: (options) {
        if (selectionType == SelectionType.single) {
          // Return a single value
          formData[field.label] = options.first.value;
        } else {
          // Return a list of values
          formData[field.label] =
              options.map((option) => option.value).toList();
        }
        onChanged(field.label, formData[field.label]);
      },
// Limit to 1 item if single select
      maxItems: selectionType == SelectionType.single ? 1 : null,
      selectionType: selectionType,
    );
  }
}
