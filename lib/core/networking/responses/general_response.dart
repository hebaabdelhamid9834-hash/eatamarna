import '../network-mappers.dart';

class GeneralResponse extends BaseMappable {
  bool? status;
  dynamic message;
  dynamic data;

  GeneralResponse({this.status, this.data,this.message});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data;
    data['message']=message;
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message=json['message'];
    return GeneralResponse(status: status, data: data,message: message);
  }
}
