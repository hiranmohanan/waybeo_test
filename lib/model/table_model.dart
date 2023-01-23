class tableModel{
  String ? day;
  String ? status;
  String ? morning;
  String ?afternoon;
  String ? evening;

  tableModel({this.day,this.status,this.morning,this.afternoon,this.evening});

  Map<String, dynamic> toMap(){
    var map=<String,dynamic>{};
    map['day']=day;
    map['status']=status;
    map['morning ']=morning;
    map['afternoon']=afternoon;
    map['evening']=evening;
    return map;
  }

  tableModel.fromMap(Map<String,dynamic>map){
    day=map['day'];
    status=map['status'];
    morning=map['morning'];
    afternoon=map['afternoon'];
    evening=map['evening'];
  }
}