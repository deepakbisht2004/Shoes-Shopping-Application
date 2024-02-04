import 'package:flutter/material.dart';


class ProductView extends StatelessWidget {
  final String title;
  final double  price;
  final String image;
  final Color BackgroundColor;
  const ProductView({super.key,
  required this.title, 
    required this.image,
    required this.price,
     required this.BackgroundColor,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color: BackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ) ,
      padding: EdgeInsets.symmetric(horizontal:10 ),
       margin:EdgeInsets.all(16.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: Theme.of(context).textTheme.titleMedium,),
          Text('\$$price',style: Theme.of(context).textTheme.bodySmall,),
          Center(
            child: Image(
              height: 175,
                image: AssetImage(image)
            ),
          )
        ],
      )
    );
  }
}
