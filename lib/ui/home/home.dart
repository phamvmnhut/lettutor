import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/ui/components/background.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    Color btnColor = Theme.of(context).buttonColor;
    return Material(
      child: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Container(
                  width: double.infinity,
                  child: Column(

                    children: [
                      Text(
                        "Welcome to Let Tutor",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "Get your room by booking now",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          print("Book now click");
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Book Now", style: textTheme.button),
                        ),
                        icon: Icon(Icons.library_add_check_outlined,
                            size: 20.0, color: btnColor),
                      )
                    ],
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 3 / 2,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.amber,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bookmarks_outlined),
                        SizedBox(height: 10),
                        Text("Tutor", style: textTheme.headline3)
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.redAccent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.schedule_send),
                        SizedBox(height: 10),
                        Text("Schedule", style: textTheme.headline3)
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.blue,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.my_library_books_outlined),
                        SizedBox(height: 10),
                        Text("Course", style: textTheme.headline3)
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.grey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.settings),
                        SizedBox(height: 10),
                        Text("Settings", style: textTheme.headline3)
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
