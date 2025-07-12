/// slug : "beauty"
/// name : "Beauty"
/// url : "https://dummyjson.com/products/category/beauty"

class ProductCategory {
  ProductCategory({String? slug, String? name, String? url}) {
    _slug = slug;
    _name = name;
    _url = url;
  }

  ProductCategory.fromJson(dynamic json) {
    _slug = json['slug'];
    _name = json['name'];
    _url = json['url'];
  }

  String? _slug;
  String? _name;
  String? _url;

  ProductCategory copyWith({String? slug, String? name, String? url}) =>
      ProductCategory(
        slug: slug ?? _slug,
        name: name ?? _name,
        url: url ?? _url,
      );

  String? get slug => _slug;

  String? get name => _name;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slug'] = _slug;
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }
}
