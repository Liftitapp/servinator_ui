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
                    id: service_type_id
                    Layout.preferredWidth: width_control_widgets
                }

                Label {
                    text: qsTr("Customer id")
                }

                TextField {
                    id: customer_id
                    Layout.preferredWidth: width_control_widgets
                }

                Label {
                    text: qsTr("Num operators")
                }

                TextField {
                    id: num_operators
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
		    onClicked: doExecute()
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

    function doExecute() {
    	var service_type_id1 = parseInt(service_type_id.text)
    	var customer_id1 = parseInt(customer_id.text)
    	var num_operators1 = parseInt(num_operators.text)
    	var dir = fileDialog.fileUrls[0]
    	var token1 = token.text
	Cli.execute(service_type_id1, customer_id1, num_operators1, dir, token1)
    }
}
