class UpdateBot {
  Map<String, dynamic> body;
  Map query;
  String type;
  Uri uri;

  UpdateBot({
    required this.uri,
    required this.body,
    required this.query,
    required this.type,
  });
}
