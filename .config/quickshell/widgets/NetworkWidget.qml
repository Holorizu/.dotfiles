import QtQuick
import Quickshell
import Quickshell.Io

Item {
	id: root

	implicitWidth: content.implicitWidth
	implicitHeight: content.implicitHeight

	property string networkName: "Offline"
	property string networkIcon: "󰤭"
	property string ipAddress: ""
	property bool showIp: false

	Text {
		id: content

		color: "#ffffff"
		font.bold: true
		font.pointSize: 12
		font.family: "Cascadia Mono"

		text: showIp
		? networkIcon + "I know where you pee: " + ipAddress

		: networkIcon + " " + networkName
	}

	MouseArea {
		anchors.fill: parent
		cursorShape: Qt.PointingHandCursor

		onClicked: {
			if (!showIp) {
				ipProc.running = true
			} else {
				showIp = false
			}
		}
	}

	// Get network name
	Process {
		id: networkProc

		command: [
			"nmcli",
			"-t",
			"-f",
			"TYPE,STATE,CONNECTION",
			"device"
		]

		stdout: StdioCollector {
			onStreamFinished: {
				const output = this.text.trim()

				networkName = "My pc kinda networkless :("
				networkIcon = "󰤭"

				for (const line of output.split("\n")) {
					const parts = line.split(":")

					if (parts.length < 3)
					continue

					const type = parts[0]
					const state = parts[1]
					const connection = parts.slice(2).join(":")

					if (type === "wifi" && state === "connected") {
						networkName = connection
						networkIcon = "󰤨"
						break
					}

					if (type === "ethernet" && state === "connected") {
						networkName = connection
						networkIcon = "󰈀"
						break
					}
				}
			}
		}

		Component.onCompleted: running = true
	}

	Timer {
		interval: 3000
		running: true
		repeat: true

		onTriggered: networkProc.running = true
	}

    // Get IP address
    Process {
        id: ipProc

        command: [
            "sh",
            "-c",
            "nmcli -g IP4.ADDRESS device show | head -n 1 | cut -d/ -f1"
        ]

        stdout: StdioCollector {
            onStreamFinished: {
                const ip = this.text.trim()

                if (ip.length > 0) {
                    ipAddress = ip
                    showIp = true
                } else {
                    ipAddress = "No IP"
                    showIp = true
                }
            }
        }
    }
    
}

