class Request {
  final String id;
  final String status;
  final double total;

  Request({
    required this.id,
    required this.status,
    required this.total,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['id']?.toString() ?? '',
      status: json['status'] ?? '',
      total: (json['total'] is num) ? json['total'].toDouble() : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'total': total,
    };
  }
}