import 'package:coders_oasis/models/course_model.dart';
import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              backButton(onTap: () => Navigator.pop(context)),
              TextField(
                controller: searchController,
                onChanged: (value) async {
                  final List<Course> courses =
                      await SupabaseService().courseSearch(value);
                  print(courses);
                },
              )
            ]),
          ),
        ));
  }
}
