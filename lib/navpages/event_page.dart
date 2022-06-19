import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Event page',
        style: GoogleFonts.calligraffitti(fontSize: 20),
      ),
    );
  }
}
