import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola Mundo'),
        action: SnackBarAction(
          label: 'Ok!',
          onPressed: () {},
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
        centerTitle: true,
      ),
      body: const _SnackbarView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackbar(context);
        },
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(
          Icons.remove_red_eye_outlined,
        ),
      ),
    );
  }
}

class _SnackbarView extends StatelessWidget {
  const _SnackbarView();

  @override
  Widget build(BuildContext context) {
    void openDialog(BuildContext context) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('¿Estás seguro?'),
          content: const Text(
            'Esse excepteur voluptate in eu qui sit adipisicing commodo occaecat. Ipsum minim in tempor ex dolor ex magna sunt dolore labore ad eiusmod incididunt. Labore laborum duis eiusmod culpa. Aute eiusmod ea officia nisi id ut sit consequat consequat incididunt quis. Aliquip ullamco sit ad sunt sint pariatur sit. Sunt et commodo elit exercitation et excepteur reprehenderit esse consequat occaecat fugiat consequat. Sunt proident ullamco incididunt voluptate esse officia exercitation nulla.',
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => context.pop(),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(
                context: context,
                children: [
                  const Text(
                    'Anim culpa elit consectetur cupidatat adipisicing culpa officia id non quis minim ex.',
                  ),
                ],
              );
            },
            child: const Text('Licencias Usadas'),
          ),
          FilledButton.tonal(
            onPressed: () => openDialog(context),
            child: const Text('Mostrar Diálogo'),
          ),
        ],
      ),
    );
  }
}
