import 'package:flutter/material.dart';

void main() {
  runApp(const ChessApp());
}

class ChessApp extends StatelessWidget {
  const ChessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFF2D2A23),
      ),
      home: const ChessHomePage(),
    );
  }
}

class ChessHomePage extends StatelessWidget {
  const ChessHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D2A23),
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/chess_logo.png', height: 30),
              const Text(
                'Chess.com',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Rating categories
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRatingCard(
                  'Blitz',
                  '1055',
                  const Icon(Icons.flash_on, color: Colors.amber, size: 24),
                ),
                _buildRatingCard(
                  'Rapid',
                  '1055',
                  const Icon(
                    Icons.timer_outlined,
                    color: Colors.green,
                    size: 24,
                  ),
                ),
                _buildRatingCard('Bullet', '871', _buildBulletIcon()),
                _buildRatingCard(
                  'Daily',
                  '1293',
                  const Icon(Icons.wb_sunny, color: Colors.amber, size: 24),
                ),
              ],
            ),
          ),

          // Game Archive header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Text(
                  'Game Archive',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text(
                      'Result',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Accuracy',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Game history list
          Expanded(
            child: ListView(
              children: [
                _buildGameHistoryItem('shashanks31', true, bullet: false),
                _buildGameHistoryItem('MarioDraghiOP', false, bullet: false),
                _buildGameHistoryItem('MarioDraghiOP', true, bullet: false),
                _buildGameHistoryItem('Perfectstorm123', false, bullet: false),
                _buildGameHistoryItem('Gunjita7888', false, bullet: false),
                _buildGameHistoryItem('roudy347', true, bullet: false),
                _buildGameHistoryItem('Alkhan', true, bullet: false),
                _buildGameHistoryItem(
                  'Dr_Shaw',
                  false,
                  bullet: true,
                  accuracy: '17.6',
                ),
                _buildGameHistoryItem('Akshat_1799', false, bullet: true),
                _buildGameHistoryItem('justinbogorad13', null, bullet: true),
              ],
            ),
          ),

          // Game Archive button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF3A362C),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.folder_outlined,
                      color: Color(0xFFD8B06A),
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Game Archive',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ),

          // New Game button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8FBD3F),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'New Game',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          // Bottom navigation bar
          Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFF2D2A23),
              border: Border(top: BorderSide(color: Colors.black12, width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem('Play', Icons.person, true),
                _buildNavItem('Puzzles', Icons.extension, false),
                _buildNavItem('Lessons', Icons.school, false),
                _buildNavItem('Today', Icons.view_agenda, false),
                _buildNavItem('More', Icons.menu, false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletIcon() {
    return CustomPaint(
      size: const Size(24, 24),
      painter: BulletIconPainter(color: const Color(0xFFD8B06A)),
    );
  }

  Widget _buildRatingCard(String title, String rating, Widget icon) {
    return Container(
      width: 100,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF3A362C),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 16)),
          const SizedBox(height: 8),
          icon,
          const SizedBox(height: 8),
          Text(
            rating,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameHistoryItem(
    String opponent,
    bool? result, {
    bool bullet = false,
    String? accuracy,
  }) {
    Color resultColor;
    IconData resultIcon;

    if (result == true) {
      resultColor = Colors.green;
      resultIcon = Icons.add;
    } else if (result == false) {
      resultColor = Colors.red;
      resultIcon = Icons.remove;
    } else {
      resultColor = Colors.grey;
      resultIcon = Icons.remove;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      ),
      child: Row(
        children: [
          bullet
              ? const Icon(Icons.flash_on, color: Color(0xFFD8B06A), size: 20)
              : CustomPaint(
                size: const Size(20, 20),
                painter: BulletIconPainter(color: const Color(0xFFD8B06A)),
              ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              width: 40,
              height: 40,
              color: Colors.grey[300],
              child:
                  opponent.contains('Mario') ||
                          opponent.contains('Gunjita') ||
                          opponent.contains('Dr_Shaw') ||
                          opponent.contains('Alkhan')
                      ? Image.asset('assets/chess_logo.png', fit: BoxFit.cover)
                      : const Icon(Icons.person, size: 30, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              opponent,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: result == null ? Colors.grey[700] : resultColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Icon(resultIcon, color: Colors.white, size: 15),
            ),
          ),
          const SizedBox(width: 24),
          SizedBox(
            width: 70,
            child: Text(
              accuracy ?? 'Analyze',
              style: TextStyle(
                color: accuracy != null ? Colors.white : Colors.blue,
                fontSize: 16,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, IconData icon, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isActive ? Colors.white : Colors.grey, size: 24),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class BulletIconPainter extends CustomPainter {
  final Color color;

  BulletIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    // Drawing bullet
    final path = Path();

    // Bullet body
    final bulletWidth = size.width * 0.65;
    final bulletHeight = size.height * 0.8;
    final bulletLeft = size.width * 0.35;

    // Bullet tip
    final RRect bulletBody = RRect.fromRectAndRadius(
      Rect.fromLTWH(bulletLeft, size.height * 0.1, bulletWidth, bulletHeight),
      Radius.circular(bulletWidth * 0.5),
    );
    canvas.drawRRect(bulletBody, paint);

    // Bullet casings
    final linePaint =
        Paint()
          ..color = color
          ..strokeWidth = size.height * 0.1
          ..style = PaintingStyle.stroke;

    final lineSpacing = bulletHeight / 4;
    final lineWidth = size.width * 0.25;

    for (int i = 0; i < 3; i++) {
      final yPos = size.height * 0.2 + (i + 1) * lineSpacing;
      canvas.drawLine(
        Offset(size.width * 0.05, yPos),
        Offset(size.width * 0.05 + lineWidth, yPos),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
