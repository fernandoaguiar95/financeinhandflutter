class Response {
  final bool status;
  final String message;

  Response({
    required this.status,
    required this.message,
  });

  Response.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'];
}
