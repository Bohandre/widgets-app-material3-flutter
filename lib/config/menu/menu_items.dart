import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Riverpod Counter',
    subTitle: 'Introducción a riverpod',
    link: '/counter',
    icon: Icons.add,
  ),
  MenuItem(
    title: 'Snackbars y diálogos',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank,
  ),
  MenuItem(
    title: 'UI Controls',
    subTitle: 'Una serie de controles de Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'Introducción a la aplicación',
    subTitle: 'Pequeño tutorial introductorio',
    link: '/tutorial',
    icon: Icons.accessible_rounded,
  ),
  MenuItem(
    title: 'Infinite Scroll y Pull',
    subTitle: 'Listas infinitas y pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_rounded,
  ),
  MenuItem(
    title: 'Bottom App Bar',
    subTitle: 'Prueba con Bottom App Bar',
    link: '/bottom-app-bar',
    icon: Icons.line_weight_outlined,
  ),
  MenuItem(
    title: 'Navigation Rail',
    subTitle: 'Prueba con Navigation Rail',
    link: '/navigation-rail',
    icon: Icons.filter_list_outlined,
  ),
  MenuItem(
    title: 'Slider Material 3',
    subTitle: 'Prueba con Slider Material 3',
    link: '/slider-screen',
    icon: Icons.linear_scale_rounded,
  ),
  MenuItem(
    title: 'Temas',
    subTitle: 'Cambiar el tema global de la app',
    link: '/theme',
    icon: Icons.palette_outlined,
  ),
];
