import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AnimationsPackageDemo extends StatelessWidget {
  const AnimationsPackageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF161B22), Color(0xFF0D1117)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            _OpenContainerCard(
              color: Color(0xFFF85149),
              icon: Icons.photo_library,
              label: 'Gallery',
            ),
            _OpenContainerCard(
              color: Color(0xFF7EE787),
              icon: Icons.music_note,
              label: 'Music',
            ),
            _OpenContainerCard(
              color: Color(0xFF58A6FF),
              icon: Icons.video_library,
              label: 'Videos',
            ),
            _OpenContainerCard(
              color: Color(0xFFA371F7),
              icon: Icons.article,
              label: 'Articles',
            ),
          ],
        ),
      ),
    );
  }
}

class _OpenContainerCard extends StatelessWidget {
  const _OpenContainerCard({
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 500),
      openBuilder: (context, closeContainer) {
        return _DetailPage(
          color: color,
          icon: icon,
          label: label,
          onClose: closeContainer,
        );
      },
      closedElevation: 0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      closedColor: color,
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onTap: openContainer,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: color.withAlpha(80),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 40),
                const SizedBox(height: 8),
                Text(label, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DetailPage extends StatelessWidget {
  const _DetailPage({
    required this.color,
    required this.icon,
    required this.label,
    required this.onClose,
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: onClose,
        ),
        title: Text(label, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 120),
            const SizedBox(height: 24),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 32),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: Text(
                'OpenContainer from animations package\n'
                'provides Material container transform',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
