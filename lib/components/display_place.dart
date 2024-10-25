import 'package:airbnb_app_ui/Provider/favorite_provider.dart';
import 'package:airbnb_app_ui/view/place_detail_screen.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DisplayPlace extends StatefulWidget {
  const DisplayPlace({super.key});

  @override
  State<DisplayPlace> createState() => _DisplayPlaceState();
}

class _DisplayPlaceState extends State<DisplayPlace> {
  final CollectionReference placeCollection = FirebaseFirestore.instance.collection("myAppCpollection");

  Widget _buildSkeletonItem(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image container skeleton
            Container(
              height: 375,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(height: 10),
            // Title and rating skeleton
            Row(
              children: [
                Container(
                  width: 200,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Host info skeleton
            Container(
              width: 150,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 8),
            // Date skeleton
            Container(
              width: 100,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 8),
            // Price skeleton
            Container(
              width: 80,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3, // Show 3 skeleton items while loading
      shrinkWrap: true,
      itemBuilder: (context, index) => _buildSkeletonItem(context),
    );
  }

  Widget _buildImageShimmer(double height, double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = FavoriteProvider.of(context);

    return StreamBuilder(
      stream: placeCollection.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 60, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Error loading data\n${streamSnapshot.error}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {}); // Refresh the stream
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return _buildSkeletonList();
        }

        if (!streamSnapshot.hasData || streamSnapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No places found'),
          );
        }

        // Your existing ListView.builder for actual data
        return ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: streamSnapshot.data!.docs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final DocumentSnapshot place = streamSnapshot.data!.docs[index];
            Map<String, dynamic> placeData = place.data() as Map<String, dynamic>;
            List<String> imageUrls = [];
            try {
              if (placeData.containsKey('imageUrls')) {
                imageUrls = List<String>.from(placeData['imageUrls']);
              }
            } catch (e) {
              print('Error getting images: $e');
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlaceDetailScreen(place: place),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            height: 375,
                            width: double.infinity,
                            child: imageUrls.isNotEmpty
                                ? AnotherCarousel(
                                    images: imageUrls.map((url) => NetworkImage(url)).toList(),
                                    dotSize: 6,
                                    indicatorBgPadding: 5,
                                    dotBgColor: Colors.transparent,
                                  )
                                : _buildImageShimmer(375, double.infinity),
                          ),
                        ),
                        // Your existing positioned widgets...
                        Positioned(
                          top: 20,
                          left: 15,
                          right: 15,
                          child: Row(
                            children: [
                              SizedBox(width: size.width * 0.03),
                              const Spacer(),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  const Icon(
                                    Icons.favorite_outline_rounded,
                                    size: 34,
                                    color: Colors.white,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      provider.toggleFavorite(place);
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      size: 30,
                                      color: provider.isExist(place) ? Colors.red : Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        vendorProfile(placeData),
                      ],
                    ),
                    // Rest of your content...
                    SizedBox(height: size.height * 0.01),
                    Row(
                      children: [
                        Text(
                          placeData['address'] ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.star),
                        const SizedBox(width: 5),
                        Text(
                          (placeData['rating'] ?? '').toString(),
                        ),
                      ],
                    ),
                    Text(
                      "Book with ${placeData['vendor'] ?? ''} . ${placeData['vendorProfession'] ?? ''}",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16.5,
                      ),
                    ),
                    Text(
                      placeData['date'] ?? '',
                      style: const TextStyle(
                        fontSize: 16.5,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: size.height * 0.007),
                    RichText(
                      text: TextSpan(
                        text: "\$${placeData['price'] ?? ''}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        children: const [
                          TextSpan(
                            text: " per hour",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget vendorProfile(Map<String, dynamic> placeData) {
    return Positioned(
      bottom: 11,
      left: 10,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Image.asset(
              "assets/images/book_cover.png",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              backgroundImage: placeData['vendorProfile'] != null && placeData['vendorProfile'].toString().isNotEmpty ? NetworkImage(placeData['vendorProfile']) : null,
              child: placeData['vendorProfile'] == null || placeData['vendorProfile'].toString().isEmpty ? const Icon(Icons.person, color: Colors.grey) : null,
            ),
          ),
        ],
      ),
    );
  }
}
