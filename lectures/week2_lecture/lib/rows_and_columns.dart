import 'package:flutter/material.dart';
import 'package:week2_lecture/containers.dart';

class RowsAndColumns extends StatelessWidget {
  const RowsAndColumns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Containers(),
        Containers(),
      ],
    );
  }
}
