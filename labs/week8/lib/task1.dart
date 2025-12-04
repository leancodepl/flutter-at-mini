import 'package:flutter/material.dart';

class Task1Page extends StatefulWidget {
  const Task1Page({super.key});

  @override
  State<Task1Page> createState() => _Task1PageState();
}

class _Task1PageState extends State<Task1Page> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() => _isExpanded = !_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 1: Animated Profile Card')),
      body: Center(
        child: GestureDetector(
          onTap: _toggleExpanded,
          child: _ProfileCard(isExpanded: _isExpanded),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.isExpanded});

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    // TODO: Add smooth animations when transitioning between states
    return Container(
      clipBehavior: Clip.hardEdge,
      width: isExpanded ? 300 : 200,
      height: isExpanded ? 280 : 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isExpanded
              ? [const Color(0xFF7EE787), const Color(0xFF3FB950)]
              : [const Color(0xFF58A6FF), const Color(0xFF1F6FEB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(isExpanded ? 24 : 16),
        boxShadow: [
          BoxShadow(
            color:
                (isExpanded ? const Color(0xFF7EE787) : const Color(0xFF58A6FF))
                    .withAlpha(60),
            blurRadius: 24,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _AvatarSection(isExpanded: isExpanded),
            if (isExpanded) ...[
              const SizedBox(height: 16),
              _ExpandedContent(isExpanded: isExpanded),
            ],
          ],
        ),
      ),
    );
  }
}

class _AvatarSection extends StatelessWidget {
  const _AvatarSection({required this.isExpanded});

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    // TODO: Add animations for position and size changes
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: isExpanded ? 60 : 50,
          height: isExpanded ? 60 : 50,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(230),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, color: Color(0xFF1F6FEB), size: 32),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Jane Developer',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Flutter Engineer',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white.withAlpha(200),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExpandedContent extends StatelessWidget {
  const _ExpandedContent({required this.isExpanded});

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    // TODO: Add fade animation
    return const Expanded(
      child: ClipRect(
        child: OverflowBox(
          minHeight: 0,
          maxHeight: 200,
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Building beautiful apps with Flutter. '
                'Passionate about animations and smooth UX.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _StatItem(label: 'Projects', value: '42'),
                  _StatItem(label: 'Stars', value: '1.2k'),
                  _StatItem(label: 'Followers', value: '856'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white.withAlpha(180), fontSize: 11),
        ),
      ],
    );
  }
}
