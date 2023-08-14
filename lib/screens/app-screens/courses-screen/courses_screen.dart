import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          color: darkFont,
                          letterSpacing: -0.5,
                          fontSize: 18),
                    ),
                    Text(
                      "Youssef Mohammed",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w600,
                          color: darkFont,
                          letterSpacing: -0.5,
                          fontSize: 24),
                    )
                  ],
                ),
                const Spacer(),
                notificationButton(onTap: () {})
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              cursorColor: defaultColor,
              decoration: InputDecoration(
                floatingLabelStyle: TextStyle(color: defaultColor),
                labelText: "Search course",
                labelStyle: TextStyle(color: gray),
                suffixIcon: Image(
                  image: AssetImage("assets/images/icons/search-icon.png"),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: gray,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: defaultColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  physics: const BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.normal),
                  itemBuilder: (context, index) => courseItem(
                      duration: "3 h 30 min",
                      courseTitle: "UI",
                      courseDescription: "Advanced mobile interface design",
                      context: context)),
            )
          ],
        ),
      ),
    );
  }
}
