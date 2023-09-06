import 'package:flutter/material.dart';

void main() {
  runApp(MedianCalculatorApp());
}

class MedianCalculatorApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Median Calculator'),
        ),
        body: MedianCalculator(),
      ),
    );
  }
}

class MedianCalculator extends StatefulWidget {
  @override
  _MedianCalculatorState createState() => _MedianCalculatorState();
}

class _MedianCalculatorState extends State<MedianCalculator> {
  TextEditingController _controller = TextEditingController();
  List<int> numbers = [];
  String result = '';

  void calculateMedian() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        numbers.add(int.parse(_controller.text));
        _controller.clear();
      });
    }
  }

  void calculateFinalMedian() {
    if (numbers.length < 1) {
      setState(() {
        result = 'Lütfen en az bir sayı girin.';
      });
      return;
    }

    setState(() {
      numbers.sort();
      int middle = numbers.length ~/ 2;
      if (numbers.length % 2 == 0) {
        double median = (numbers[middle - 1] + numbers[middle]) / 2;
        result = 'Median: $median';
      } else {
        result = 'Median: ${numbers[middle]}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter Number'),
          ),
        ),
        ElevatedButton(
          onPressed: calculateMedian,
          child: Text('Add Number'),
        ),
        ElevatedButton(
          onPressed: calculateFinalMedian,
          child: Text('Calculate Median'),
        ),
        SizedBox(height: 20),
        Text(result),
      ],
    );
  }
}
