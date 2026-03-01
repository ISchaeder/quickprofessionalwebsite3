import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts
import "."

ApplicationWindow {
    visible: true
    title: qsTr("Hello World")

    width: Screen.width
    height: Screen.height

    header: ToolBar {
            RowLayout {
                anchors.fill: parent
                spacing: 10

                ToolButton {
                     text: "Home"
                     MouseArea {
                         id: homemouse
                         anchors.fill: parent
                         hoverEnabled: true
                         cursorShape: Qt.PointingHandCursor

                         onClicked: {
                             let anim = Qt.createQmlObject('import QtQuick 2.15; NumberAnimation {}', flick);
                             anim.target = flick;
                             anim.property = "contentY";
                             anim.to = 0;
                             anim.duration = 500;
                             anim.easing.type = Easing.InOutQuad;
                             anim.start();
                         }
                     }
                }
                ToolButton { text: "About"
                                                                 MouseArea {
                                                                     id: mouseabout
                                                                     anchors.fill: parent
                                                                     hoverEnabled: true
                                                                     cursorShape: Qt.PointingHandCursor

                                                                     onClicked: {
                                                                         let anim = Qt.createQmlObject('import QtQuick 2.15; NumberAnimation {}', flick);
                                                                         anim.target = flick;
                                                                         anim.property = "contentY";
                                                                         anim.to = Screen.height;
                                                                         anim.duration = 500;
                                                                         anim.easing.type = Easing.InOutQuad;
                                                                         anim.start();
                                                                     }
                                                                 }}
                ToolButton { text: "Projects"
                                                                 MouseArea {
                                                                     id: mouseprojects
                                                                     anchors.fill: parent
                                                                     hoverEnabled: true
                                                                     cursorShape: Qt.PointingHandCursor

                                                                     onClicked: {
                                                                         let anim = Qt.createQmlObject('import QtQuick 2.15; NumberAnimation {}', flick);
                                                                         anim.target = flick;
                                                                         anim.property = "contentY";
                                                                         anim.to = Screen.height * 2;
                                                                         anim.duration = 500;
                                                                         anim.easing.type = Easing.InOutQuad;
                                                                         anim.start();
                                                                     }
                                                                 }
                }

                Item { Layout.fillWidth: true } // spacer to push items right
            }
        }

    Flickable {
        id: flick
        width: parent.width; height: parent.height
        contentWidth: allcontent.width; contentHeight: allcontent.height

        Column {
                id: allcontent
                spacing: 0  // space between items

                // Top frame (header)
                Rectangle {
                    id: topFrame
                    width: Screen.width
                    height: Screen.height   //header size
                    //anchors.top: parent.top //anchor header to top (should be in list view for other widgets)

                    Image {
                        anchors.fill: parent
                        source: "qrc:/Resources/Baldy_Mountain__Philmont.jpg"
                        fillMode: Image.PreserveAspectCrop // keeps aspect ratio
                    }

                    NumberAnimation on opacity {
                            from:0; to: 1; duration: 4000
                        }

                    // Overlay text
                    Text {
                        id: title
                        text: "Ian Schraeder"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: Screen.height / 25   // distance from top

                        font.pixelSize: parent.width / 17
                        font.bold: true
                        color: "white"
                        style: Text.Outline
                        styleColor: "black"

                        NumberAnimation on anchors.topMargin {
                                from:0; to: 40; duration: 1500
                                easing.type: Easing.OutCubic
                            }
                    }

                    Text {
                        id: subtitle
                        text: "Computer Science Graduate from Texas A&M"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: Screen.height / 25 + (parent.width / 10)   // distance from top

                        font.pixelSize: parent.width / 45
                        font.bold: true
                        color: "white"
                        style: Text.Outline
                        styleColor: "black"

                        NumberAnimation on anchors.topMargin {
                                from:0; to: 140; duration: 1500
                                easing.type: Easing.OutCubic
                            }
                    }

                    MultiEffect {
                            source: title
                            anchors.fill: title
                            shadowBlur: 1.0
                            shadowEnabled: true
                            shadowColor: "black"
                            shadowVerticalOffset: 15
                            shadowHorizontalOffset: 11
                        }

                    MultiEffect {
                            source: subtitle
                            anchors.fill: subtitle
                            shadowBlur: 1.0
                            shadowEnabled: true
                            shadowColor: "black"
                            shadowVerticalOffset: 15
                            shadowHorizontalOffset: 11
                        }


                    //Place logos below subtitle

                    Image {
                        id: email
                        width: 60
                        height: 60
                        anchors.horizontalCenterOffset: 100
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: (Screen.height / 20) + (parent.width / 10)   // resting position
                        source: "qrc:/Resources/emailicon.png"
                        opacity: 1.0
                        smooth: false

                        // Hover fade effect
                        MouseArea {
                            id: emailMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor

                            onEntered: {
                                email.opacity = 0.7
                                email.anchors.topMargin = (Screen.height / 20) + (parent.parent.width / 10) - 10  // raise by 20 pixels
                            }
                            onExited: {
                                email.opacity = 1.0
                                email.anchors.topMargin = (Screen.height / 20) + (parent.parent.width / 10)  // back to resting
                            }

                            onClicked: {
                                Qt.openUrlExternally("mailto:ian@eschraeder.com")
                            }
                        }

                        Behavior on opacity {
                            NumberAnimation { duration: 500; easing.type: Easing.InOutQuad }
                        }
                        Behavior on anchors.topMargin{
                            NumberAnimation{duration: 500; easing.type: Easing.InOutQuad}
                        }
                    }

                    Image {
                        id: github
                        width: 60
                        height: 60
                        anchors.horizontalCenterOffset: -100
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: (Screen.height / 20) + (parent.width / 10)   // resting position
                        source: "qrc:/Resources/github.png"
                        opacity: 1.0
                        smooth: false

                        // Hover fade effect
                        MouseArea {
                            id: githubMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor

                            onEntered: {
                                github.opacity = 0.7
                                github.anchors.topMargin = (Screen.height / 20) + (parent.parent.width / 10) - 10  // raise by 20 pixels
                            }
                            onExited: {
                                github.opacity = 1.0
                                github.anchors.topMargin = (Screen.height / 20) + (parent.parent.width / 10)  // back to resting
                            }

                            onClicked: {
                                Qt.openUrlExternally("https://github.com/ISchaeder")
                            }
                        }

                        Behavior on opacity {
                            NumberAnimation { duration: 500; easing.type: Easing.InOutQuad }
                        }
                        Behavior on anchors.topMargin{
                            NumberAnimation{duration: 500; easing.type: Easing.InOutQuad}
                        }
                    }

                    Image {
                        id: linkdin
                        width: 60
                        height: 60
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: (Screen.height / 20) + (parent.width / 10)   // resting position
                        source: "qrc:/Resources/linkdin.png"
                        opacity: 1.0
                        smooth: false

                        // Hover fade effect
                        MouseArea {
                            id: linkdinMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor

                            onEntered: {
                                linkdin.opacity = 0.7
                                linkdin.anchors.topMargin = (Screen.height / 20) + (parent.parent.width / 10) - 10  // raise by 20 pixels
                            }
                            onExited: {
                                linkdin.opacity = 1.0
                                linkdin.anchors.topMargin = (Screen.height / 20) + (parent.parent.width / 10)  // back to resting
                            }

                            onClicked: {
                                Qt.openUrlExternally("https://www.linkedin.com/in/ian-schraeder-22623b3a5")
                            }
                        }

                        Behavior on opacity {
                            NumberAnimation { duration: 500; easing.type: Easing.InOutQuad }
                        }
                        Behavior on anchors.topMargin{
                            NumberAnimation{duration: 500; easing.type: Easing.InOutQuad}
                        }
                    }

                    /*Image {
                        id: downarrow
                        width: 200
                        height: 80
                        source: "qrc:/Resources/Down-Arrow-Transparent-Image.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 140   // distance from top

                        NumberAnimation on anchors.bottomMargin {
                                from:2000; to: 140; duration: 1000
                                easing.type: Easing.OutCubic
                            }

                    }*/

                    Image {
                        id: arrow
                        width: 40
                        height: 40
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 140   // resting position
                        source: "qrc:/Resources/Down-Arrow-Transparent-Image.png"
                        opacity: 1.0
                        smooth: false

                        // Hover fade effect
                        MouseArea {
                            id: arrowMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor

                            onEntered: {
                                arrow.opacity = 0.7
                                arrow.anchors.bottomMargin = 150  // raise by 20 pixels
                            }
                            onExited: {
                                arrow.opacity = 1.0
                                arrow.anchors.bottomMargin = 140  // back to resting
                            }

                            onClicked: {
                                let anim = Qt.createQmlObject('import QtQuick 2.15; NumberAnimation {}', flick);
                                anim.target = flick;
                                anim.property = "contentY";
                                anim.to = Screen.height; // scroll of the inital page
                                anim.duration = 500;
                                anim.easing.type = Easing.InOutQuad;
                                anim.start();
                            }
                        }

                        Behavior on opacity {
                            NumberAnimation { duration: 500; easing.type: Easing.InOutQuad }
                        }
                        Behavior on anchors.bottomMargin{
                            NumberAnimation{duration: 500; easing.type: Easing.InOutQuad}
                        }
                    }
                }

                Rectangle {
                    id: aboutme
                    width: Screen.width
                    height: Screen.height   //header size

                    RowLayout {
                            spacing:0
                            anchors.fill: parent

                            Rectangle {
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                Layout.preferredWidth: parent.width / 2
                                color: "#d08770"   // right side

                                    Item {
                                        anchors.fill: parent

                                        Image {
                                            id: photo

                                            anchors.centerIn: parent
                                            width: parent.width * 0.8
                                            height: parent.height * 0.8
                                            source: "qrc:/Resources/headshot.jpg"
                                            fillMode: Image.PreserveAspectFit
                                            smooth: true
                                        }

                                        MultiEffect {
                                            anchors.fill: photo
                                            source: photo
                                            shadowEnabled: true
                                            shadowBlur: 0.6
                                            shadowOpacity: 0.3
                                            shadowVerticalOffset: 15
                                            shadowHorizontalOffset: 11
                                        }
                                    }


                            }



                            Rectangle {
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                Layout.preferredWidth: parent.width / 2
                                color: "#d08770"   // right side

                                Column{
                                    width:parent.width
                                    height:parent.height

                                    spacing: 4

                                     Item { height: 30; width: 1 }

                                     Text {
                                         text: "About Me"
                                         anchors.horizontalCenter: parent.horizontalCenter

                                         font.pixelSize: parent.width / 20
                                         font.bold: true
                                         color: "white"
                                         style: Text.Outline
                                         styleColor: "black"
                                     }

                                     Text {
                                         text: "Computer Science with mathematics concentration; recently graduated from Texas A&M with an aptitude for learning, eagerness for progress, and humility for correction.
Foci in C++, Parallelization, Web Assembly, Mathematical computing with projects utilizing skills in the same.

Check out my skills and see if I meet your needs!"

                                         width: parent.width
                                         font.pixelSize: parent.width / 40
                                         font.bold: false
                                         color: "black"

                                         wrapMode: Text.WordWrap
                                        horizontalAlignment: Text.AlignLeft

                                        anchors.left: parent.left
                                     }

                                     Text {
                                         id: skillstitle
                                         text: "Skills"
                                         anchors.horizontalCenter: parent.horizontalCenter

                                         font.pixelSize: parent.width / 20
                                         font.bold: true
                                         color: "white"
                                         style: Text.Outline
                                         styleColor: "black"
                                     }


                                     Flickable {
                                         id: flickskills
                                         width: parent.width
                                        height: parent.height * 0.4
                                         clip: true

                                         contentWidth: width
                                         contentHeight: contentColumn.implicitHeight

                                         ScrollBar.vertical: ScrollBar {
                                             policy: ScrollBar.AsNeeded
                                         }

                                         Column {
                                             id: contentColumn
                                             width: flick.width
                                             spacing: 12

                                             SkillBar {
                                                 skillName: "C++"
                                                 skillProficiency: "Proficient"
                                                 skillPercent: 0.9
                                                 flick: flick
                                             }

                                             SkillBar {
                                                 skillName: "Web Assembly"
                                                 skillProficiency: "Experienced"
                                                 skillPercent: 0.7
                                                 flick: flick
                                             }

                                             SkillBar {
                                                 skillName: "Systems Programming"
                                                 skillProficiency: "Experienced"
                                                 skillPercent: 0.7
                                                 flick: flick
                                             }

                                             SkillBar {
                                                 skillName: "SQL, Redis, AWS databases"
                                                 skillProficiency: "Experienced"
                                                 skillPercent: 0.5
                                                 flick: flick
                                             }

                                             SkillBar {
                                                 skillName: "Java"
                                                 skillProficiency: "Familiar"
                                                 skillPercent: 0.5
                                                 flick: flick
                                             }

                                             SkillBar {
                                                 skillName: "Python"
                                                 skillProficiency: "Familiar"
                                                 skillPercent: 0.5
                                                 flick: flick
                                             }

                                             SkillBar {
                                                 skillName: "Github"
                                                 skillProficiency: "Familiar"
                                                 skillPercent: 0.5
                                                 flick: flick
                                             }

                                             SkillBar {
                                                 skillName: "Javascript"
                                                 skillProficiency: "Familiar"
                                                 skillPercent: 0.4
                                                 flick: flick
                                             }

                                             SkillBar {
                                                 skillName: "Dart"
                                                 skillProficiency: "Familiar"
                                                 skillPercent: 0.4
                                                 flick: flick
                                             }

                                             SkillBar {
                                                 skillName: "Mathematical Computing"
                                                 skillProficiency: "Have done"
                                                 skillPercent: 0.3
                                                 flick: flick
                                             }

                                             SkillBar {
                                                 skillName: "Cybersecurity"
                                                 skillProficiency: "Have done"
                                                 skillPercent: 0.3
                                                 flick: flick
                                             }

                                             SkillBar {
                                                 skillName: "React"
                                                 skillProficiency: "Have done"
                                                 skillPercent: 0.3
                                                 flick: flick
                                             }


                                         }
                                     }


                                }

                            }
                        }
                }


                Rectangle {
                    id: projects
                    width: Screen.width
                    height: Screen.height   //header size


                    Item {
                        id: root
                        width: Screen.width
                        height: Screen.height

                        ListModel {
                            id: carouselModel
                            ListElement { imageSource: "qrc:/Resources/bydesignscreenshot.png"; caption: "I was contracted by a small, local interior design firm to design a new database for the web to replace their previous, local Microsoft Access system. I designed a database system using Amazon Web Services’ Dynamo Database, E3 cloud storage to host user images, a backend written in Javascript with Express.js and a frontend webapplication made with the Qt framework and emscripten compiler in C++. The application had functioning database systems, user account creation, management, and moderation, printing, and camera functionality which was to be used for scanning barcodes. " }
                            ListElement { imageSource: "qrc:/Resources/Computer.PNG"; caption: "I designed a functioning Y-86 computer which was able to run assembly programs." }
                            ListElement { imageSource: "qrc:/Resources/busrouter.PNG"; caption: "For my senior capstone project, I helped work with several school districts to design software to route school busses. I contributed mostly to reworking software written for Linux to run on the web with webasembly and the algorithmic portion of the software. It was written in C++ and Dart using the Flutter frontend framework and Mongo DB." }
                            ListElement { imageSource: "qrc:/Resources/perceptron.png"; caption: "I took a class in Natural Language processing where I implemented and trained a perceptron model capable of taking in a review of a movie and categorizing it as positive or negative with high accuracy." }
                        }

                        //Carousel based on the QT example made with a pathview component
                        PathView {
                            id: carousel
                            anchors.fill: parent
                            model: carouselModel
                            interactive: true
                            focus: true
                            preferredHighlightBegin: 0.5
                            preferredHighlightEnd: 0.5
                            highlightRangeMode: PathView.StrictlyEnforceRange
                            pathItemCount: 5

                            path: Path {
                                //startX: 0; startY: root.height / 2
                                startX: -width * 1.2; startY: height / 2

                                PathAttribute { name: "scale"; value: 0.6 }
                                PathAttribute { name: "opacity"; value: 0.4 }

                                PathQuad {
                                    x: root.width / 2; y: root.height / 2
                                    controlX: root.width / 4; controlY: root.height * 0.35
                                }
                                PathAttribute { name: "scale"; value: 1.0 }
                                PathAttribute { name: "opacity"; value: 1.0 }

                                //PathQuad {
                                //    x: root.width; y: root.height / 2
                                //    controlX: root.width * 3/4; controlY: root.height * 0.65
                                //}

                                PathQuad {
                                        x: width * 2.2
                                        y: height / 2
                                        controlX: width * 0.9
                                        controlY: height * 0.65
                                    }

                                PathAttribute { name: "scale"; value: 0.6 }
                                PathAttribute { name: "opacity"; value: 0.4 }
                            }

                            delegate: Item {
                                //width: 180
                               // height: 200
                                z: PathView.scale
                                width: Screen.width * .75
                                height: Screen.height * .75
                                scale: PathView.scale
                                opacity: PathView.opacity

                                Column {
                                    anchors.centerIn: parent
                                    spacing: 8

                                    Rectangle {
                                        width: Screen.width * .75
                                        height: Screen.height * .75
                                        radius: 10
                                        clip: true
                                        border.width: 1
                                        border.color: "#888"

                                        Image {
                                            anchors.fill: parent
                                            fillMode: Image.PreserveAspectCrop
                                            source: imageSource
                                        }
                                    }

                                    Text {
                                                 anchors.horizontalCenter: parent.horizontalCenter
                                        width: Screen.width * .6
                                        text: caption
                                        horizontalAlignment: Text.AlignHCenter
                                        wrapMode: Text.WordWrap
                                        font.pixelSize: 16
                                    }
                                }
                            }

                            highlightMoveDuration: 400
                        }

                    }

                }
        }


    }


}
