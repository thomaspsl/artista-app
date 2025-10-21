import 'package:flutter/material.dart';

class ErrorContent extends StatefulWidget {
  const ErrorContent({super.key, required this.content});

  final Object? content;

  @override
  State<ErrorContent> createState() => _ErrorContentState();
}

class _ErrorContentState extends State<ErrorContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Une erreur est survenue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '${widget.content}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
