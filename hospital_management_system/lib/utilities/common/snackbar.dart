import 'package:flutter/material.dart';

class SnackBarComponent {
  SnackBarComponent({
    required this.context,
    required this.message,
    required this.type,
    required this.duration,
  }) {
    init();
  }

  final BuildContext context;
  final String message;
  final String type;
  final Duration duration;

  init() {
    Color color = Colors.white;
    IconData icon = Icons.info_outline;
    if (type == 'primary') {
      color = Colors.blue;
    } else if (type == 'success') {
      color = Colors.green;
      icon = Icons.check_circle;
    } else if (type == 'warning') {
      color = Colors.orange;
      icon = Icons.error;
    } else if (type == 'danger') {
      color = Colors.red;
      icon = Icons.cancel;
    }
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 4,
        duration: duration,
        backgroundColor: color,
        padding: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Icon(icon, color: Colors.white)),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
