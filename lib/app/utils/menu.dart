import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.bgcolor,
    required this.ico,
    required this.t1,
    required this.t2,
  });

  final Color bgcolor;
  final Widget ico;
  final String t1;
  final String t2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 7,
        left: 7,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 4.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgcolor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 18),
            Container(
              height: MediaQuery.of(context).size.height / 6.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: ico,
            ),
            const SizedBox(width: 19),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t1,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    t2,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 27),
          ],
        ),
      ),
    );
  }
}
