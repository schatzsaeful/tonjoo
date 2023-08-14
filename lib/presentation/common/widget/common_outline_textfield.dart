import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tonjoo/presentation/common/common_color.dart';

import '../../../app_translation.dart';
import '../../../domain/models/enums/common_form_validate_type.dart';

class CommonOutlineTextField extends StatelessWidget {
  const CommonOutlineTextField({
    Key? key,
    required this.textEditingController,
    required this.label,
    required this.hint,
    this.actionInput = TextInputAction.next,
    this.contentPadding,
    this.minLine = 1,
    this.inputType = TextInputType.text,
    this.digitOnly = false,
    this.addAsterisk = false,
    this.readOnly = false,
    this.prefix,
    this.maxLength,
    this.onChanged,
    this.outlineInputBorder,
    this.errorOutlineInputBorder,
    this.validators = const <CommonFormValidateType>[],
    this.onTap,
    this.icon
  }) : super(key: key);

  final TextEditingController textEditingController;
  final TextInputAction actionInput;
  final EdgeInsetsGeometry? contentPadding;
  final String? label;
  final String hint;
  final String? prefix;
  final TextInputType inputType;
  final bool digitOnly;
  final int? maxLength;
  final int minLine;
  final bool addAsterisk;
  final bool readOnly;
  final Function(String)? onChanged;
  final OutlineInputBorder? outlineInputBorder;
  final OutlineInputBorder? errorOutlineInputBorder;
  final List<CommonFormValidateType> validators;
  final VoidCallback? onTap;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    var newHint = addAsterisk ? '$hint*' : hint;
    var newLabel = addAsterisk && label != null ? '$label*' : label;
    var formatter = digitOnly
        ? [FilteringTextInputFormatter.digitsOnly]
        : <TextInputFormatter>[];

    return TextFormField(
      onChanged: onChanged,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: newHint,
        labelText: newLabel,
        floatingLabelStyle: _floatingLabelStyle(),
        icon: icon,
        iconColor: CommonColor.darkGrey,
        border: outlineInputBorder ?? OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: outlineInputBorder ?? OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: outlineInputBorder ?? OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: outlineInputBorder ?? OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: errorOutlineInputBorder ?? OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(
          vertical: 12,
        ),
        counterText: "",
      ),
      controller: textEditingController,
      textInputAction: actionInput,
      keyboardType: inputType,
      inputFormatters: formatter,
      maxLength: maxLength,
      minLines: minLine,
      maxLines: null,
      validator: _handleValidator,
    );
  }

  _floatingLabelStyle() {
    return MaterialStateTextStyle.resolveWith((states) {
      if (states.contains(MaterialState.error)) {
        return const TextStyle(
          color: Colors.transparent,
        );
      } else if (states.contains(MaterialState.focused)) {
        return const TextStyle(
          color: Colors.transparent,
        );
      } else {
        return const TextStyle(
          color: Colors.transparent,
        );
      }
    });
  }

  String? _handleValidator(String? value) {
    var isRequired = validators.contains(
      CommonFormValidateType.noEmpty,
    );

    if (isRequired && (value == null || value.isEmpty)) {
      return AppTranslation.textErrorEmpty.trParams({
        'fieldName': label ?? hint,
      });
    }

    return null;
  }
}