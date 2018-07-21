import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import "icon.js" as Icon


Item {
    id: defpage
    anchors.centerIn: parent
    width: parent.parent
    function hid (){
    console.log("salam shoghi");
    }
    FontLoader{
        id: fnt
        source: "fontawesome.ttf"
    }

    GridLayout{
        columns:parent.width/80
        rowSpacing: 60
        columnSpacing: 80
        // ListView{
        Repeater{
            focus: true
            model: lstmodel
            delegate:ItemDelegate{
                id: itd
                Text {
                   anchors.fill: parent
                   anchors.horizontalCenter: horizontalCenter
                   anchors.verticalCenter: verticalCenter
                   text:model.title
                }
                 onClicked: defpage.hid();
            }
        }

    }
}
