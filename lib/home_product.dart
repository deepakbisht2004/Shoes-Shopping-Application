import 'package:flutter/material.dart  ';
import 'package:shoes_shopping_app/dumydata.dart';
import 'productview.dart';
import 'Single_productDetail.dart';


class homeproduct extends StatefulWidget {
  const homeproduct({super.key});
  @override
  State<homeproduct> createState() => _homeproductState();
}

class _homeproductState extends State<homeproduct> {
  final  List<String> filters = const ['ALL','Addidas','Nike','Beta'];
  late String SelectedFilter ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   SelectedFilter= filters[0];
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "shoes\nshopping",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                    ),
                    hintText: 'search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 120,

            child: ListView.builder(
                padding: EdgeInsets.all(20.0),
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder:(context,index){
                  final filter  = filters[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          SelectedFilter = filter;
                        });

                      },
                      child: Chip(
                          backgroundColor:SelectedFilter == filter
                              ?Theme.of(context).colorScheme.primary
                              :const Color.fromRGBO(245, 247, 249, 1),
                          side: const BorderSide(
                            color:const Color.fromRGBO(245, 247, 249, 1),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(40)
                          ),
                          label: Text(filter)
                      ),
                    ),
                  );

                } ),
          ),

          Expanded(

            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,Index){
                  final product = products[Index];

                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (Context){
                        return SingleView(product: product,);

                      }));

                    },

                    child: ProductView(title: product["title"]as String,
                      BackgroundColor: Index.isEven?
                      Color.fromRGBO  (255,245,212,1):const Color.fromRGBO(245, 247, 249, 1),
                      image: product['imageUrl']as String,
                      price: product['price']as double,
                    ),
                  );

                }),
          )

        ],


      ),

    );

  }
}
