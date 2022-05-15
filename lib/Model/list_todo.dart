final List<Todo_list>? listtodo = [];
class Todo_list {
  String todotitle;
  DateTime startDate;
  DateTime endDate;
  bool completedStatus;
  String timeLeft;

  Todo_list({
    required this.todotitle,
    required this.startDate,
    required this.endDate,
    this.completedStatus = false,
    required this.timeLeft,
  });

}