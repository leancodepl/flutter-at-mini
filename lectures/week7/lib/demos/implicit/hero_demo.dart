import 'package:lecture_week7/widgets/container_colors.dart';
import 'package:material_ui/material_ui.dart';

class const HeroDemo({super.key}) extends StatelessWidget {
  static final _items = [
    (icon: Icons.rocket_launch, shape: MaterialShapes.arch, tag: 'rocket'),
    (icon: Icons.eco, shape: MaterialShapes.clover4Leaf, tag: 'eco'),
    (icon: Icons.water_drop, shape: MaterialShapes.cookie6Sided, tag: 'water'),
    (icon: Icons.star, shape: MaterialShapes.softBurst, tag: 'star'),
    (icon: Icons.sunny, shape: MaterialShapes.sunny, tag: 'sun'),
    (icon: Icons.favorite, shape: MaterialShapes.pixelCircle, tag: 'heart'),
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
              _HeroCard(
                colors: colorScheme.containerColorsAt(index),
                icon: item.icon,
                shape: item.shape,
                tag: item.tag,
              ),
          ],
        ),
      ),
    );
  }
}

class const _HeroCard({
  required final ContainerColors colors,
  required final IconData icon,
  required final RoundedPolygon shape,
  required final String tag,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(
        color: colors.container,
        shape: MaterialShapeBorder(shape: shape),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder<void>(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return _HeroDetailPage(
                    colors: colors,
                    icon: icon,
                    shape: shape,
                    tag: tag,
                  );
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
              ),
            );
          },
          child: SizedBox(
            width: 140,
            height: 140,
            child: Icon(icon, color: colors.onContainer, size: 64),
          ),
        ),
      ),
    );
  }
}

class const _HeroDetailPage({
  required final ContainerColors colors,
  required final IconData icon,
  required final RoundedPolygon shape,
  required final String tag,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: tag,
              child: Material(
                color: colors.container,
                shape: MaterialShapeBorder(shape: shape),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Icon(icon, color: colors.onContainer, size: 64),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text('Hero Animation', style: textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              'Same tag = shared element transition',
              style: textTheme.bodyLarge?.copyWith(
                color: ColorScheme.of(context).onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
