import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  final String text;
  final bool isDone;
  final Color color;

  const TodoWidget({Key key, this.text, this.isDone, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.0, vertical: 8),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 12.0),
            child: Icon(
              isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: color,
            ),
          ),
          Flexible(
            child: Text(
              text ?? "Todo Widget",
              style: TextStyle(
                fontWeight: isDone ? FontWeight.bold : FontWeight.w600,
                fontSize: 16,
                color: isDone ? Colors.black : Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
