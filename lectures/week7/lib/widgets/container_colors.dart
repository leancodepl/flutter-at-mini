import 'package:material_ui/material_ui.dart';

class const ContainerColors(final Color container, final Color onContainer);

extension ContainerColorsX on ColorScheme {
  List<ContainerColors> get containerColors => [
    .new(primaryContainer, onPrimaryContainer),
    .new(secondaryContainer, onSecondaryContainer),
    .new(tertiaryContainer, onTertiaryContainer),
  ];

  ContainerColors containerColorsAt(int index) =>
      containerColors[index % containerColors.length];
}
