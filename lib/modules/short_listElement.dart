import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShortListElement extends StatefulWidget {
  const ShortListElement({
    super.key,
    required this.title,
    required this.id,
    required this.icon,
    required this.end_icon,
  });

  final dynamic icon;
  final String title;
  final String id;
  final IconData end_icon;

  @override
  State<ShortListElement> createState() => _ShortListElementState();
}

class _ShortListElementState extends State<ShortListElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: ListTile(
        leading: _buildIcon(widget.icon),
        title: Text(widget.title),
        trailing: _buildIcon(widget.end_icon),
        onTap: () {
          GoRouter.of(context).pushNamed(widget.id);
        },
      ),
    );
  }

  Widget _buildIcon(dynamic icon) {
    if (icon is IconData) {
      return Icon(icon);
    } else if (icon is String) {
      return Text(icon);
    } else {
      return Container();
    }
  }
}
