  import 'dart:io';

  import 'package:flutter/material.dart';

  Widget my_imagProfileStack(
      {double sizeImage = 100,
      double sizepositioned = 50,
      double positioned_bottom,
      double positioned_right,
      double positioned_left,
      double positioned_top,
      Color colorBorder: Colors.blue,
      Color colorpositioned: Colors.orangeAccent,
      String imageURl = '',
      Widget widget,
      GestureTapCallback onTapPositioned}) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        //------- صورة المستخدم
        Container(
          height: sizeImage,
          width: sizeImage,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage("$imageURl")),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: colorBorder, width: 2)),
        ),

        //------------ زر التقييم
        Positioned(
          bottom: positioned_bottom,
          right: positioned_right,
          top: positioned_top,
          left: positioned_left,
          child: GestureDetector(
            onTap: onTapPositioned,
            child: Container(
              height: sizepositioned,
              width: sizepositioned,
              decoration: BoxDecoration(
                  color: colorpositioned,
                  borderRadius: BorderRadius.circular(sizepositioned / 2)),
              child: widget,
            ),
          ),
        )
      ],
    );
  }

  //===my_StackPost=============================================
  Widget my_StackPost(
    BuildContext context, {
    String imagURL = "",
    String textPost = "عنوان المقال يمكن ان يستبدل",
    double height,
    double width,
    int withAlpha = 150,
    double radius = 0,
    Color color: Colors.black,
    Color colorText: Colors.white,
  }) {
    return Stack(
      children: <Widget>[
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imagURL))),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: color.withAlpha(withAlpha),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(radius),
                      bottomRight: Radius.circular(radius))),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  textPost,
                  style: TextStyle(color: colorText),
                ),
              ),
            )),
      ],
    );
  }

  //===my_StackPost=============================================
  Widget my_StackSections(
    BuildContext context, {
    String title,
    String description,
    IconData icons,
    GestureTapCallback onTap,
  }) {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          child: InkWell(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 7.0),
              padding: EdgeInsets.only(left: 80.0),
              height: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                //                      boxShadow: [ BoxShadow(blurRadius: 2.0 , color: Colors.black)],
                gradient: LinearGradient(
                colors: [Color(0xFF270062), Color(0xFF760271)],

                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Colors.amberAccent),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: -45.0,
          child: Container(
            height: 110.0,
            width: 110.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(
                colors: [Color(0xFF270062), Color(0xFF760271)],
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset.centerRight,
              ),
              //                      boxShadow: [ BoxShadow(blurRadius: 7.0 , color: Colors.black)],
            ),
          ),
        ),
        Positioned(
          left: -38.0,
          child: Container(
            height: 95.0,
            width: 95.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(
                colors: [Color(0xFF270062), Color(0xFF760271)],
                begin: FractionalOffset.centerRight,
                end: FractionalOffset.centerLeft,
              ),
            ),
            child: Icon(
              icons,
              color: Colors.white,
              size: 40.0,
            ),
          ),
        ),
      ],
    );
  }




  //===appTextFieldMaterial=============================================
  Widget my_TextFieldMaterial(
      {String HintText: "HintText",
      TextEditingController controllers,
      double Radius: 0,
      double elevation: 3,
      IconData prefixIcon,
      double horizontal: 0,
      double vertical: 0,
      double prefixIconSize,
      double padding_inslide,
      bool obscureText: false,
      Color prefixIconColor,
      int maxLines,
      Color color,
      TextInputType TextInput,
      InputBorder border}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Material(
          color: color,
          borderRadius: BorderRadius.circular(Radius),
          elevation: elevation,
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: TextFormField(
              maxLines: maxLines,
              keyboardType: TextInput,
              controller: controllers,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: HintText,
                hintStyle: TextStyle(color: Colors.grey.shade400),
              ),
            ),
          )),
    );
  }

  //===Button=============================================
  Widget my_Button(
      {String textButton: "Text Button",
      double horizontal: 0,
      double vertical: 0,
      double radiusButton: 0,
      double elevation: 0,
      double heightButton: 50,
      double fontSize: 12,
      Color colorText,
      Color colorButton,
      VoidCallback onTap}) {
    textButton == null ? textButton == "App Button" : textButton;
    horizontal == null ? horizontal = 0.0 : horizontal;
    vertical == null ? vertical = 0.0 : vertical;
    radiusButton == null ? radiusButton = 0.0 : radiusButton;
    colorText == null ? colorText = Colors.white : colorText;
    colorButton == null ? colorButton = Colors.blue : colorButton;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: RaisedButton(
        color: colorButton,
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radiusButton))),
        onPressed: onTap,
        child: Container(
          height: heightButton,
          child: Center(
            child: Text(
              textButton,
              style: TextStyle(color: colorText, fontSize: fontSize),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  //===Button=============================================
  Widget my_ButtonIcon(
      {VoidCallback onPressed,
      double horizontal: 0,
      double vertical: 0,
      String textButton: "Text Button",
      double fontSize: 15,
      double radiusButton: 0,
      double elevation: 0,
      double widthBorderSide: 0,
      Color colorText: Colors.white,
      Color colorBorderSide: Colors.white,
      double heightButton: 50,
      Color colorButton: Colors.blue,
      Color colorIcons: Colors.white,
      IconData icon: Icons.add_alarm,
      String fontFamily}) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: RaisedButton.icon(
          color: colorButton,
          elevation: elevation,
          onPressed: onPressed,
          icon: Container(
              height: heightButton, child: Icon(icon, color: colorIcons)),
          label: Center(
              child: Text(
            textButton,
            style: TextStyle(fontSize: fontSize, fontFamily: fontFamily),
          )),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radiusButton)),
              side: BorderSide(color: colorBorderSide, width: widthBorderSide)),
          textColor: colorText,
        ));
  }

  //===FlatButton=============================================
  Widget my_FlatButton({
    String textButton: "Text Flat Button",
    double horizontal: 0,
    double vertical: 0,
    VoidCallback onPressed,
    double radiusButton: 1,
    double widthRadius: 1,
    double fontSize: 15,
    double heightButton: 50,
    Color colorText: Colors.blue,
    Color colorRadius: Colors.blue,
    Color splashColor: Colors.white,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Container(
        height: heightButton,
        child: FlatButton(
          onPressed: onPressed,
          child: Center(
              child: Text(
            textButton,
            style: TextStyle(
              color: colorText,
              fontSize: fontSize,
            ),
          )),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusButton),
              side: BorderSide(width: widthRadius, color: colorRadius)),
          splashColor: splashColor,
        ),
      ),
    );
  }

  //===FlatButton=============================================
  Widget my_FlatButtonIcon({
    Function onPressed,
    String textButton: "Flat Button Icon",
    IconData icon: Icons.settings,
    Color colorIcon: Colors.blueGrey,
    double sizeIcon: 25,
    double radiusButton: 0,
    double widthRadius: 1,
    Color colorRadius: Colors.blueGrey,
    Color colorText: Colors.blueGrey,
    double heightButton: 45,
    Color splashColor: Colors.white,
  }) {
    return Container(
      height: heightButton,
      child: FlatButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: colorIcon, size: sizeIcon),
        label: Text(
          textButton,
          style: TextStyle(color: colorText),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusButton),
            side: BorderSide(width: widthRadius, color: colorRadius)),
        splashColor: splashColor,
      ),
    );
  }

  //=== Image Circle account =============================================
  Widget my_ImageCircleAccount(
      {String imagURL: "",
      Color borderColor: Colors.blue,
      double borderWidth: 1,
      double borderRadius: 50,
      double width: 50,
      GestureTapCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: width,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width / 2),
          image: DecorationImage(image: NetworkImage(imagURL), fit: BoxFit.cover),
          border: Border.all(color: borderColor, width: borderWidth),
        ),
      ),
    );
  }

  Widget my_IconInContainer({
    Color color1,
    Color color2,
    Color colorIcon: Colors.black,
    GestureTapCallback onTap,
    double heightWidth = 50,
    double sizeIcone = 30,
    Widget widget,
  }) {
    double z = heightWidth - 10;
    double x = heightWidth - z;
    double valuePositioned = x / 2;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            height: heightWidth,
            width: heightWidth,
            decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.circular(heightWidth / 2)),
          ),
          Positioned(
            right: valuePositioned,
            top: valuePositioned,
            child: Container(
              height: z,
              width: z,
              decoration: BoxDecoration(
                color: color2,
                borderRadius: BorderRadius.circular(heightWidth / 2),
              ),
              child: widget,
            ),
          ),
        ],
      ),
    );
  }

  Widget my_ImageCircle({
    IconData icon: Icons.add,
    Color color1: Colors.red,
    Color color2: Colors.amberAccent,
    GestureTapCallback onTap,
    double heightWidth = 50,
    double Radius,
    String imageUrl = "",
  }) {
    double z = heightWidth - 13;
    double x = heightWidth - z;
    double valuePositioned = x / 2;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            height: heightWidth,
            width: heightWidth,
            decoration: BoxDecoration(
                color: color1,
                gradient: LinearGradient(
                  colors: [Color(0xFF270062), Color(0xFF760271)],
                ),
                borderRadius: BorderRadius.circular(Radius)),
          ),
          Positioned(
            right: valuePositioned,
            top: valuePositioned,
            child: Container(
              height: z,
              width: z,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(imageUrl)),
                  borderRadius: BorderRadius.circular(Radius)),
            ),
          ),
        ],
      ),
    );
  }

  //===showSnackBar=========================================
  // لتشغيل SnacBar يجب وضع هذا الكود في نفس  الكلاس
  //final scaffoldKey = GlobalKey<ScaffoldState>();
  //key: scaffoldKey,
  my_showSnackBar(
    String message,
    final scaffoldKey, {
    Color background: Colors.red,
  }) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 17.0),
      ),
      duration: Duration(seconds: 2), // هنا الفترة التي سوف تظهر فيها الرساله
      backgroundColor: background,
      //    action:  SnackBarAction(label: "", onPressed: (){}),
    ));
  }

  //===closeProgressDialog======================================
  // في حالة استعداء هذا الدالة سوف يتم اغلاق  صفحة Progress
  closeProgressDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget productTextField(
      {String textTitle,
      String textHint,
      double height,
      TextEditingController controller,
      TextInputType textType}) {
    textTitle == null ? textTitle = "Enter Title" : textTitle;
    textHint == null ? textHint = "Enter Hint" : textHint;
    height == null ? height = 50.0 : height;
    //height !=null
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textTitle,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            height: height,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                controller: controller,
                keyboardType: textType == null ? TextInputType.text : textType,
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: textHint),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget productDropDown(
      {String textTitle,
      String selectedItem,
      List<DropdownMenuItem<String>> dropDownItems,
      ValueChanged<String> changedDropDownItems}) {
    textTitle == null ? textTitle = "Enter Title" : textTitle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                value: selectedItem,
                items: dropDownItems,
                onChanged: changedDropDownItems,
              )),
            ),
          ),
        ),
      ],
    );
  }

  Widget appMultiImagePickerMap(
      {Map<int, File> imageList,
      VoidCallback addImage(int position),
      VoidCallback removeImage(int position)}) {
    int imageLength = imageList.isEmpty ? 1 : imageList.length + 1;
    bool isNull = imageList.isEmpty ? true : false;

    print("Image length is $imageLength");

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: SizedBox(
        height: 150.0,
        child: ListView.builder(
            itemCount: imageLength,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return imageList.isEmpty || imageList[index] == null
                  ? Padding(
                      padding: EdgeInsets.only(left: 3.0, right: 3.0),
                      child: GestureDetector(
                        onTap: () {
                          addImage(index);
                        },
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.image,
                                size: 150.0,
                                color: Theme.of(context).primaryColor,
                              ),
                              Icon(
                                Icons.add_circle,
                                size: 25.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 3.0, right: 3.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                                color: Colors.grey.withAlpha(100),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(imageList[index]))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.red[600],
                              child: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    removeImage(index);
                                  }),
                            ),
                          )
                        ],
                      ),
                    );
            }),
      ),
    );
  }

  Widget appMultiImagePickerList(
      {List<File> imageList, VoidCallback removeImage(int position)}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: imageList == null || imageList.length == 0
          ? Container()
          : SizedBox(
              height: 150.0,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: imageList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 3.0, right: 3.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                                color: Colors.grey.withAlpha(100),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(imageList[index]))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.red[600],
                              child: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    removeImage(index);
                                  }),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
    );
  }

  Widget buildImages({int index, Map imagesMap}) {
    return imagesMap.isEmpty
        ? Container(
            width: 150.0,
            height: 150.0,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Icon(
                  Icons.image,
                  size: 100.0,
                  color: Colors.white,
                ),
                Icon(
                  Icons.add_circle,
                  color: Colors.grey,
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(100),
            ),
          )
        : imagesMap[index] != null
            ? Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(100),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: FileImage(imagesMap[index]))),
              )
            : Container(
                width: 150.0,
                height: 150.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.image,
                      size: 100.0,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.add_circle,
                      color: Colors.grey,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(100),
                ),
              );
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownItems(List size) {
    List<DropdownMenuItem<String>> items = List();
    for (String size in size) {
      items.add(DropdownMenuItem(value: size, child: Text(size)));
    }
    return items;
  }

  //===================================================================================

  class BottomWaveClipper extends CustomClipper<Path> {
    @override
    Path getClip(Size size) {
      var path = Path();
      path.lineTo(0.0, size.height - 70);

      var firstControlPoint = Offset(size.width / 4, size.height);
      var firstPoint = Offset(size.width / 2, size.height);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstPoint.dx, firstPoint.dy);

      var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
      var secondPoint = Offset(size.width, size.height - 70);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondPoint.dx, secondPoint.dy);

      path.lineTo(size.width, 0.0);
      path.close();

      return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;
  }

  class BottomWaveClipper2 extends CustomClipper<Path> {
    @override
    Path getClip(Size size) {
      var path = Path();
      path.lineTo(0.0, size.height - 50);
      var firstControlPoint = Offset(size.width / 4, size.height);
      var firstPoint = Offset(size.width / 2, size.height);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstPoint.dx, firstPoint.dy);

      var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
      var secondPoint = Offset(size.width, size.height - 73);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondPoint.dx, secondPoint.dy);

      path.lineTo(size.width, 0.0);
      path.close();
      return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;
  }

  class BottomWaveClipper3 extends CustomClipper<Path> {
    @override
    Path getClip(Size size) {
      var path = Path();
      path.lineTo(0.0, size.height - 45);

      var firstControlPoint = Offset(size.width / 4, size.height);
      var firstPoint = Offset(size.width / 2, size.height);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstPoint.dx, firstPoint.dy);

      var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
      var secondPoint = Offset(size.width, size.height - 45);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondPoint.dx, secondPoint.dy);

      path.lineTo(size.width, 0.0);
      path.close();
      return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;
  }
