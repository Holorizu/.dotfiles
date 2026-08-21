import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import "components"
import "widgets"


PanelWindow {
	id: root

	property int cpuUsage: 0
	property int memUsage: 0
	property var lastCpuIdle: 0
	property var lastCpuTotal: 0
	property int volumeLevel: 0

	anchors {
		bottom: true
		left: true
		right: true
	}

	implicitHeight: 23
	color: "black" 

	RowLayout {
		anchors.fill: parent
		anchors.margins: 3
		spacing: 8

		Item { Layout.fillWidth: true }

		// Tray
		Item {
			id: tray
			implicitWidth: trayRow.implicitWidth
			implicitHeight: trayRow.implicitHeight

			RowLayout {
				id: trayRow
				anchors.fill: parent
				spacing: 8

				Repeater {
					model: SystemTray.items

					delegate: Item {
						id: trayItem
						required property SystemTrayItem modelData
						implicitWidth: 20
						implicitHeight: 20

						QsMenuAnchor {
							id: menuAnchor
							menu: trayItem.modelData.menu
							anchor.window: root.QsWindow.window
							anchor.rect.x: trayItem.mapToItem(root.QsWindow.window.contentItem, 0, 0).x
							anchor.rect.y: trayItem.mapToItem(root.QsWindow.window.contentItem, 0, trayItem.height).y
						}

						Component.onCompleted: {
							console.log("[tray]", modelData.id, "title:", modelData.title,
							"onlyMenu:", modelData.onlyMenu,
							"hasMenu:", modelData.menu !== null)
						}

						IconImage {
							anchors.fill: parent
							source: trayItem.modelData.icon
						}

						MouseArea {
							anchors.fill: parent
							acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
							onClicked: (mouse) => {
								if (mouse.button === Qt.LeftButton) {
									if (trayItem.modelData.onlyMenu) {
										menuAnchor.open()
									} else {
										trayItem.modelData.activate()
									}
								} else if (mouse.button === Qt.RightButton) {
									menuAnchor.open()
								} else if (mouse.button === Qt.MiddleButton) {
									trayItem.modelData.secondaryActivate()
								}
							}
							onWheel: (wheel) => {
								trayItem.modelData.scroll(wheel.angleDelta.x, wheel.angleDelta.y)
							}
						}
					}
				}
			}
		}		



		// Network Status
		NetworkWidget {
			Layout.alignment: Qt.AlignVCenter
		}

		Rectangle {
			width: 1
			height: 16
			color: "green"
		}

		// CPU
		Text {
			text: "CPU: " + cpuUsage + "%"
			color: "yellow"
			font.bold: true
			font.pointSize: 11

			Process {
				id: cpuProc
				command: ["sh", "-c", "head -1 /proc/stat"]
				stdout: SplitParser {
					onRead: data => {
						if (!data) return
						var p = data.trim().split(/\s+/)
						var idle = parseInt(p[4]) + parseInt(p[5])
						var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
						if (lastCpuTotal > 0) {
							cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)))
						}
						lastCpuTotal = total
						lastCpuIdle = idle
					}
				}
				Component.onCompleted: running = true
			}
			Timer {
				interval: 2000        
				running: true        
				repeat: true        
				onTriggered: cpuProc.running = true
			}
		}

		Rectangle {
			width: 1
			height: 16
			color: "green"
		}
		// Memory
		Text {
			text: "Mem: " + memUsage + "%"
			color: "lightgreen"
			font.bold: true
			font.pointSize: 11
			Process {
				id: memProc
				command: ["sh", "-c", "free | grep Mem"]
				stdout: SplitParser {
					onRead: data => {
						if (!data) return
						var parts = data.trim().split(/\s+/)
						var total = parseInt(parts[1]) || 1
						var used = parseInt(parts[2]) || 0
						memUsage = Math.round(100 * used / total)
					}
				}
				Component.onCompleted: running = true
			}
			Timer {
				interval: 2000
				running: true
				repeat: true
				onTriggered: {
					cpuProc.running = true
					memProc.running = true
				}
			}
		}

		Rectangle {
			width: 1
			height: 16
			color: "green"
		}
		Text {
			text: "Vol: " + volumeLevel + "%"
			color: "#3AC4E0"
			font.pointSize: 11
			font.bold: true

			Process {
				id: volProc
				command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]
				stdout: SplitParser {
					onRead: data => {
						if (!data) return
						var match = data.match(/Volume:\s*([\d.]+)/)
						if (match) {
							volumeLevel = Math.round(parseFloat(match[1]) * 100)
						}
					}
				}
				Component.onCompleted: running = true
			}
			Timer {
				interval: 200
				running: true
				repeat: true

				onTriggered: {
					if (!volProc.running)
					volProc.running = true
				}
			}
		}

		Rectangle {
			width: 1
			height: 16
			color: "green"
		}

		// battery
		Battery {}

		Rectangle {
			width: 1
			height: 16
			color: "green"
		}

		// Clock
		Text {
			id: clock
			color: "#FFB973"

			font.bold: true
			font.pointSize: 11
			text: Qt.formatDateTime(new Date(),"ddd, MMM dd - hh:mm A")
			
			Process {
				id: dateProc
				command: ["date"]

				running: true

				stdout: StdioCollector {
					onStreamFinished: clock.text = this.text
				}
			}

			Timer {
				interval: 1000
				running: true
				repeat: true
				//font { pixelSize: root.fontSize; bold: true }
				onTriggered: clock.text = Qt.formatDateTime(new Date(),"ddd, MMM dd - hh:mm A")
			}
		}
	}
}
