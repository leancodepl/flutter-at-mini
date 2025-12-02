import 'package:flutter/material.dart';

class HeroDemo extends StatelessWidget {
  const HeroDemo({super.key});

  static const _items = [
    (color: Color(0xFFF85149), icon: Icons.rocket_launch, tag: 'rocket'),
    (color: Color(0xFF7EE787), icon: Icons.eco, tag: 'eco'),
    (color: Color(0xFF58A6FF), icon: Icons.water_drop, tag: 'water'),
    (color: Color(0xFFA371F7), icon: Icons.star, tag: 'star'),
    (color: Color(0xFFFFA657), icon: Icons.sunny, tag: 'sun'),
    (color: Color(0xFFF778BA), icon: Icons.favorite, tag: 'heart'),
  ];

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
      child: Center(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: _items
              .map(
                (item) => _HeroCard(
                  color: item.color,
                  icon: item.icon,
                  tag: item.tag,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.color, required this.icon, required this.tag});

  final Color color;
  final IconData icon;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder<void>(
            pageBuilder: (context, animation, secondaryAnimation) {
              return _HeroDetailPage(color: color, icon: icon, tag: tag);
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      },
      child: Hero(
        tag: tag,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: color.withAlpha(80),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 40),
        ),
      ),
    );
  }
}

class _HeroDetailPage extends StatelessWidget {
  const _HeroDetailPage({
    required this.color,
    required this.icon,
    required this.tag,
  });

  final Color color;
  final IconData icon;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: tag,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: color.withAlpha(100),
                      blurRadius: 40,
                      spreadRadius: 8,
                    ),
                  ],
                ),
                child: Icon(icon, color: Colors.white, size: 80),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Hero Animation',
              style: TextStyle(
                color: color,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Same tag = shared element transition',
              style: TextStyle(color: Color(0xFF8B949E), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


