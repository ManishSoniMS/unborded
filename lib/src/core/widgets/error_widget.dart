import 'package:flutter/material.dart';

import '../error/failure.dart';

class AppErrorWidget extends StatelessWidget {
  const new({super.key, this.onRetry, required this.failure});

  final VoidCallback? onRetry;
  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.error, size: 24.0),
            SizedBox(height: 12),
            Text(failure.message),
            SizedBox(height: 12),
            ElevatedButton(onPressed: onRetry, child: Text("Retry")),
          ],
        ),
      ),
    );
  }
}
