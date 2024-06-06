class GalleryResponse {
  final String status;
  final GalleryData data;
  final String message;

  GalleryResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GalleryResponse.fromJson(Map<String, dynamic> json) {
    return GalleryResponse(
      status: json['status'],
      data: GalleryData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class GalleryData {
  final List<dynamic> images;

  GalleryData({
    required this.images,
  });

  factory GalleryData.fromJson(Map<String, dynamic> json) {
    return GalleryData(
      images: json['images'],
    );
  }
}