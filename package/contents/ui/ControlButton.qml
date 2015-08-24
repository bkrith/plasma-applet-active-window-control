/*
 * Copyright 2015  Martin Kotelnik <clearmartin@seznam.cz>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http: //www.gnu.org/licenses/>.
 */
import QtQuick 2.2
import org.kde.plasma.core 2.0 as PlasmaCore

MouseArea {
    id: controlButton
    
    height: controlButtonsArea.height
    width: controlButtonsArea.controlButtonsHeight
    
    property bool mouseInside: false
    property bool mousePressed: false
    
    property string themeName: theme.themeName === 'breeze-dark' || theme.themeName === 'oxygen' ? 'breeze-dark' : 'default'
    property string buttonImagePath: Qt.resolvedUrl('../icons/' + themeName + '/' + iconName + '.svgz')
    
    PlasmaCore.Svg {
        id: buttonSvg
        imagePath: buttonImagePath
    }
    
    // icon
    PlasmaCore.SvgItem {
        id: svgItem
        width: parent.width
        height: width
        svg: buttonSvg
        elementId: mouseInside ? 'pressed-center' : 'active-center';
        anchors.verticalCenter: parent.verticalCenter
    }
        
    hoverEnabled: true
    
    onEntered: {
        mouseInside = true
    }
    
    onExited: {
        mouseInside = false
    }
    
    // trigger close active window
    onClicked: {
        controlButtonsArea.mouseInWidget = true
        if (bp === 4) {
            return;
        }
        main.performActiveWindowAction(windowOperation)
    }
}