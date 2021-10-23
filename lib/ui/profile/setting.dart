import 'package:flutter/material.dart';
import 'package:lettutor/ui/components/background.dart';

class _ItemSetting {
  final String name;
  final IconData iconData;
  final VoidCallback onPress;

  _ItemSetting(
      {required this.name, required this.iconData, required this.onPress});
}

class SettingUI extends StatelessWidget {
  const SettingUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    List<_ItemSetting> genSettingList = [
      _ItemSetting(
          name: "Feedback", iconData: Icons.feedback_outlined, onPress: () {
            print("Feebback click");
      }),
      _ItemSetting(
          name: "Booking", iconData: Icons.bookmarks_outlined, onPress: () {}),
      _ItemSetting(name: "History", iconData: Icons.history, onPress: () {}),
      _ItemSetting(name: "Advance", iconData: Icons.add_road, onPress: () {}),
    ];
    List<_ItemSetting> aboutSettingList = [
      _ItemSetting(
          name: "Website",
          iconData: Icons.add_to_home_screen_outlined,
          onPress: () {}),
      _ItemSetting(
          name: "Facebook", iconData: Icons.facebook_outlined, onPress: () {}),
      _ItemSetting(
          name: "Sign Out",
          iconData: Icons.call_missed_outgoing_outlined,
          onPress: () {}),
    ];

    return Material(
      child: Background.another1(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("General", style: textTheme.headline3),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 80,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: genSettingList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        _ItemSetting item = genSettingList[index];
                        return InkWell(
                          onTap: item.onPress,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(item.iconData),
                                SizedBox(height: 5),
                                Text(item.name, style: textTheme.caption)
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: cardColor, borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 10),
                Text("About & Term", style: textTheme.headline3),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 80,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: aboutSettingList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        _ItemSetting item = aboutSettingList[index];
                        return InkWell(
                          onTap: item.onPress,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(item.iconData),
                                SizedBox(height: 5),
                                Text(item.name, style: textTheme.caption)
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: cardColor, borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
