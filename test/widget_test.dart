import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/models/restaurant_model.dart';

var sampleRestaurant = {
  "id": "rqdv5juczeskfw1e867",
  "name": "Melting Pot",
  "description":
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
  "pictureId": "14",
  "city": "Medan",
  "rating": 4.2
};

void main() {
  test("Test Parsing Json", () async {
    var resultId = Restaurant.fromJson(sampleRestaurant).id;
    var resultName = Restaurant.fromJson(sampleRestaurant).name;
    var resultPictureId = Restaurant.fromJson(sampleRestaurant).pictureId;

    expect(resultId, "rqdv5juczeskfw1e867");
    expect(resultName, "Melting Pot");
    expect(resultPictureId, "14");
  });
}
