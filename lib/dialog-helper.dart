import 'package:change4charity/exit_dialog.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static exit(context) =>
      showDialog(context: context, builder: (context) => ExitDialog());
}
