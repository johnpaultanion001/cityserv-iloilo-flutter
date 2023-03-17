// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DiscoverCategories {
  String title;
  String description;
  DiscoverCategories({
    required this.title,
    required this.description,
  });

  static List<DiscoverCategories> sample() {
    List<DiscoverCategories> myList = <DiscoverCategories>[
      DiscoverCategories(
        title: 'LGU/Government',
        description: "5 minutes ago",
      ),
      DiscoverCategories(
        title: 'Hospitals',
        description: "5 minutes ago",
      ),
      DiscoverCategories(
        title: 'Malls',
        description: "5 minutes ago",
      ),
      DiscoverCategories(
        title: 'Night Clubs',
        description: "5 minutes ago",
      ),
      DiscoverCategories(
        title: 'Bars',
        description: "5 minutes ago",
      )
    ];
    return myList;
  }

  DiscoverCategories copyWith({
    String? title,
    String? description,
  }) {
    return DiscoverCategories(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
    };
  }

  factory DiscoverCategories.fromMap(Map<String, dynamic> map) {
    return DiscoverCategories(
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscoverCategories.fromJson(String source) => DiscoverCategories.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DiscoverCategories(title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DiscoverCategories && other.title == title && other.description == description;
  }

  @override
  int get hashCode {
    return title.hashCode ^ description.hashCode;
  }
}
