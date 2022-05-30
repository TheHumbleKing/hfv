import 'package:flutter/material.dart';

class EditVendor extends StatefulWidget {
  static const id = "/EditVendor";
  const EditVendor({Key? key}) : super(key: key);

  @override
  State<EditVendor> createState() => _EditVendorState();
}

class _EditVendorState extends State<EditVendor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 60,
                        margin: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/must.jpg"),
                              fit: BoxFit.fill),
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Text(
                        "Vendor Profile",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // InkWell(
                      //   onTap: () {},
                      //   // ignore: prefer_const_constructors
                      //   child: Icon(
                      //     Icons.edit,
                      //     color: Colors.black,
                      //     size: 24.0,
                      //     semanticLabel:
                      //         'Text to announce in accessibility modes',
                      //   ),
                      // ),
                      InkWell(
                        onTap: () {},
                        // ignore: prefer_const_constructors
                        child: Icon(
                          Icons.settings,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 1),
            const Divider(
              color: Colors.black,
              height: 10,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your details below',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: const Text('Edit First Name'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: const Text('Edit Last Name'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: const Text('Edit Email Address'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: const Text('Edit Password'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            //
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.45,
              child: MaterialButton(
                color: Colors.black,
                onPressed: () {},
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
