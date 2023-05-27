class TodoCategories {
  TodoCategories({
    required this.categories,
  });
  late final List<String> categories;
  
  TodoCategories.fromJson(Map<String, dynamic> json){
    categories = List.castFrom<dynamic, String>(json['categories']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['categories'] = categories;
    return data;
  }
}