import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../widgets/square_head.dart';
import '../appointmentBook.dart/appointmentHsptlDepData.dart';





class CalendarBooking extends StatefulWidget {
  List<String> enabledWeekdays;
  String? hsptlname;
  String? deptname;
  String? drName;

  CalendarBooking({super.key, 
  required this.enabledWeekdays,
  required this.deptname,
  required this.drName,

  required this.hsptlname
  });
 
  @override

  _CalendarBookingState createState() => _CalendarBookingState();
}

class _CalendarBookingState extends State<CalendarBooking> {
  DateTime? _selectedDate;
  DateTime? _focusedDay;
  DateTime? _firstDay;
  DateTime? _lastDay;


  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _focusedDay = DateTime.now();
    _firstDay = DateTime.now();
    _lastDay = DateTime.now().add(Duration(days: 365));
  }

  bool _isDateEnabled(DateTime day) {
    String weekday = _getWeekday(day);
    return widget.enabledWeekdays.contains(weekday);
  }

  String _getWeekday(DateTime day) {
    switch (day.weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate = selectedDay;
      _focusedDay = focusedDay;
      print(selectedDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title: Text("Available Days"),
             leading: GestureDetector(
            child: Icon( Icons.arrow_back_ios, color: Colors.white,  ),
               onTap: () {
                 Navigator.pop(context);
                } ,
        ) ,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search,color: Colors.white,),
            
            onPressed: () {},
          ), ]
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TableCalendar(
            firstDay: _firstDay!,
            lastDay: _lastDay!,
            focusedDay: _focusedDay!,
            selectedDayPredicate: (day) => _selectedDate == day,
            enabledDayPredicate: _isDateEnabled,
            onDaySelected: _onDaySelected,
          ),
          SizedBox(height: 20.h,),
           Container(
                                    height: 50,
                                    width: double.infinity,
                                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child:  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        // backgroundColor: Color(0xff164584),
                                        backgroundColor: Color(0xff174584),
                                          shape: RoundedRectangleBorder(                       
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                      child:  TitleHeading(head: 'Book Appointment',),
                                      onPressed: () {

                                        Navigator.push(context,
                                          MaterialPageRoute(builder:
                                            (context) => 
                                            HsptlDependentsDataAppointment(
                                              hsptlName: widget.hsptlname, 
                                              date_of_appointment:_selectedDate.toString(), 
                                              dptName: widget.deptname, 
                                              drName: widget.drName
                                              )
                                            )
                                          );
                                      },
                                    )
                                ),
        ],
      ),
    );
  }
}
