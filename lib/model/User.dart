class User {
  int? id;
  String? name;
  String? contact;
  String? description;

  Map<String, dynamic> userMap() {
    var mapping = <String, dynamic>{};
    mapping['id'] = id;
    mapping['name'] = name ?? ''; // Use a default value or handle null
    mapping['contact'] = contact ?? ''; // Use a default value or handle null
    mapping['description'] = description ?? ''; // Use a default value or handle null
    return mapping;
  }
}
