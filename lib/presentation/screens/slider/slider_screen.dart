import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  static const name = 'slider-screen';

  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: _currentSliderValue.toDouble(),
            max: 100,
            divisions: 100,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value.round();
              });
            },
          ),
          Text('Value: $_currentSliderValue'),
        ],
      ),
    );
  }
}
