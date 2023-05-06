import QtQuick

Item {
    Item {
        width: 320
        height: 120

        Rectangle {
            color: "blue"
            width: 120
            height: 120

            // By setting this SequentialAnimation on x, it and animations within it will automatically animate
            // the x property of this element
            SequentialAnimation on x {
                id: xAnim
                // Animations on properties start running by default
                running: false
                loops: Animation.Infinite // The animation is set to loop indefinitely
                NumberAnimation { from: 0; to: 200; duration: 500; easing.type: Easing.InOutQuad }
                NumberAnimation { from: 200; to: 0; duration: 500; easing.type: Easing.InOutQuad }
                PauseAnimation { duration: 250 } // This puts a bit of time between the loop
            }

            TapHandler {
                // The animation starts running when you click within the rectangle
                onTapped: xAnim.running = true
            }
        }
    }

    Item {
        width: 320
        height: 120

        Rectangle {
            id: rectangle
            color: "yellow"
            width: 120
            height: 120

            TapHandler {
                // The animation starts running when you click within the rectangle
                onTapped: anim.running = true;
            }
        }

        // This animation specifically targets the Rectangle's properties to animate
        SequentialAnimation {
            id: anim
            // Animations on their own are not running by default
            // The default number of loops is one, restart the animation to see it again

            NumberAnimation { target: rectangle; property: "x"; from: 0; to: 200; duration: 500 }

            NumberAnimation { target: rectangle; property: "x"; from: 200; to: 0; duration: 500 }
        }
    }
}
