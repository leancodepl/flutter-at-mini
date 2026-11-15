import 'package:animations/animations.dart';
import 'package:lecture_week7/widgets/container_colors.dart';
import 'package:material_ui/material_ui.dart';

class const AnimationsPackageDemo({super.key}) extends StatelessWidget {
  static const _items = [
    (icon: Icons.photo_library, label: 'Gallery'),
    (icon: Icons.music_note, label: 'Music'),
    (icon: Icons.video_library, label: 'Videos'),
    (icon: Icons.article, label: 'Articles'),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            for (final (index, item) in _items.indexed)
              _OpenContainerCard(
                colors: colorScheme.containerColorsAt(index),
                icon: item.icon,
                label: item.label,
              ),
          ],
        ),
      ),
    );
  }
}

class const _OpenContainerCard({
  required final ContainerColors colors,
  required final IconData icon,
  required final String label,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 500),
      openBuilder: (context, closeContainer) {
        return _DetailPage(
          colors: colors,
          icon: icon,
          label: label,
          onClose: closeContainer,
        );
      },
      openColor: ColorScheme.of(context).surface,
      closedElevation: 0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      closedColor: colors.container,
      closedBuilder: (context, openContainer) {
        return SizedBox(
          width: 136,
          height: 136,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: colors.onContainer, size: 40),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextTheme.of(context).labelLarge
                    ?.copyWith(color: colors.onContainer),
              ),
            ],
          ),
        );
      },
    );
  }
}

class const _DetailPage({
  required final ContainerColors colors,
  required final IconData icon,
  required final String label,
  required final VoidCallback onClose,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(onPressed: onClose),
        title: Text(label),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: ShapeDecoration(
                color: colors.container,
                shape: MaterialShapeBorder(shape: MaterialShapes.cookie9Sided),
              ),
              child: Icon(icon, color: colors.onContainer, size: 80),
            ),
            const SizedBox(height: 24),
            Text(label, style: textTheme.headlineMedium),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Text(
                'OpenContainer from animations package\n'
                'provides Material container transform',
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge?.copyWith(
                  color: ColorScheme.of(context).onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
