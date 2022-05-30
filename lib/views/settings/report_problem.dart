import 'package:flutter/material.dart';

class ReportProblemView extends StatefulWidget {
  const ReportProblemView({Key? key}) : super(key: key);

  @override
  _ReportProblemViewState createState() => _ReportProblemViewState();
}

class _ReportProblemViewState extends State<ReportProblemView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Report a problem"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                const Icon(
                  Icons.report,
                  size: 80,
                ),
                const SizedBox(height: 35.0),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: const Text('Problem subject'),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.89,
                  child: TextFormField(
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Details cannot be empty!";
                    //   } else if (value.length < 15) {
                    //     return "Detials cannot be less than 15 characters!";
                    //   } else if (value.substring(0, 1) == " ") {
                    //     return "Empty spaces in start not allowed!";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      hintText: "Describe your problem in details",
                      hintStyle: Theme.of(context).textTheme.caption,
                      fillColor: Colors.grey[200],
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      // errorBorder: const OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.red),
                      // ),
                      // focusedErrorBorder: const OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.red),
                      // ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: MaterialButton(
                    color: Colors.black,
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,   
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
