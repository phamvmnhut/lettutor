import 'package:flutter/material.dart';
import 'package:lettutor/controller/message.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/ui/message/comp/message_tutor_item.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class MessageGenUI extends StatefulWidget {
  @override
  _MessageGenUIState createState() => _MessageGenUIState();
}

class _MessageGenUIState extends State<MessageGenUI> {
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
    if (filter.isNotEmpty) {
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

  final MessageCtrl _messageCtrl = MessageCtrl.to;

  @override
  Widget build(BuildContext context) {
    final fsb = FloatingSearchBar.of(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    return Scaffold(
      body: FloatingSearchBar(
        controller: controller,
        body: Padding(
          padding: EdgeInsets.only(top: fsb?.widget.height ?? 70),
          child: SingleChildScrollView(
            child: Column(
              children: _messageCtrl.tutors.toList()
                  .map((e) => MessageTutorItem(
                        tutor: e,
                        trailing: Icon(Icons.check_circle_outline_outlined),
                        onTap: () {
                          MessageCtrl.to.navigateDetail("");
                        },
                      ))
                  .toList(),
            ),
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
        },
        onSubmitted: (query) {
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
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
