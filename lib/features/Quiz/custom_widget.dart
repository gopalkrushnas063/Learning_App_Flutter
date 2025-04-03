import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CustomWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.gothicA1(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.gothicA1(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}