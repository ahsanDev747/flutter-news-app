import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, required this.imageUrl,
    required this.categoryName}) : super(key: key);

  final String imageUrl;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryScreen(
                newsCategory: categoryName.toLowerCase())
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60, fit: BoxFit.cover,),
            ),
            Container(
              width: 120,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(categoryName, style: const TextStyle(color: Colors.white,
              fontSize: 14, fontWeight: FontWeight.w500),),
            )
          ],
        ),
      ),
    );
  }
}
