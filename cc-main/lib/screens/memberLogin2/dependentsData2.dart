import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:provider/provider.dart';
import '../../widgets/multi3.dart';
import 'approval2.dart';



class DependentsData2 extends StatelessWidget {
  String? hsptl_name;
  DependentsData2({super.key,required this.hsptl_name});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Dependents"),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ]),
          body: ListView.builder(
            itemCount: Provider11.data2.length,
            itemBuilder: (context,index){
              return Padding(
                padding:EdgeInsets.only(top: 5.h,right: 10.w,left: 10.w),
                child: Neumorphic(
                
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(height: 5.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Provider11.data2.values.elementAt(index)['relation'].toString()=='SELF'?Image.asset("assets/images/self.png",height: 20.h,width: 20.w,):Provider11.data2.values.elementAt(index)['relation'].toString()=='SPOUSE'?Image.asset("assets/images/spouse.png",height: 20.h,width: 20.w,):Provider11.data2.values.elementAt(index)['relation'].toString()=='SON'?Image.asset("assets/images/son.png",height: 20.h,width: 20.w,):Image.asset("assets/images/daughter.png",height: 20.h,width: 20.w,),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle: Provider11.data2.values.elementAt(index)['relation'], weight: FontWeight.bold, size: 16),
                          ],
                        ),
                        Divider(color: Colors.white,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Name", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle: Provider11.data2.values.elementAt(index)['name'].toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "CNIC", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle: Provider11.data2.values.elementAt(index)['cnic'].toString()==''?"-------------":Provider11.data2.values.elementAt(index)['cnic'].toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                             NeumorphicButton(
              
                  margin: EdgeInsets.only(top: 12),
                  onPressed: () {
                    
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Approval2(
                                      age: Provider11.data2.values.elementAt(index)['age'].toString(), 
                                      cnic: Provider11.data2.values.elementAt(index)['cnic'].toString(), 
                                      dn: "1", 
                                      dob: Provider11.data2.values.elementAt(index)['dob'].toString(),
                                      ed: Provider11.data2.values.elementAt(index)['effective_date'].toString(), 
                                      gen: Provider11.data2.values.elementAt(index)['gender'].toString(),
                                      hc: Provider11.data2.values.elementAt(index)['healthcode'].toString(), 
                                      idate: Provider11.data2.values.elementAt(index)['issue_date'].toString(), 
                                      name:Provider11.data2.values.elementAt(index)['name'].toString(),
                                      pc: Provider11.data2.values.elementAt(index)['plancode'].toString(),
                                      relation:Provider11.data2.values.elementAt(index)['relation'].toString(), 
                                      empName: Provider11.data2['self']['name'], hsptl_name: hsptl_name,
                                      )));
                  },
                  style: NeumorphicStyle(
                    shadowLightColor: Colors.blue,
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                    //border: NeumorphicBorder()
                  ),
                  padding:  EdgeInsets.all(6.0),
                  child: Multi3(color: Color(0xff2b578e), subtitle: "Proceed", weight: FontWeight.bold, size: 12)
                  ),
                          ],
                        ),
                        SizedBox(height: 5.h,)
                      ],
                    ),
                  ),
                ),
              
                
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  // shadowDarkColor: Color.fromARGB(255, 0, 38, 69),
                  color: Color(0xff2b578e),
                  // shadowLightColor: Color.fromARGB(255, 0, 38, 69),
                  lightSource: LightSource.bottomRight,
                  depth: -20,
                  disableDepth: false,
                  border: NeumorphicBorder(
                  color: Color(0x33000000),
                  width: 0.1,
                  
                )),
                          ),
              );
            }
            )
    );
  }
}