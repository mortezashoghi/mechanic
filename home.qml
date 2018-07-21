import QtQuick 2.0
import "nav.js" as Nav
Item {

    id:router
    //width: Screen.width
    //height: Screen.height
    ListModel {
    id: pageModel
    function pageRequested(page)
    {
    append({"page": pageLoader.source})
    pageLoader.source = page
    }
    function pageLast()
    {
    pageLoader.source = get(count - 1).page
    remove(count - 1)
    }

    }
    Loader {
    id: pageLoader
    anchors.left: parent.left
    source: "main.qml"
    }

}
