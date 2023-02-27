import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/article_screen.dart';

class BlogTile extends StatelessWidget {
  const BlogTile({Key? key, required this.imageUrl,
  required this.title, required this.desc, required this.url}) : super(key: key);

  final String imageUrl, title, desc, url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleScreen(url: url)
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),
                  bottomLeft:  Radius.circular(6))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,),
              ),
              const SizedBox(height: 12,),
              Text(
                title,
                maxLines: 2,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),),
              const SizedBox(height: 4,),
              Text(
                  desc,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.black54, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
