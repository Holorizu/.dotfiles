pragma Singleton

import Quickshell
import Quickshell.Networking

Singleton {
    readonly property var wifi:
        NetworkManager.devices.find(d => d instanceof WifiDevice)

    readonly property var activeNetwork:
        NetworkManager.networks.find(n => n.connected)

    readonly property bool connected:
        activeNetwork !== undefined

    readonly property string name:
        activeNetwork?.name ?? ""

    readonly property bool wifiConnected:
        wifi?.activeNetwork?.connected ?? false
}

