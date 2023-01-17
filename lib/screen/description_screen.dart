import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen(
      {super.key,
      this.image,
      this.overview,
      this.voteAverage,
      this.releaseDate,
      this.voteCount,
      this.popularity,
      this.title,
      });
//  final Function? searchMovies;
  final String? image;
  final String? overview;
  final String? voteAverage;
  final String? releaseDate;
  final String? voteCount;
  final String? popularity;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        clipBehavior: Clip.none,
        // stackFit: StackFit.expand,
        children: [
          Image.network(
            '$image',
            height: MediaQuery.of(context).size.height / 2 + 60,
            fit: BoxFit.cover,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2 + 60,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 + 50,
            width: MediaQuery.of(context).size.width,
            left: 10, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                
                const SizedBox(
                  height: 10,
                ),
               const Text(
                  'Overview',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: Text(
                          '$overview',   
                          softWrap: true,
                          maxLines: 9,
                          // minLines: 5,
                          // textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          // overflow: ,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            
                            
                            
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Vote Average: $voteAverage',
                  style:const  TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Vote Count: $voteCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Popularity: $popularity',
                  style: const  TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children:[
                    for (var i = 0; i < 5; i++)
                      if (i < int.parse(4.toString()))
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      else
                        const Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                  ]
                )
              ],
            ),
          ),
    
        ],
      ),
    );
  }
}
