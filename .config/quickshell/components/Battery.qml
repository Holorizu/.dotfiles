import QtQuick
import Quickshell
import Quickshell.Services.UPower

Item {
    id: root

    readonly property var battery: UPower.displayDevice

    readonly property real percentage:
        battery.percentage

    readonly property bool charging:
        battery.state === UPowerDeviceState.Charging

    readonly property bool plugged:
        battery.state === UPowerDeviceState.FullyCharging ||
        battery.state === UPowerDeviceState.Charging

    readonly property color batteryColor: {
        if (charging)
            return "#a6e3a1"

        if (percentage <= 15)
            return "#f38ba8"

        if (percentage <= 30)
            return "#fab387"

        return "#cdd6f4"
    }

    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

    Row {
        id: row

        anchors.centerIn: parent
        spacing: 5

        Text {
            text: "Bat: " + Math.round(root.percentage * 100) + "%"

            color: root.batteryColor
            font.pointSize: 11
            font.bold: true

            anchors.verticalCenter: parent.verticalCenter
        }
    }
}

