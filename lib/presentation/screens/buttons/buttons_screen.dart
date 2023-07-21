import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
        centerTitle: true,
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.02,
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: [
            // ElevatedButton
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Disable'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.car_crash_outlined),
              label: const Text('Elevated Icon'),
            ),

            // FilledButton
            FilledButton(
              onPressed: () {},
              child: const Text('Filled'),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_box_rounded),
              label: const Text('Filled Icon'),
            ),

            // Outline
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outline'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_tree_rounded),
              label: const Text('Outline Icon'),
            ),

            // TextButton
            TextButton(
              onPressed: () {},
              child: const Text('TextButton'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.work_outline),
              label: const Text('TextButton Icon'),
            ),

            const CustomButton(),

            // IconButton
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.window),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.window),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.height * 0.01,
            ),
            child: const Text(
              'Custom Button',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
