import 'package:flutter/material.dart';

class MySearchBar extends SearchDelegate {
  static List<String> searchResults = [
    "Titanic",
    "World War",
    "Qaynona",
    "Suyunchi",
    "Kelin",
    "Uchrashuv",
    "Tom ans Jerry",
    "Merlin",
    "Kelinlar Qo'zg'oloni"
  ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = "";
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          onTap: () {
            query = suggestion;
          },
          title: Text(
            suggestion,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
      itemCount: suggestions.length,
    );
  }
}
