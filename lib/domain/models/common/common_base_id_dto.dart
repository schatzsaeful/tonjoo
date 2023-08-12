class CommonBaseIdDto {
  String id;
  String name;

  CommonBaseIdDto({
    this.id = '',
    this.name = '',
  });

  Map<String, dynamic> toJson() => {
    if (id.isNotEmpty) 'id': id,
    if (name.isNotEmpty) 'name': name,
  };

  static CommonBaseIdDto fromJson (Map<String, dynamic> json) =>
      CommonBaseIdDto(
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
      );

}
