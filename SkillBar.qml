import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts

Item {

    width: Screen.width / 2.1 //parent.width
    height: 60

    property string skillName
    property double skillPercent
    property string skillProficiency
    property Flickable flick
    //property alias flickable: flick  // assign from parent

    Rectangle{

        id: barFrame
        width: parent.width
        height: 40
        color: "#2a9df4"   // frame color
        radius: 8
        Column{

            Text {
                text: skillName
                anchors.horizontalCenter: parent.horizontalCenter
            }

            RowLayout {
                    id: firstSkill
                    spacing: 10
                    Layout.fillWidth: true
                    anchors.horizontalCenter: parent.horizontalCenter

                    ProgressBar {
                        id: skillBar
                        from: 0
                        to: 1
                        value: 0
                        Layout.preferredWidth: barFrame.width - (Screen.width/10)
                        Layout.fillWidth: true

                        Behavior on value {
                            NumberAnimation { duration: 1000; easing.type: Easing.InOutCubic }
                        }
                    }

                    Label {
                        text: skillProficiency
                        verticalAlignment: Text.AlignRight
                    }

                    // Trigger the bar fill when scrolling into view
                    Timer {
                        interval: 100
                        running: true
                        repeat: true
                        onTriggered: {
                            // Map the top-left and bottom-right corners to Flickable coordinates
                            var topLeft = firstSkill.mapToItem(flick, 0, 0)
                            var bottomRight = firstSkill.mapToItem(flick, firstSkill.width, firstSkill.height)

                            // Flickable viewport is 0 .. flick.height
                            // If any part of the bar is visible, trigger animation
                            if (bottomRight.y > 0 && topLeft.y < flick.height - (flick.height * .2)) {
                                skillBar.value = skillPercent    // fill
                            } else {
                                skillBar.value = 0      // optional reset
                            }
                        }
                    }
                }
        }
    }
}
