// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Controls.Material
import QuranKarim

Window {
    width: Screen.width
    height: Screen.height

    visible: true
    title: "QuranKarim"

    Universal.theme: Universal.Light
    Material.theme: Material.Light

    property var builtInStyles

    StackView {
        id: stackView

        anchors.fill: parent
        initialItem: MainPage {}
    }

}

