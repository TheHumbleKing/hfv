import 'package:flutter/material.dart';
import 'package:hfv_app/views/settings/report_problem.dart';
// import 'package:hfv_app/views/settings/report_problem.dart';

class ARView extends StatefulWidget {
  const ARView({Key? key}) : super(key: key);

  @override
  _ARViewState createState() => _ARViewState();
}

class _ARViewState extends State<ARView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Customer'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ReportProblemView(),
              ),
            ),
            icon: const Icon(
              Icons.report,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.5,
              child: MaterialButton(
                color: Colors.black,
                onPressed: () {},
                child: const Text(
                  "Chat",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.5,
              child: MaterialButton(
                color: Colors.black,
                onPressed: () {},
                child: const Text(
                  "Text Image",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Column(
                children: const [
                  Icon(
                    Icons.camera_alt,
                    size: 50,
                  ),
                  Text(
                    'View In AR',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}