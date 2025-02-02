import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_title("Title"), _description("text")],
        )
      ],
    );
  }
}

Widget _title(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _description(String text) {
  return Text(text);
}
