import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import Qt.labs.settings 1.0
import QtQuick.XmlListModel 2.0
import "icon.js" as Icon

import auth 1.0

ApplicationWindow {

    id: mainpage
    visible: true
    width:400// Screen.width
    height: 640//Screen.height
    property string  appName: "mechanic"
    property  string tofind
    property string solv
    property string titr
    property  string dencity
    property string  pr_email
    property string pr_actcode

    function detectscreen(){
        if(Screen.pixelDensity<160)
            dencity="s";
        else if(Screen.pixelDensity<240 && Screen.pixelDensity>160)

            dencity="m"
        else if(Screen.pixelDensity>240 && Screen.pixelDensity>160)
            dencity="b"
    }


    Settings {
        id: settings
        property string style: "Material"
    }
    //Material.accent: Material.Dark
    Material.theme: Material.Light


    FontLoader{
        id: fnt
        source: "font/B Yekan.ttf"
    }

    /*FontLoader{

        id:icos
        source: "font/fontawesome-webfont.ttf"
    }
    Text {
        id: name
        font.family: icos.name
        //color: "#0091f8"
        font.pixelSize: parent.width/6
        text: "\uf0a8"
    }
    */


    header: ToolBar{
        id: head
        height: parent.height/8
        width: parent.width

        Rectangle{
            anchors.fill: parent
            color:"#7aabd6"
        }

        RowLayout{
            anchors.fill: parent
            layoutDirection: "RightToLeft"
            ToolButton{
                anchors.left: parent.left
                contentItem: Image {
                    id: exitbtn
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source:{
                        // if(Screen.pixelDensity<160)
                        "qrc:/icon/logout-32.png"
                        //  else if(Screen.pixelDensity>160 && Screen.pixelDensity<240 )
                        //   "qrc:/icon/logout-48.png"
                        // else if(Screen.pixelDensity>240)
                        //   "qrc:/icon/logout-48.png"
                    }
                    //  sourceSize.width: head.width/10
                    //  sourceSize.height: head.height
                }
                onClicked: msgBox.open();

            }
            Label{
                id: appTitle
                anchors.centerIn: parent
                text: qsTr(appName)
            }

            ToolButton{

                anchors.right: parent.right
                contentItem: Image {
                    id: menu
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: {
                        if(Screen.pixelDensity<160)
                            "qrc:/icon/menu-2-32.png"
                        else if(Screen.pixelDensity>160 && Screen.pixelDensity<240)
                            "qrc:/icon/menu-2-48.png"
                        if(Screen.pixelDensity>240)
                            "qrc:/icon/menu-2-64.png"
                    }
                    // sourceSize.width: head.width/10
                    // sourceSize.height: head.height
                }
                onClicked:{
                    mdrawer.open();

                }
            }



        }
    }


    Rectangle{
        id: searchbox
        anchors.top: head.bottom;
        width: parent.width
        height: (head.height/2)+20
        z:9999;
        ComboBox{
            id:brands
            width: 100
            anchors.right: parent.right
            height: keyword.height
            model: ["all", "Sunny", "LG", "hitache","sumsung" ]

         onCurrentTextChanged: {
             if(currentText=="all"){
                myModel.setFilterString('');

             }else{
              myModel.setFilterString(currentText);
             }

         }


        }


        TextField{
            id: keyword
            anchors.centerIn: parent
            width: searchbox.width/2-30
            height: parent.height-11
            placeholderText: qsTr("Enter text for search ")
            state: "normal"
            maximumLength: 60

            /*  Image {
                id: findico
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                smooth: true
                fillMode: Image.PreserveAspectFit
                source: "icon/search.png"

            }*/
            onTextChanged: {
                tofind=keyword.text
                //   searchmethod(tofind);
                // myModel.searchitems(tofind)
                if(brands.currentText!="all"){
                myModel.setFilterString(brands.currentText+' '+text);
                }else{

                    myModel.setFilterString(text);
                }

            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    if (!keyword.activeFocus) {
                        keyword.forceActiveFocus();
                        // keyword.openSoftwareInputPanel();
                    } else {
                        keyword.focus = false;
                    }
                }
                onPressAndHold: keyword.closeSoftwareInputPanel();
            }

        }


    }

    MessageDialog{

        id: msgBox
        title: "Quit"
        text: qsTr("You want Exit!")
        onAccepted: {
            Qt.quit();
        }
    }


    StackView{
        id: stkview
        anchors.top: searchbox.bottom
        width: parent.width
        height: parent.height-60//(parent.height-head.height)

        initialItem:ColumnLayout{

            ListView{
                id:listerrors
                anchors.fill: parent
                currentIndex: -1
                focus: true
                //model: lstmodel
                //model:xmlmod
                ////////// this is main from xmlrequest   model:listmodel
                //     model:myModel

                model:myModel//.searchitems("");

                delegate:ItemDelegate{
                    highlighted: ListView.isCurrent
                    anchors.horizontalCenter: parent.horizontalCenter
                    // text: name


                    Text {

                        id:titid
                        // get from json  : text: name//qsTr("text")
                        text:titr
                        wrapMode: TextEdit.WordWrap
                      //  width: parent.width
                        height:parent.height
                        ////horizontalAlignment: Text.AlignHCenter
                        verticalAlignment:Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        ////anchors.verticalCenter: titid.verticalCenter

                        font.family: fnt

                    }

                    font.pixelSize: 11
                    width: parent.width
                    background: Rectangle{
                        //  Material.background: Material.Cyan

                        color:"#bbb"
                        border.color: "white"
                        border.width: 0.5

                    }
                    height: {if(Screen.pixelDensity<40)
                            40
                        else
                            60
                    }
                    onClicked: {

                        if(listerrors.currentIndex!=index){
                            listerrors.currentIndex=index
                        }
                        /* when get from json
                         if(model.name!="" && model.disp!=""){
                          stkview.push("Qrc:/Solvs.qml",{headtitr:model.name,decription:model.disp});
                          keyword.text="";
                        }*/
                        // Model is c++
                        if(model.titr!="" && model.solution!=""){
                            stkview.push("Qrc:/Solvs.qml",{headtitr:model.titr,decription:model.solution});
                            keyword.text="";
                        }

                    }


                }

                ScrollIndicator.vertical: ScrollIndicator { }

            }

        }

    }//end stackview


    //start drawer
    Drawer{
        id: mdrawer
        width: (parent.width/2)+20
        height: parent.height
        edge: Qt.RightEdge
        Rectangle{
            id:submnu
            anchors.fill:parent
            color: "#7aabd6"

            // LayoutMirroring.enabled: true
            //LayoutMirroring.childrenInherit: true

            ListView{

                id: lstview
                anchors.fill: parent
                currentIndex: -1
                focus: true
                model: lstmodel

                delegate:ItemDelegate{
                    highlighted: ListView.isCurrent
                    width: parent.width
                    //                     highlight: Rectangle { color: "lightsteelblue"; radius: 5 }

                    Row{
                        layoutDirection: "RightToLeft"
                        anchors.right: parent.right

                        Image {
                            id:icopng
                            horizontalAlignment: right
                            anchors.right:lstview.right+10

                            source: model.icon+dencity+".png"
                        }

                        Text {
                            id: menutext
                            anchors.right:lstview.icopng+20
                            horizontalAlignment: right
                            text: model.title
                        }

                        height: {if(Screen.pixelDensity<40)
                                40
                            else
                                60
                        }


                    }//end of row

                    onClicked: {
                        // if(lstview.currentIndex!=index){

                        lstview.currentIndex=index
                        if(model.type=="exit"){
                            msgBox.open();
                        }else if(model.type=="box"){

                            settingpop.open();
                        }

                        // }
                        //  appTitle.text=model.title
                        // stkview.replace(model.src)
                        mdrawer.close();


                    }


                }


            }
        }

    }
//listmodel for drawer menu
    ListModel{
        id: lstmodel
        ListElement{title:"setting";solve:"Music";icon:"Qrc:/icon/setting";type:"page";src:"Qrc:/contacts.qml"}
        ListElement{title:"about us ";solve:"Envelope";icon:"Qrc:/icon/info";type:"box";src:"setting"}
        ListElement{title:"favorates";solve:"Heart";icon:"Qrc:/icon/fav";type:"fav";src:"Qrc:/contacts.qml"}
        ListElement{title:"Quit";icon:"Qrc:/icon/exit";type:"exit";src:"exit"}
    }
    //model for test sqlite loade
    ListModel{
        id: sqlitemodel
        ListElement{ids:"102";title:"repairs";solve:"open it and clodse";image:"Qrc:/logout-64.png"}

    }

    //test xml read from xmlFile

    XmlListModel{

        id: xmlmod
        source: "xmlexam.xml"
        query:"/bookstore/book"

        XmlRole{name:"titr";query:"title/string()"}
        XmlRole{name:"nev";query:"price/string()"}
    }
    //test c++ model
    ListView {
        id:tstc
        width: 100; height: 100

        // model: myModel
        //  model:listmodel
        delegate: Rectangle {
            height: 25
            width: 100
            Text { text: name }
        }
    }

    //test get json from c++
    Credential{
        id:crd
        onGetacdata:{
            console.warn("this is signal:",email,active_code);
            pr_email=email
            pr_actcode=active_code
        }
    }


    Component.onCompleted: {
        //searchbox.height=0
        // searchbox.visible=false;

        detectscreen();
        readdata();
        crd.getacdata();
        // crd.checkconfiguration()

    }

    //popup menu

    Popup{
        id:settingpop
        x: (mainpage.width - width) / 2
        y: mainpage.height / 6
        width: Math.min(mainpage.width, mainpage.height) / 3 * 2
        height: 520//mainpage.height/5
        modal: true

        Column{
            width: settingpop.width
            anchors.horizontalCenter: parent.horizontalCenter
            //Image { source: portrait; anchors.horizontalCenter: parent.horizontalCenter }
            Text {
                width: parent.width
                text: pr_email
            }
            Text {
                width: parent.width
                text: pr_actcode
            }
        }

        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    }

    //This method Not use this is used for get data from json and when we want use jsvascript

    function readdata(){

        var xhr = new XMLHttpRequest;
        xhr.open("GET", "data.json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                var list = JSON.parse(xhr.responseText);
                listmodel.clear();
                for (var i=0;i<list.length;i++)
                    listmodel.append({ "id": list[i].id,"name": list[i].title,"disp": list[i].solution });
            }
        }
        xhr.send();
    }

//This method Not use this is used for get data from json and when we want use jsvascript

    function searchmethod(tofind){
        // listmodel.clear();
        //myModel.clear()
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "data.json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                var list = JSON.parse(xhr.responseText);


                for (var i=0;i<list.length;i++){

                    if(list[i].title.indexOf(tofind)!=-1){

                        listmodel.append({ "id": list[i].id,"name": list[i].title,"disp": list[i].solution });
                    }
                }
            }
        }
        xhr.send();
    }



    ListModel{
        id:listmodel

    }


    //footer

    //end of qml file
}
