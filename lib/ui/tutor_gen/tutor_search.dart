import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lettutor/controller//tutor.dart';
import 'package:lettutor/ui/tutor_gen/comp/specialities_list.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'dart:developer' as dev;
import 'comp/tutor_card.dart';

class TutorSearchUI extends StatefulWidget {
  @override
  _TutorSearchUIState createState() => _TutorSearchUIState();
}

class _TutorSearchUIState extends State<TutorSearchUI> {
  static const historyLength = 5;

  List<String> _searchHistory = [
    'Giáo viên 1',
    'Giáo viên 3',
    'GV 1',
    'Việt Nam',
  ];

  List<String> filteredSearchHistory = [];

  String selectedTerm = "";

  List<String> filterSearchTerms({
    required String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: "");
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: "");
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  late FloatingSearchBarController controller;

  final TutorCtrl _tutorCtrl = Get.find();

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: "");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fsb = FloatingSearchBar.of(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    double withSize = MediaQuery.of(context).size.width;
    int count = withSize > 700
        ? withSize > 1100
            ? withSize > 1400
                ? 4
                : 3
            : 2
        : 1;
    return Scaffold(
      body: FloatingSearchBar(
        controller: controller,
        body: Padding(
          padding: EdgeInsets.only(top: fsb?.widget.height ?? 70),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 20,),
                          Obx(
                            () => SpecicalitiesList(
                              listSpec: _tutorCtrl.listSpec.toList(),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text("Search Result", style: textTheme.headline3),
                              SizedBox(width: 10),
                              Obx(() => Text("${_tutorCtrl.tutors.length} make",
                                  style: textTheme.headline4
                                      ?.copyWith(fontStyle: FontStyle.italic)))
                            ],
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => SliverStaggeredGrid.countBuilder(
                  crossAxisCount: count,
                  staggeredTileBuilder: (_) => const StaggeredTile.fit(1),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    // child: new TutorCard(tutorIndex: index),
                    child: TutorCard(tutor: _tutorCtrl.tutors[index]),
                  ),
                  itemCount: _tutorCtrl.tutors.length,
                  mainAxisSpacing: 16,
                ),
              )
            ],
          ),
        ),
        transition: CircularFloatingSearchBarTransition(),
        physics: BouncingScrollPhysics(),
        title: Text(
          selectedTerm == "" ? 'Search Tutor' : selectedTerm,
          style: textTheme.caption,
        ),
        hint: 'Search for Name or Country...',
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        onQueryChanged: (query) {
          setState(() {
            filteredSearchHistory = filterSearchTerms(filter: query);
          });
          dev.log("filtered $query", name: "SearchPage");
        },
        onSubmitted: (query) {
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          dev.log("search $query", name: "SearchPage");
          _tutorCtrl.searchTutor(query);
          controller.close();
        },
        builder: (context, transition) {
          return Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(width: 0.5, color: priColor)),
            child: Builder(
              builder: (context) {
                if (filteredSearchHistory.isEmpty && controller.query.isEmpty) {
                  return Container(
                    height: 45,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Start searching',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.caption,
                    ),
                  );
                } else if (filteredSearchHistory.isEmpty) {
                  return ListTile(
                    title: Text(controller.query),
                    leading: const Icon(Icons.search),
                    onTap: () {
                      setState(() {
                        addSearchTerm(controller.query);
                        selectedTerm = controller.query;
                      });
                      _tutorCtrl.searchTutor(controller.query);
                      controller.close();
                    },
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: filteredSearchHistory
                        .map(
                          (term) => ListTile(
                            title: Text(
                              term,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.caption,
                            ),
                            leading: Icon(Icons.history, color: hlColor),
                            trailing: IconButton(
                              icon: Icon(Icons.clear, color: hlColor),
                              onPressed: () {
                                setState(() {
                                  deleteSearchTerm(term);
                                });
                              },
                            ),
                            onTap: () {
                              setState(() {
                                putSearchTermFirst(term);
                                selectedTerm = term;
                              });
                              controller.close();
                              _tutorCtrl.searchTutor(term);
                            },
                          ),
                        )
                        .toList(),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
