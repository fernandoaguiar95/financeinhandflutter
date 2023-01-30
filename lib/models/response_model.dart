class Response {
  final bool status;
  final String message;
  final int status_code;

  Response({
    required this.status,
    required this.message,
    required this.status_code,
  });

  Response.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        status_code = json['status_code'];
}
