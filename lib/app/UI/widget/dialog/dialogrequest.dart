// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class DialogRequestW {
//   final String title;
//   final String description;
//   final String buttonTitle;
//   final String? cancelTitle;
//   DialogRequestW({
//     required this.title,
//     required this.description,
//     required this.buttonTitle,
//     this.cancelTitle,
//   });

//   // DialogRequestW(
//   //     {required this.title,
//   //     required this.description,
//   //     required this.buttonTitle,
//   //     this.cancelTitle});

//   DialogRequestW copyWith({
//     String? title,
//     String? description,
//     String? buttonTitle,
//     String? cancelTitle,
//   }) {
//     return DialogRequestW(
//       title: title ?? this.title,
//       description: description ?? this.description,
//       buttonTitle: buttonTitle ?? this.buttonTitle,
//       cancelTitle: cancelTitle ?? this.cancelTitle,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'title': title,
//       'description': description,
//       'buttonTitle': buttonTitle,
//       'cancelTitle': cancelTitle,
//     };
//   }

//   factory DialogRequestW.fromMap(Map<String, dynamic> map) {
//     return DialogRequestW(
//       title: map['title'] as String,
//       description: map['description'] as String,
//       buttonTitle: map['buttonTitle'] as String,
//       cancelTitle: map['cancelTitle'] != null ? map['cancelTitle'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory DialogRequestW.fromJson(String source) => DialogRequestW.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'DialogRequestW(title: $title, description: $description, buttonTitle: $buttonTitle, cancelTitle: $cancelTitle)';
//   }

//   @override
//   bool operator ==(covariant DialogRequestW other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.title == title &&
//       other.description == description &&
//       other.buttonTitle == buttonTitle &&
//       other.cancelTitle == cancelTitle;
//   }

//   @override
//   int get hashCode {
//     return title.hashCode ^
//       description.hashCode ^
//       buttonTitle.hashCode ^
//       cancelTitle.hashCode;
//   }
// }

// class DialogResponse {
//   final String? fieldOne;
//   final String? fieldTwo;
//   final bool? confirmed;

//   DialogResponse({
//     this.fieldOne,
//     this.fieldTwo,
//     this.confirmed,
//   });

//   DialogResponse copyWith({
//     String? fieldOne,
//     String? fieldTwo,
//     bool? confirmed,
//   }) {
//     return DialogResponse(
//       fieldOne: fieldOne ?? this.fieldOne,
//       fieldTwo: fieldTwo ?? this.fieldTwo,
//       confirmed: confirmed ?? this.confirmed,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'fieldOne': fieldOne,
//       'fieldTwo': fieldTwo,
//       'confirmed': confirmed,
//     };
//   }

//   factory DialogResponse.fromMap(Map<String, dynamic> map) {
//     return DialogResponse(
//       fieldOne: map['fieldOne'] != null ? map['fieldOne'] as String : null,
//       fieldTwo: map['fieldTwo'] != null ? map['fieldTwo'] as String : null,
//       confirmed: map['confirmed'] != null ? map['confirmed'] as bool : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory DialogResponse.fromJson(String source) => DialogResponse.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'DialogResponse(fieldOne: $fieldOne, fieldTwo: $fieldTwo, confirmed: $confirmed)';

//   @override
//   bool operator ==(covariant DialogResponse other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.fieldOne == fieldOne &&
//       other.fieldTwo == fieldTwo &&
//       other.confirmed == confirmed;
//   }

//   @override
//   int get hashCode => fieldOne.hashCode ^ fieldTwo.hashCode ^ confirmed.hashCode;
// }
