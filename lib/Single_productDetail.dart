

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shopping_app/cart_provider.dart';



class SingleView extends StatefulWidget {
  final Map<String,Object>product;
  const SingleView({super.key,
    required this.product,
  }
  );

  @override
  State<SingleView> createState() => _SingleViewState();
}

class _SingleViewState extends State<SingleView> {


   int selectedSize  = 0;
   @override
  Widget build(BuildContext context) {

    return    Scaffold(
     appBar: AppBar(
       title:const Center(child: const Text("Details")),
     ),
      body: Column(
        children: [
          Center(
            child: Text(widget.product['title'] as String,
              style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,)
            ),
          ),
           const Spacer(),
           Padding(
             padding: const EdgeInsets.all(12.0),
             child: Image(image: AssetImage(widget.product['imageUrl'] as String) ),
           ),
           const Spacer(flex: 2),
          Container(

            padding: EdgeInsets.all(20.0),
            height: 200,
           width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(233, 230, 221,1)
            ),
            child: Column(
              children: [
                Text(
                    '\$${widget.product['price']} ',style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 34
                ),),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length ,
                      itemBuilder: (Context,index) {
                        final size = (widget.product['sizes'] as List<
                            int>)[index];

                        return Padding(
                          padding: const EdgeInsets.all(8),

                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                                backgroundColor: selectedSize == size
                                    ? Colors.yellow
                                    : null,
                                label: Text(size.toString())),
                          ),
                        );
                      }

                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){

                    if(selectedSize!=0){
                      Provider.of<Cartprovider>(context,listen: false).additem(
                          {


                            'id': widget.product['title'] as String,
                            'title': widget.product['title'] as String,
                            'price': widget.product['price']as double,
                            'imageUrl': widget.product['imageUrl']as String,
                            'company': widget.product['company']as String,
                            'sizes': selectedSize,
                          }



                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("item Added succesfully")));
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please select the shoe size" )));
                    }


                     },

                      // This is the function that will be executed when the button is pressed.
                      // You can add your logic or functionality here
                    style: ButtonStyle(

                      elevation: MaterialStatePropertyAll(10.0),
                      backgroundColor:MaterialStatePropertyAll(Colors.yellow)
                    ),
                    child: Text("Add to Cart",

                        style: TextStyle(
                            color: Colors.black ,fontSize: 20,fontWeight: FontWeight.bold
                        ),
                      ),


                  ),
                ),

              ],

            ),

          )
      ],),

    );
  }
}
