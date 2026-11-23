import 'package:labs_week8/widgets/task_scaffold.dart';
import 'package:material_ui/material_ui.dart';

class const Task1Page({super.key}) extends StatefulWidget {
  @override
  State<Task1Page> createState() => _Task1PageState();
}

class _Task1PageState() extends State<Task1Page> {
  bool _isExpanded = false;

  void _toggle() => setState(() => _isExpanded = !_isExpanded);

  @override
  Widget build(BuildContext context) {
    return TaskScaffold(
      actions: [
        ActionButton(
          label: _isExpanded ? 'Collapse' : 'Expand',
          icon: _isExpanded ? Icons.unfold_less : Icons.unfold_more,
          onPressed: _toggle,
          isPrimary: true,
        ),
      ],
      child: GestureDetector(
        onTap: _toggle,
        child: _ProfileCard(isExpanded: _isExpanded),
      ),
    );
  }
}

class const _ProfileCard({required final bool isExpanded})
    extends StatelessWidget {
  static const _expandedSize = 300.0;
  static const _expandedPadding = 24.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    // TODO: Animate the size, color, and shape changes.
    return Container(
      width: isExpanded ? _expandedSize : 228,
      height: isExpanded ? _expandedSize : 96,
      padding: EdgeInsets.all(isExpanded ? _expandedPadding : 20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: isExpanded
            ? colorScheme.tertiaryContainer
            : colorScheme.primaryContainer,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(isExpanded ? 48 : 28),
        ),
      ),
      // Always lays out the content at its expanded height. The card clips
      // whatever doesn't fit.
      child: OverflowBox(
        alignment: Alignment.topCenter,
        minHeight: _expandedSize - 2 * _expandedPadding,
        maxHeight: _expandedSize - 2 * _expandedPadding,
        child: Column(
          children: [
            _Header(isExpanded: isExpanded),
            Expanded(child: _Details(isExpanded: isExpanded)),
          ],
        ),
      ),
    );
  }
}

class const _Header({required final bool isExpanded}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    // TODO: Animate the position of the header.
    return Align(
      alignment: isExpanded ? Alignment.center : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TODO: Animate the size, color, and shape of the avatar.
          Container(
            width: isExpanded ? 72 : 56,
            height: isExpanded ? 72 : 56,
            decoration: ShapeDecoration(
              color: isExpanded ? colorScheme.tertiary : colorScheme.primary,
              shape: MaterialShapeBorder(
                shape: isExpanded
                    ? MaterialShapes.flower
                    : MaterialShapes.cookie6Sided,
              ),
            ),
            child: Icon(Icons.person, color: colorScheme.onPrimary, size: 32),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Jane Developer',
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium,
                ),
                Text(
                  'Flutter Engineer',
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class const _Details({required final bool isExpanded}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Fade the details in once the card is mostly expanded. Fade them
    // out quickly when collapsing.
    return Opacity(
      opacity: isExpanded ? 1 : 0,
      child: const Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Building beautiful apps with Flutter. '
                'Passionate about animations and smooth UX.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Stat(label: 'Projects', value: '42'),
              _Stat(label: 'Stars', value: '1.2k'),
              _Stat(label: 'Followers', value: '856'),
            ],
          ),
        ],
      ),
    );
  }
}

class const _Stat({required final String label, required final String value})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Column(
      children: [
        Text(value, style: textTheme.titleLarge),
        Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            color: ColorScheme.of(context).onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
