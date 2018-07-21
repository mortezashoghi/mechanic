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

                    //errors.reterrors("shoghi");

                    datadb.geterrorone("mortezzzzzza");

                }
            }
            Connections{

                //target: errors
                //onGetlist:{

                  //  txx.text= s;
                //}
            }
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

                            // errors.reterrors("hi shoghi")
                            // errors.geterrorone("gooodkk")
                            errors.showall("shoghi")
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
                    text: qsTr("This is new swap mode")
                    anchors.top:imgtxt.bottom
                }


            }
        }

    }
    Rectangle{

        Label{

            id: txtmain
            text: qsTr("goodmorning")
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
