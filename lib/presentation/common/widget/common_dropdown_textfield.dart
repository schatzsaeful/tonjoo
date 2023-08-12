import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/type_defs.dart';
import '../common_color.dart';

class CommonDropdownTextField extends StatelessWidget {
  const CommonDropdownTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.dropdownItems,
    required this.selectedListener,
    this.lastSelected,
    this.dropdownWidth = -1,
    this.errorText,
    this.addAsterisk = false,
  }) : super(key: key);

  final String label;
  final String hint;
  final List<String> dropdownItems;
  final DropdownTextFieldListener selectedListener;
  final int? lastSelected;
  final double dropdownWidth;
  final String? errorText;
  final bool addAsterisk;

  @override
  Widget build(BuildContext context) {
    var newHint = addAsterisk ? '$hint*' : hint;
    var newLabel = addAsterisk ? '$label*' : label;

    var value = lastSelected == -1 ? null : lastSelected;
    var width = dropdownWidth == -1 ? Get.width - 32 : dropdownWidth;

    return DropdownButtonFormField2(
      value: value,
      isExpanded: true,
      decoration: InputDecoration(
        isDense: true,
        hintText: newHint,
        labelText: newLabel,
        errorText: errorText,
        floatingLabelStyle: _floatingLabelStyle(),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CommonColor.red),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CommonColor.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: CommonColor.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CommonColor.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.only(left: 16, right: 8),
      ),
      buttonPadding: EdgeInsets.zero,
      buttonHeight: 48,
      items: List.generate(
        dropdownItems.length,
        (index) {
          return DropdownMenuItem(
            value: index,
            child: Text(dropdownItems[index]),
          );
        },
      ),
      onChanged: selectedListener,
      icon: const Icon(Icons.keyboard_arrow_down),
      dropdownDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      dropdownWidth: width,
      selectedItemHighlightColor: CommonColor.softGrey,
      itemPadding: const EdgeInsets.only(left: 12),
      offset: const Offset(-16, 0),
      dropdownMaxHeight: 320,
    );
  }

  _floatingLabelStyle() {
    return MaterialStateTextStyle.resolveWith((states) {
      if (states.contains(MaterialState.focused)) {
        return const TextStyle(
          color: CommonColor.blue,
        );
      } else {
        return const TextStyle(
          color: CommonColor.darkBlue,
        );
      }
    });
  }
}
