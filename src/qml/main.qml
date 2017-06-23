import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.0


ApplicationWindow {
    visible: true
    title: "Servinator"

    property int margin: 11
    property int width_control_widgets: 400

    width: 640
    height: 480
    minimumWidth: width
    minimumHeight: height
    maximumWidth: width
    maximumHeight: height

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: "/Users/ottojimb/Desktop"
        selectFolder: true
        onAccepted: {
            resultArea.text = resultArea.text + fileDialog.fileUrls[0] + "\n"
        }
        onRejected: {
            console.log("Canceled")
        }
        Component.onCompleted: visible = false
    }

    ColumnLayout {
        id: mainLayout
        anchors.fill: parent
        anchors.margins: margin

        RowLayout {
            GridLayout {
                anchors.fill: parent

                rows: 3
                columns: 2

                Label {
                    text: qsTr("Token")
                }

                TextArea {
                    id: token
                    Layout.preferredWidth: width_control_widgets
                }

                Label {
                    text: qsTr("Service type id")
                }

                TextField {
                    id: service_type
                    Layout.preferredWidth: width_control_widgets
                }

                Label {
                    text: qsTr("Customer id")
                }

                TextField {
                    id: customer
                    Layout.preferredWidth: width_control_widgets
                }

                Label {
                    text: qsTr("Operator")
                }

                TextField {
                    id: interior 
                    Layout.preferredWidth: width_control_widgets
                }
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignTop

                Button {
                    Layout.fillWidth: true
                    text: "Choose directory"
                    onClicked: fileDialog.open()
                }

                Button {
                    Layout.fillWidth: true
                    text: "Ok"
                }
            }
        }

        RowLayout {
            TextArea {
              id: resultArea
              Layout.fillWidth: true
              Layout.fillHeight: true
            }
        }
    }
}
