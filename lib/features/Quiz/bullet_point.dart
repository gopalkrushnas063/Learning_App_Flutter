import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0, right: 8.0,left: 10.0),
            child: Icon(
              Icons.circle,
              size: 12,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.gothicA1(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

