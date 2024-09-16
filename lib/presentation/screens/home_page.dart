import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent / 2);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: const Icon(
          Icons.menu,
          size: 30,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.notification_add,
              size: 30,
            ),
          )
        ],
        title: Container(
          height: 50,
          decoration: BoxDecoration(
              color: const Color.fromARGB(187, 213, 210, 210),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                "Search here",
                style: TextStyle(
                    color: const Color.fromARGB(181, 0, 0, 0), fontSize: 14),
              ),
              const SizedBox(
                width: 45,
              ),
              const Icon(Icons.search)
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _offercontainer(),
                  const SizedBox(
                    width: 5,
                  ),
                  _offercontainer(),
                  const SizedBox(
                    width: 4,
                  ),
                  _offercontainer()
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color.fromARGB(255, 42, 171, 207),
                    Color.fromARGB(255, 87, 79, 172),
                  ],
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("KYC Pending",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text("You need to provide the required",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Color.fromRGBO(255, 255, 255, 0.838),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 2,
                  ),
                  Text("documents for your account activation.",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Color.fromRGBO(255, 255, 255, 0.838),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(" Click Here",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.925),
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _roundedwidget(Icons.phone_android_outlined,
                          const Color.fromARGB(200, 182, 65, 202)),
                      _roundedwidget(Icons.laptop,
                          const Color.fromARGB(199, 65, 172, 202)),
                      _roundedwidget(Icons.camera_alt,
                          const Color.fromARGB(199, 202, 163, 65)),
                      _roundedwidget(Icons.lightbulb_outline_sharp,
                          const Color.fromARGB(199, 202, 65, 65)),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Mobile",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Laptop",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "LED",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              decoration: const BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color.fromARGB(255, 42, 171, 207),
                    Color.fromARGB(255, 87, 79, 172),
                  ],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EXCLUSIVE FOR YOU",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 30,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          _detailedmobile(),
                          const SizedBox(
                            width: 10,
                          ),
                          _detailedmobile(),
                          const SizedBox(
                            width: 10,
                          ),
                          _detailedmobile(),
                          const SizedBox(
                            width: 10,
                          ),
                          _detailedmobile(),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _offercontainer() {
    return Stack(
      children: [
        Container(
          height: 230,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 74, 37, 204),
                Color.fromARGB(255, 172, 79, 80),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 26, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("VIVO V_15_pro",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Color.fromRGBO(255, 255, 255, 0.87),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const Text("48 mp for everyone !",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Color.fromRGBO(255, 255, 255, 0.838),
                        fontSize: 10,
                        fontWeight: FontWeight.w600)),
                const Text("20M units",
                    style: TextStyle(
                        letterSpacing: 0,
                        color: Color.fromRGBO(48, 192, 228, 0.929),
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                const Text("of vivo v_15 series sold globally",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                        fontSize: 10,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 10,
                ),
                const Text("Now on no cost emi !",
                    style: TextStyle(
                        color: Color.fromRGBO(48, 192, 228, 0.929),
                        fontSize: 12,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
                const Text(" from ₹ 10999",
                    style: TextStyle(
                        color: Color.fromRGBO(48, 192, 228, 0.929),
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text("Buy Now",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.933),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 190,
          child: Container(
              height: 170,
              width: 140,
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                      image: AssetImage("assets/images/mobile1.png"),
                      fit: BoxFit.fill))),
        )
      ],
    );
  }

  Widget _roundedwidget(IconData icon, Color color) {
    return Container(
      width: 70, 
      height: 70, 
      decoration: BoxDecoration(
        color: color, 
        shape: BoxShape.circle, 
      ),
      child: Center(
        child: Icon(
          icon, 
          size: 40, 
          color: Colors.white, 
        ),
      ),
    );
  }

  Widget _detailedmobile() {
    return Container(
      height: 400,
      width: 250,
      decoration: BoxDecoration(
        color: const Color.fromARGB(218, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 35, top: 10),
                child: Container(
                  height: 25,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: const Center(child: Text("32% off")),
                ),
              ),
            ],
          ),
          Container(
            height: 220,
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/mobile1.png"))),
          ),
          const SizedBox(
            height: 50,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: const Text(" ₹ 10999",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Color.fromRGBO(11, 11, 11, 0.835),
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: const Text("VIVO V_15_PRO(IRON,64 GB)",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Color.fromRGBO(11, 11, 11, 0.835),
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
