import QtQuick 2.3
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {

    SwipeView{

        id: swp
        width: parent.width
        height: parent.height

        Rectangle{
            Text {
                id: txx
                x:300
                y:400
                text: qsTr("text")
            }
            height: 100
            width: 100

            color: "pink"
            MouseArea{
                anchors.fill:parent
                onClicked: {


                   // errors.reterrors("0x21");
                    datadb.geterrorone("0x22");


                }
            }
           /* Connections{

                target: errors
                onGetlist:{

                   txx.text= s;
                }
            }*/
        }

        Repeater{
            model: 3

            GridLayout{

                columns: 1

                Rectangle{

                    width: 100
                    height: 50
                    color: "pink"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {

                            // errors.geterrorone("test")
                            errors.showall("test msg");
                        }

                    }
                }
                Image{

                    id: imgtxt
                    source: ""
                    width: 60
                    anchors.centerIn: parent
                }
                Text {
                    id: txtswp
                    anchors.centerIn: parent
                    text: qsTr("This is new swipe mode")
                    anchors.top:imgtxt.bottom
                }


            }
        }

    }
    Rectangle{
        Label{

            id: txtmain
            text: qsTr("test message")
        }
    }
   /* Connections{

        target: errors
        onGetlst:{
            txtmain.text=s

        }

    }*/
    PageIndicator{
        count: swp.count
        currentIndex: swp.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

}
