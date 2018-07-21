import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0



Rectangle {

    id:descriptor
    property string headtitr
    property string decription
   // color: "silver"
   // anchors.fill:parent
    Component.onCompleted: {
        searchbox.height=0
        searchbox.visible=false;

    }
    Label{
        id:tittext
        width:flick.width-50
        //anchors.right: disppop.Right
        anchors.top:descriptor.top+10
        text:headtitr
       // color: "#14441e"
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Label.AlignVCenter
        height: 50
        z:20

        wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
        background:Rectangle {
            color: "#839abf"
            radius: 3

        }




    }

    Flickable{

        id:flick
        anchors.top:tittext.bottom+30
        anchors.bottom: parent.bottom-20
        width: parent.width
        anchors.fill: parent
        contentHeight: descriptionid.contentHeight+30
        clip: true
        topMargin: 40
        ScrollBar.vertical: ScrollBar {}

        Text{

            id:descriptionid
            //height:parent.height*3
          //  clip: true
            width:parent.width
            anchors.top:flick.top+5

            horizontalAlignment: Text.AlignJustify
            verticalAlignment: "AlignTop"
            //    anchors.horizontalCenter: descriptor.horizontalCenter
            wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
            padding: 30
            text: decription
            color: "#1d2128"
            // color: Material.color(Material.Pink)

            font.pixelSize: 12


        }
    }

    Rectangle{
        id:btnbck
        anchors.left: parent.left
        anchors.top:parent.bottom
        width:parent.width/10
        height: 40
        color: parent.color

        Image {
            id: backico
            anchors.fill:parent
            source: "qrc:/icon/previous.png"
        }

        MouseArea{
            anchors.fill: parent
            onClicked:{
                searchbox.height=(head.height/2)+20;
                searchbox.visible=true;
                stkview.pop();


            }
        }
    }

}



