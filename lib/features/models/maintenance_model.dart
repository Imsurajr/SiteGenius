class MaintenanceModel {
  String date;
  String longDesc;

  MaintenanceModel({ required this.date , required this.longDesc});

  toJson() {
    return {
    "Date": date,
    "Long Description": longDesc,
  };

  }
}