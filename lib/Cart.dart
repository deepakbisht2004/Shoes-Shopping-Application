import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shopping_app/cart_provider.dart';


  class CartItem extends StatefulWidget {
      const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
    @override
    Widget build(BuildContext context) {
      final cart =  Provider.of<Cartprovider>(context).cart;
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow,
            title: Center(
                child: Text("Cart")),
          ),
          body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context,Index) {
                final cartitem = cart[Index];

                return ListTile(
                    leading: CircleAvatar(
                      radius: 45,
                    backgroundImage: AssetImage(cartitem['imageUrl'] as String),
                  ),
                  trailing: InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(

                          title: Text("Delete Product"),
                          content: Text("Are You Sure You want to Delete from Cart",
                            style: TextStyle(fontSize: 20),),
                          scrollable: false,
                          actions: [

                          TextButton(onPressed: (){
                            Provider.of<Cartprovider>(context,listen: false).Remove(cartitem);
                            Navigator.of(context).pop();
                          }, child:
                          Text("yes",style: TextStyle(fontSize: 20,color: Colors.blue,),
                          ),
                          ),
                            TextButton(onPressed: (){
                              Navigator.of(context).pop();
                              },
                                child: Text("no", style: TextStyle(fontSize: 20,color: Colors.red),)
                           ),
                          ],
                        );
                      });
                    },
                    child: Icon(
                        Icons.delete),
                  ),
                  title: Text(
                    cartitem['title'] as String,
                    style: Theme.of(context).textTheme.bodySmall,


                  ),

                  subtitle: Text(

                    cartitem['sizes'].toString()
                  ),
                );

              },
            ),





      );
    }
}
