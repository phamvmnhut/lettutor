import 'package:flutter/material.dart';
typedef SpecicalitiesListCallback = void Function(String details);

class SpecicalitiesList extends StatelessWidget {
  SpecicalitiesList({Key? key, required this.listSpec}) : super(key: key);

  final List<String> listSpec;
  SpecicalitiesListCallback? selectClick;

  @override
  Widget build(BuildContext context) {
    TextStyle? btnStyle = Theme.of(context).textTheme.bodyText2;

    return Wrap(
      children: listSpec.map((text) => Padding(
        padding: const EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: (){
            if (selectClick != null) {
              selectClick!(text);
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: Theme.of(context)
                .primaryColor
          ),
          child: Text(text, style: btnStyle),
        ),
      ),).toList()
    );
  }
}
