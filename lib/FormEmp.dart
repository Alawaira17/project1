
// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project1/Service/api_serives.dart';
import 'Employee List.dart';



class Employee extends StatefulWidget {
  const Employee({super.key, required String title});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {


  final _formKey = GlobalKey<FormState>();

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();


  TextEditingController dateInputController = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController dateGradution = TextEditingController();




  @override
  void initState() {
    date.text = " ";
    dateGradution.text = " ";
    dateInputController.text = " ";
    super.initState();
  }
  int suggestionsCount = 2;
  final focus = FocusNode();


  @override
  void dispose() {

    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(" Add Employee Form", style: TextStyle(color: Colors.white)),
        elevation: 10.0,
        backgroundColor:Colors.blue,
        //elevation: 10.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),

        leading:  IconButton(
          icon:Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
           Navigator.push(context,
          MaterialPageRoute(builder: (context) => EmployeeList(text: null, )),);},
        ),

        ),



      body: Form(
        key : _formKey,
        child: SingleChildScrollView(
          //  padding: const EdgeInsets.all(10),
          child: Column(
              children: <Widget>[
                SizedBox(height: 60,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal:30.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter ID';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Employee Id :',
                      hintStyle: TextStyle( color:  Color.fromARGB(255, 0, 138, 158),),
                      filled: true,

                        //: Icon(Icons.person),
                      ),
                    ),
                  ),



                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    validator: (value) {
                      final jobTitle = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Employee Name';
                      }
                      if (jobTitle.hasMatch(value)){
                        return 'Please Enter Employee Name without number and character :';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(

                      hintText: 'Empolyee Name:',
                      hintStyle: TextStyle( color:  Color.fromARGB(255, 0, 138, 158),),
                      filled: true,
                    ),
                  ),
                ),


                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      //  icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Graduation Date" //label text of field
                    ),
                    controller: dateGradution,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050));

                      if (pickedDate != null) {
                        //   dateInputController.text =pickedDate.toString();
                        print(pickedDate);
                        //pickedDate output format => 2021-03-10 00:00:00.000

                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          dateGradution.text = formattedDate;
                        });
                      }else{
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
                  //  width: 140,
                  //  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //  margin: const EdgeInsets.only(top: 2.0),







                const SizedBox(height: 20,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const EmployeeList(text: null,)),
                                    (Route<dynamic> route) => false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')
                              ),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 0, 138, 158),),
                        child: const Text(
                          'Save',
                          style: TextStyle(fontSize: 24, color: Colors.white,),
                        ),
                      ),


                      ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 0, 138, 158),),
                        child: const Text("Cancel",
                          style: TextStyle(fontSize: 24, color: Colors.white,),
                        ),
                      ),

                    ],
                ),
              ]
          ),
        ),
      ),
    );
  }
}




