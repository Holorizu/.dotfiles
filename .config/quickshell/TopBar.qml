import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 23
    color: "black"

    WlrLayershell.layer: WlrLayer.Top
    exclusiveZone: implicitHeight

    // Recomputes whenever Hyprland.toplevels changes (open/close/move)
    property var sortedWindows: {
        var arr = Hyprland.toplevels.values.slice();
        arr.sort(function(a, b) {
            var wa = a.workspace ? a.workspace.id : 10;
            var wb = b.workspace ? b.workspace.id : 10;
            return wa - wb;
        });
        return arr;
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 0
        spacing: 0

        Repeater {
            model: sortedWindows

            delegate: Rectangle {
                id: winBox
                required property HyprlandToplevel modelData

                Layout.fillWidth: true
                Layout.preferredWidth: 1
                Layout.fillHeight: true
                Layout.margins: 0

                radius: 0
                color: winBox.modelData.activated ? "#444B39" : "#1B282E"
                border.color: winBox.modelData.activated ? "#444B39" : "#151E23"
                border.width: 1

                Text {
                    anchors.fill: parent
                    anchors.margins: 10
                    text: winBox.modelData.title
                    color: winBox.modelData.activated ? "#ffffff" : "#cdd6f4"
					font.bold: true
					font.pointSize: 11
					font.family: "Cascadia Mono"
                    elide: Text.ElideRight
                    //horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: winBox.modelData.wayland.activate()
                    //onEntered: winBox.color = "#444B39"
                    //onExited: winBox.color = winBox.modelData.activated ? "#1B282E" : "#1B282E"
                }
            }
        }
    }
}
