class Task {
  String id;
  String title;
  int date;
  bool IsDone;
  int hour;
  int min;

  Task(
      {this.id = "",
      required this.hour,
      required this.min,
      required this.title,
      required this.date,
      this.IsDone = false});
  Map<String, dynamic> ToJson() {
    return {
      "id": this.id,
      "title": this.title,
      "isdone": this.IsDone,
      "date": this.date,
      "hour": this.hour,
      "min": this.min,
    };
  }

  Task.fromJson(Map<String, dynamic> json)
      : this(
            id: json["id"],
            title: json["title"],
            date: json["date"],
            IsDone: json["isdone"],
            hour: json["hour"],
            min: json["min"]);
}
