import QtQuick 2.5
import QtQuick.Controls 2.0
Item {

    property string poooop: popup
    Popup{
        id:popup
        x:(parent.width-width)/2
        y:parent.height/10
        width: parent.width/2+50
        height: parent.height/3
        closePolicy: popup.CloseOnEscape | popup.CloseOnPressOutsideParent

        Rectangle{

            anchors.fill: parent
            Frame{

                id:colorsetting
               width: parent.width
               height: parent.height/2
            }
            Frame{

               id:about

               ColorAnimation {
                   from: "white"
                   to: "black"
                   duration: 200
               }
               width: parent.width
               height: parent.height/2
               Text {
                   id: email
                   text: qsTr("Mortaza.shoghi@gmail.com")
                   font.pointSize: 16
                   font.bold: true

               }
            }
        }
    }

    Component.onCompleted: {
    popup.open();
    }

}
