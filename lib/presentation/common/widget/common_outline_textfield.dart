import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tonjoo/utils/nullable_extension.dart';
import 'package:tonjoo/utils/value_extension.dart';

import '../../../app_translation.dart';
import '../../../domain/models/enums/common_form_validate_type.dart';
import '../common_color.dart';

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
    this.isEnable,
    this.floatingLabelColor,
    this.onChanged,
    this.outlineInputBorder,
    this.errorOutlineInputBorder,
    this.validators = const <CommonFormValidateType>[],
    this.onTap
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
  final bool? isEnable;
  final Color? floatingLabelColor;
  final Function(String)? onChanged;
  final OutlineInputBorder? outlineInputBorder;
  final OutlineInputBorder? errorOutlineInputBorder;
  final List<CommonFormValidateType> validators;
  final VoidCallback? onTap;

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
        border: outlineInputBorder ?? OutlineInputBorder(
          borderSide: const BorderSide(color: CommonColor.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: outlineInputBorder ?? OutlineInputBorder(
          borderSide: const BorderSide(color: CommonColor.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: outlineInputBorder ?? OutlineInputBorder(
          borderSide: const BorderSide(color: CommonColor.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: outlineInputBorder ?? OutlineInputBorder(
          borderSide: const BorderSide(color: CommonColor.orange),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: errorOutlineInputBorder ?? OutlineInputBorder(
          borderSide: const BorderSide(color: CommonColor.red),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        prefix: prefix != null
            ? Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      prefix.orEmpty(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: CommonColor.orange,
                      ),
                    ),
                    Container(
                      height: 24,
                      width: 1,
                      margin: const EdgeInsets.only(left: 4),
                      color: CommonColor.aqua,
                    )
                  ],
                ),
              )
            : null,
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
      enabled: isEnable ?? true,
    );
  }

  _floatingLabelStyle() {
    return MaterialStateTextStyle.resolveWith((states) {
      if (states.contains(MaterialState.error)) {
        return const TextStyle(
          color: CommonColor.red,
        );
      } else if (states.contains(MaterialState.focused)) {
        return TextStyle(
          color: floatingLabelColor ?? CommonColor.orange,
        );
      } else {
        return TextStyle(
          color: floatingLabelColor ?? CommonColor.orange,
        );
      }
    });
  }

  String? _handleValidator(String? value) {
    var isRequired = validators.contains(
      CommonFormValidateType.noEmpty,
    );
    var validateEmail = validators.contains(
      CommonFormValidateType.email,
    );
    var validateNik = validators.contains(
      CommonFormValidateType.min16character,
    );
    var validateYear = validators.contains(
      CommonFormValidateType.min4Character,
    );
    var validateAlphabetOnly = validators.contains(
      CommonFormValidateType.alphabetOnly,
    );

    if (isRequired && (value == null || value.isEmpty)) {
      return AppTranslation.textErrorEmpty.trParams({
        'fieldName': label ?? hint,
      });
    }

    return null;
  }
}
