import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:example/core.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    var appBarColor = Theme.of(context).primaryColor;
    if (AuthService.isVendor) {
      appBarColor = Colors.orange;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        titleTextStyle: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 36.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: TextField(
                      style: TextStyle(
                        color: CurrentTheme.textColor,
                        fontSize: 12.0,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 8.0),
                        hintText: "Find services, food or places",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => controller.scanQrCode(),
                icon: const Icon(
                  MdiIcons.qrcode,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: CurrentTheme.cardColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 60.0,
                        width: 4.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => controller.updateIndex(0),
                              child: Container(
                                height: 12.0,
                                width: 3.0,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(
                                      controller.selectedIndex == 0
                                          ? 1.0
                                          : 0.4),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            InkWell(
                              onTap: () => controller.updateIndex(1),
                              child: Container(
                                height: 12.0,
                                width: 3.0,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(
                                      controller.selectedIndex == 1
                                          ? 1.0
                                          : 0.4),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      StreamBuilder<DocumentSnapshot<Object?>>(
                        stream: userCollection.snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) return const Text("Error");
                          if (!snapshot.hasData) return const Text("No Data");

                          Map<String, dynamic> item =
                              (snapshot.data!.data() as Map<String, dynamic>);
                          item["id"] = snapshot.data!.id;

                          List menuList = [
                            {
                              "icon": Icons.wallet,
                              "color": CurrentTheme.buttonColor,
                              "header": "Balance",
                              "balance": "Rp${item["balance"] ?? 0}",
                              "info": "Tap for history",
                            },
                            {
                              "icon": Icons.star,
                              "color": CurrentTheme.mainColor,
                              "header": "Point",
                              "balance": "${item["point"] ?? 0}",
                              "info": "Tap for history",
                            },
                          ];
                          return SizedBox(
                            width: Get.width / 2.6,
                            height: 80.0,
                            child: Scrollbar(
                              thickness: 0.0,
                              child: ListView.builder(
                                controller: controller.scrollController,
                                itemCount: 2,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var item = menuList[index];
                                  return LayoutBuilder(
                                      builder: (context, constraint) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            controller.selectedIndex == index
                                                ? 0.0
                                                : 6.0,
                                      ),
                                      margin: EdgeInsets.only(
                                        bottom: index == 1 ? 8.0 : 0.0,
                                      ),
                                      child: Card(
                                        color: Colors.white.withOpacity(
                                            controller.selectedIndex == index
                                                ? 1.0
                                                : 0.6),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                            horizontal: 8.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    item["icon"],
                                                    size: 16.0,
                                                    color: item["color"],
                                                  ),
                                                  const SizedBox(
                                                    width: 2.0,
                                                  ),
                                                  Text(
                                                    item["header"],
                                                    style: GoogleFonts.amiko(
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                "${item["balance"]}",
                                                style: const TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                item["info"],
                                                style: const TextStyle(
                                                  fontSize: 10.0,
                                                  color: CurrentTheme.mainColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.payments,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "Pay",
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.add_box,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "Topup",
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.rocket,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "Explore",
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              if (AuthService.isVendor) ...[
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Orders",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "4,200",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "+36%",
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.list,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Customers",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "1,240",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "+25%",
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.people,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Get.to(const PosView()),
                        child: Column(
                          children: const [
                            Icon(
                              MdiIcons.pointOfSale,
                              size: 40.0,
                              color: CurrentTheme.buttonColor,
                            ),
                            Text(
                              "POS",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: CurrentTheme.buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => Get.to(const ProductListView()),
                        child: Column(
                          children: const [
                            Icon(
                              MdiIcons.bowlMix,
                              size: 40.0,
                              color: CurrentTheme.buttonColor,
                            ),
                            Text(
                              "Product",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: CurrentTheme.buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => Get.to(const CategoryListView()),
                        child: Column(
                          children: const [
                            Icon(
                              MdiIcons.viewList,
                              size: 40.0,
                              color: CurrentTheme.buttonColor,
                            ),
                            Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: CurrentTheme.buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var qrCode = await showQrcodeScanner();
                          print("qrCode: $qrCode");
                        },
                        child: Column(
                          children: const [
                            Icon(
                              MdiIcons.qrcode,
                              size: 40.0,
                              color: CurrentTheme.buttonColor,
                            ),
                            Text(
                              "Scan QrCode",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: CurrentTheme.buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              if (AuthService.isMember) ...[
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Orders",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "1,320",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "+36%",
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.list,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Vocuhers",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "1,240",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "+25%",
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.discount,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
