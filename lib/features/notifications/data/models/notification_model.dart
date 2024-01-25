class NotificationModel {
  final int id;
  final String topic;
  final String title;
  final String body;
  final String notificationDate;

  NotificationModel({
    required this.id,
    required this.topic,
    required this.title,
    required this.body,
    required this.notificationDate,
  });

  factory NotificationModel.fromJson({required Map<String, dynamic> data}) {
    return NotificationModel(
      id: data['id'],
      topic: data['topic'],
      title: data['title'],
      body: data['body'],
      notificationDate: data['notification_date'],
    );
  }
}
