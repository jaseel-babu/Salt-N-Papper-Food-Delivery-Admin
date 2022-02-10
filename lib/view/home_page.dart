import 'package:admin_side/controller/apiservices.dart';
import 'package:admin_side/model/sellermodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: "Seller",
              ),
              Tab(
                text: "Delivery Boys",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StreamBuilder(
              stream: apiServices.getData(),
              builder: (context, snapshot) {
                List<SellerModel> data = [];
                if (snapshot.hasData) {
                  data = snapshot.data as List<SellerModel>;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data[index].sellerName!),
                        trailing: IconButton(
                          icon:const Icon(Icons.delete),
                          onPressed: () {
                            apiServices.deleteSellerFromFirebase(
                              data[index].sellerUid!,
                            );
                          },
                        ),
                      );
                    },
                  );
                }
                return const Text('false');
              },
            ),
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
