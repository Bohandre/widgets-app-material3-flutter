import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
        centerTitle: true,
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          const Text('Circular Progress Indicator'),
          SizedBox(
            height: size.height * 0.01,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
            color: colors.primary,
            backgroundColor: Colors.black45,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          const Text('Circular y Linear Controlado'),
          SizedBox(
            height: size.height * 0.01,
          ),
          const _ControllerProgressIndicator()
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 200), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black12,
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
