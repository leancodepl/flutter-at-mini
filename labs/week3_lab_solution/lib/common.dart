import 'package:flutter/widgets.dart';

extension CommonWidgetExt on Widget {
  Widget get columnPadded => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: this,
      );

  Widget get sliverColumnPadded => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        sliver: this,
      );

  Widget get sliver => SliverToBoxAdapter(child: this);
}
