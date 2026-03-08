import 'package:equatable/equatable.dart';

final Map<String, dynamic> testMap = {
  "success": true,
  "message": "تم جلب البيانات بنجاح",
  "data": [
    {
      "id": 13,
      "title": "أسواق شارع عبد العزيز",
      "image": "http://mia.gov.eg/media/Slider/%D8%A7%D8%B3%D9%88%D8%A7%D9%82.jpg",
      "description": "خصم بنسبة 10% على أى منتج من منتجات البيلت إن ( فرن , مسطح , شفاط , قلايه , شوايه , ميكروويف )\r\nخصم بنسبة 7% على أى منتج من منتجات الأجهزه المنزليه الصغيره ( خلاط , مروحه , سخان , مبرد , عنايه شخصيه , ...... )",
      "priority": 1,
      "is_Offer": true
    },

  ]
};

class OffersModel extends Equatable
{
  final bool success;
  final String message;
  final List<OffersDataModel> offersDataList;

  const OffersModel({required this.success,required this.message,required this.offersDataList});


  factory OffersModel.fromJson(Map<String,dynamic> json)
  {
    return OffersModel(
        success: json['success'],
        message: json['message'],
        offersDataList: List.from(json['data'].map<OffersDataModel>((offer)=>OffersDataModel.fromJsonApi(offer))));

  }


  @override
  List<Object?> get props => [success,message,offersDataList];


}

class OffersDataModel extends Equatable {

  final int id;
  final String title;
  final String image;
  final String description;
  final int priority;
  final bool isOffer;

  const OffersDataModel({required this.id, required this.title, required this.image, required this.description, required this.priority, required this.isOffer});


  factory OffersDataModel.fromJsonApi(json)
  {
    return OffersDataModel(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        description: json['description'],
        priority: json['priority'],
        isOffer: json['is_Offer']);
  }


 Map<String,dynamic> toJson()=>{
    "id": id,
    "title": title,
    "image": image,
    "description": description,
    "priority": priority,
    "is_Offer": isOffer
  };


  @override
  List<Object?> get props => [id,title,image,description,priority,isOffer];

}