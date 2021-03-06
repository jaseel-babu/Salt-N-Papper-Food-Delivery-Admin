import 'package:admin_side/model/sellermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  List<SellerModel> dataFromFirestore(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return SellerModel(
        address: (e.data() as dynamic)["address"].toString(),
        earnigs: (e.data() as dynamic)["earnigs"].toString(),
        lat: (e.data() as dynamic)["lat"].toString(),
        lng: (e.data() as dynamic)["lng"].toString(),
        phone: (e.data() as dynamic)["phone"].toString(),
        sellerName: (e.data() as dynamic)["sellerName"].toString(),
        sellerUid: (e.data() as dynamic)["sellerUID"].toString(),
        shopName: (e.data() as dynamic)["shopName"].toString(),
        status: (e.data() as dynamic)["status"].toString(),
      );
    }).toList();
  }

  Stream getData() {
    return firebaseFirestore
        .collection("sellers")
        .snapshots()
        .map(dataFromFirestore);
  }

  deleteSellerFromFirebase(String uid) {
    print(uid);
    return firebaseFirestore.collection("sellers").doc(uid).delete();
  }
}
