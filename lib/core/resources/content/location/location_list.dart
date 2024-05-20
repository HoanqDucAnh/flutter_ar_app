import 'package:flutter_ar_app/core/resources/content/location/location.dart';
import 'package:flutter_ar_app/src/bloc/content_bloc/content_bloc.dart';
import 'package:flutter_ar_app/src/model/explore_card/explore_card.dart';
import 'package:flutter_ar_app/src/model/model.dart';

List<MuseumArtifactModel> locationList = [
  MuseumArtifactModel(
    title: 'Khu trưng bày ngoài trời',
    subtitle:
        'Khu trưng bày ngoài trời với các loại máy bay, pháo, xe tăng, tên lửa, ...',
    type: ContentCategory.location,
    description: LocationContent().outdoorLocation,
    manufacturer: 'Hà Nội, Việt Nam',
    image:
        'lib/core/resources/images/content_images/location_images/outdoor.jpg',
  ),
  MuseumArtifactModel(
    title: 'Khu trưng bày trong nhà',
    subtitle:
        'Khu trưng bày trong nhà với các hiện vật, hình ảnh, tư liệu theo tiến trình lịch sử phát triển của bộ đội PK-KQ',
    type: ContentCategory.location,
    description: LocationContent().indoorLocation,
    manufacturer: 'Hà Nội, Việt Nam',
    image:
        'lib/core/resources/images/content_images/location_images/indoor.jpg',
  ),
];
