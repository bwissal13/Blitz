class Rider {
  final String estimatedArrivalTime;

  Rider({
    required this.estimatedArrivalTime,
  });

  factory Rider.fromJson(Map<String, dynamic> json) {
    return Rider(
      estimatedArrivalTime: json['estimated_arrival_time'] ?? 'Unknown time',
    );
  }
}