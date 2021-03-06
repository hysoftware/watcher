import QtQuick 2.0

Column{
    id:root
    height:titleArea.height+bodyArea.height
    width:640

    property string title:"Title"
    property string author:"Anonymouse Corward"
    property string email:"anonymous@exmaple.com"
    property string post_time:"1970-01-01 00:00:00 UTC"
    property string body:"(^q^)<Tashi Helondass!!v"
    property string uuid:"00000000-0000-0000-0000-000000000000"
    property string responseURL:"http://example.com/responses/blablabla"
    /*
      imageInfoList must be a JSON List and in which object must be like this:
      In addition to this limitation, the list must be JSON encoded string to avoid implicitly data conversion to QqmlListModel.
      {
        "LinkURI":"http://exmaple.com",
        "SourceURI":"image://provider/imageXX.png",
        "UUID":"187f08b5-02c7-428f-a58b-ec181017cacb",
      }
    */
    property alias imageInfoList: imageFlick.model
    
    signal linkActivated(var linkURL);

    Rectangle{
        id:titleArea
        anchors{
            left:root.left
            right:root.right
        }
        height:titleBar.contentHeight
        
        border{
            width:1
            color:"black"
        }
        color:"transparent"

        Text{
            id:titleBar
            anchors.fill:parent
            textFormat: Text.RichText
            onLinkActivated: root.linkActivated(link)
            renderType: Text.NativeRendering
            text:{
                "<table width=\""+titleBar.width+"\">"+
                "<tr><td><p align=\"left\">"+root.title+"</p></td><td><p align=\"right\">"+root.post_time+"</p></td></tr>"+
                "<tr><td><p align=\"left\">"+root.author+"</p></td><td><p align=\"right\"><a href=\"mailto:"+root.email+"\">"+root.email+"</a></p></td></tr>"+
                "</table>"
            }
        }
    }
    Rectangle{
        id:bodyArea
        height:{
            var areaHeight=bodyText.height+(bodyText.anchors.margins*2)
            if(imageFlick.visible) areaHeight+=imageFlick.height+(imageFlick.anchors.margins*2)
            areaHeight
        }
        color:"transparent"
        border{
            width:1
            color:"black"
        }
        anchors{
            left:root.left
            right:root.right
        }
        TextEdit{
            id:bodyText
            readOnly:true
            renderType: TextEdit.NativeRendering
            wrapMode:TextEdit.Wrap
            textFormat: TextEdit.RichText
            selectByMouse: true
            anchors{
                margins:5
                top:bodyArea.top
                left:bodyArea.left
                right:bodyArea.right
            }
            height: bodyText.contentHeight
            text:root.body
            onLinkActivated: root.linkActivated(link)
        }
        ImageFlicker{
            id:imageFlick
            height:100
            visible:(imageFlick.model.count>0)
            anchors{
                margins:5
                top:bodyText.bottom
                left:bodyArea.left
                right:bodyArea.right
            }
        }
    }
    /*
    Component.onCompleted: {
        for(var index=0;index<imageInfo.count;index++){
            console.log(JSON.stringify(imageInfo.get(index)))
        }
    }
    */
}
