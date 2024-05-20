import 'package:flutter_ar_app/core/resources/content/plane/plane.dart';
import 'package:flutter_ar_app/src/bloc/content_bloc/content_bloc.dart';
import 'package:flutter_ar_app/src/model/explore_card/explore_card.dart';

List<MuseumArtifactModel> planeList = [
  MuseumArtifactModel(
    title: 'Trực thăng MI4',
    subtitle: 'Trực thăng vận tải',
    type: ContentCategory.plane,
    description: PlaneContent().MI4Hellicopter,
    manufacturer: 'Liên Xô',
    image: 'lib/core/resources/images/content_images/plane_images/mi4Heli.jpg',
    contentImg: [
      'lib/core/resources/images/content_images/plane_images/inner_images/mi4.jpg'
    ],
    modelUrl: 'models.scnassets/helicopter2.dae',
    question: 'Mẫu này có bao nhiêu chỗ ngồi?',
    answer1: '4',
    result1: 'FalseNode',
    answer2: '7',
    result2: 'TrueNode',
    scale: 0.01,
  ),
  MuseumArtifactModel(
    title: 'Máy bay HL-2',
    subtitle: 'Máy bay huấn luyện',
    type: ContentCategory.plane,
    description: PlaneContent().HL2Plane,
    manufacturer: 'Việt Nam',
    image: 'lib/core/resources/images/content_images/plane_images/hl2Plane.jpg',
    contentImg: [
      'lib/core/resources/images/content_images/plane_images/inner_images/hl2.jpg'
    ],
  ),
  MuseumArtifactModel(
    title: 'Máy bay SU-22M',
    subtitle: 'SuKhoi SU-22M',
    type: ContentCategory.plane,
    description: ['Phổ biến'],
    manufacturer: 'Liên Xô',
    image:
        'lib/core/resources/images/content_images/plane_images/su22mPlane.jpg',
    contentImg: [
      'lib/core/resources/images/content_images/plane_images/inner_images/su22m.jpg'
    ],
  ),
  MuseumArtifactModel(
    title: 'Máy bay HL-1',
    subtitle: 'Máy bay huấn luyện',
    type: ContentCategory.plane,
    description: PlaneContent().HL1Plane,
    manufacturer: 'Việt Nam',
    image: 'lib/core/resources/images/content_images/plane_images/hl1Plane.jpg',
    contentImg: [
      'lib/core/resources/images/content_images/plane_images/inner_images/hl1.jpg'
    ],
  ),
  MuseumArtifactModel(
    title: 'Máy bay MiG-19',
    subtitle: 'Máy bay tiêm kích',
    type: ContentCategory.plane,
    description: PlaneContent().Mig19Plane,
    manufacturer: 'Liên Xô',
    image:
        'lib/core/resources/images/content_images/plane_images/mig19Plane.jpg',
    contentImg: [
      'lib/core/resources/images/content_images/plane_images/inner_images/mig19.jpg'
    ],
  ),
  MuseumArtifactModel(
    title: 'Máy bay AN-2',
    subtitle: 'Máy bay vận tải',
    type: ContentCategory.plane,
    description: PlaneContent().AN2Plane,
    manufacturer: 'Liên Xô',
    image: 'lib/core/resources/images/content_images/plane_images/an2Plane.jpg',
    contentImg: [
      'lib/core/resources/images/content_images/plane_images/inner_images/an2.jpg'
    ],
    modelUrl: 'models.scnassets/combatplane.dae',
    question: 'Mẫu máy bay này có màu gì?',
    answer1: 'Xanh Lá',
    result1: 'TrueNode',
    answer2: 'Trắng',
    result2: 'FalseNode',
    scale: 0.03,
  ),
  MuseumArtifactModel(
    title: 'Máy bay VNS-41',
    subtitle: 'Máy bay lưỡng dụng siêu nhẹ',
    type: ContentCategory.plane,
    description: PlaneContent().VNS41Plane,
    manufacturer: 'Việt Nam',
    image:
        'lib/core/resources/images/content_images/plane_images/vns41Plane.jpg',
    contentImg: [
      'lib/core/resources/images/content_images/plane_images/inner_images/vns41.jpg'
    ],
  ),
  MuseumArtifactModel(
    title: 'Máy bay MiG-21F-96',
    subtitle: 'Máy bay tiêm kích',
    type: ContentCategory.plane,
    description: PlaneContent().Mig21F96Plane,
    manufacturer: 'Liên Xô',
    image:
        'lib/core/resources/images/content_images/plane_images/mig21Plane.jpg',
    contentImg: [
      'lib/core/resources/images/content_images/plane_images/inner_images/mig21.jpg',
      'lib/core/resources/images/content_images/plane_images/inner_images/mig21_2.jpg'
    ],
  ),
  MuseumArtifactModel(
    title: 'Máy bay MiG-17',
    subtitle: 'Máy bay tiêm kích',
    type: ContentCategory.plane,
    description: PlaneContent().Mig17Plane,
    manufacturer: 'Liên Xô',
    image:
        'lib/core/resources/images/content_images/plane_images/mig17Plane.jpg',
    contentImg: [
      'lib/core/resources/images/content_images/plane_images/inner_images/mig17.jpg'
    ],
  ),
  MuseumArtifactModel(
    title: 'Máy bay ném bom MiG-17',
    subtitle: 'Máy bay ném bom chiến lược',
    type: ContentCategory.plane,
    description: PlaneContent().Mig17BomberPlane,
    manufacturer: 'Liên Xô',
    image:
        'lib/core/resources/images/content_images/plane_images/mig17bomPlane.jpg',
    contentImg: [
      'lib/core/resources/images/content_images/plane_images/inner_images/mig17bom.jpg'
    ],
  ),
];
