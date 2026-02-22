//C:\Users\DELL\Documents\Cadt\cadty3t2\Flutter\another\w4\w4practice\lib\1_color_app\color_app.dart
import 'package:flutter/material.dart';
import 'color_service.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Home()),
    ),
  );
}



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ?  ColorTapsScreen()
          :  StatisticsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          ColorTap(type: CardType.red),
          ColorTap(type: CardType.blue),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;


  const ColorTap({
    super.key,
    required this.type,

  });

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: colorService,
      builder: (context, _) {
        int tapCount = type == CardType.red
            ? colorService.redTapCount
            : colorService.blueTapCount;

        return GestureDetector(
          onTap: () => colorService.increment(type),
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(
                'Taps: $tapCount',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

class StatisticsScreen extends StatelessWidget {


  const StatisticsScreen({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: ListenableBuilder(
          listenable: colorService,
          builder: (context, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Red Taps: ${colorService.redTapCount}',
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  'Blue Taps: ${colorService.blueTapCount}',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
