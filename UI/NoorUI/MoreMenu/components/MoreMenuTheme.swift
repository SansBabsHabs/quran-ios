//
//  MoreMenuTheme.swift
//
//
//  Created by Afifi, Mohamed on 9/5/21.
//

import Localization
import SwiftUI
import UIx

public struct MoreMenuTheme: View {
    @Binding var theme: MoreMenu.Theme
    public init(theme: Binding<MoreMenu.Theme>) {
        _theme = theme
    }

    public var body: some View {
        HStack {
            Spacer()
            ThemeSelection(label: l("theme.light"), selected: theme == .light) {
                theme = .light
            }
            ThemeSelection(label: l("theme.dark"), selected: theme == .dark) {
                theme = .dark
            }
            ThemeSelection(label: l("theme.auto"), selected: theme == .auto) {
                theme = .auto
            }
            Spacer()
        }
    }
}

private struct ThemeSelection: View {
    let label: String
    let selected: Bool
    var action: () -> Void
    var body: some View {
        Button {
            if !selected {
                action()
            }
        }
        label: {
            VStack {
                Text(label)
                    .foregroundColor(.label)
                Text("")
                if selected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.accentColor)
                } else {
                    Image(systemName: "checkmark.circle.fill")
                        .hidden()
                        .overlay(Circle().stroke(Color.systemGray))
                }
            }
            .padding()
        }
    }
}

struct MoreMenuTheme_Previews: PreviewProvider {
    struct Container: View {
        @State var theme: MoreMenu.Theme
        var body: some View {
            MoreMenuTheme(theme: $theme)
        }
    }

    static var previews: some View {
        Previewing.screen {
            VStack {
                Container(theme: .auto)
            }
        }
        .previewLayout(.fixed(width: 320, height: 300))
    }
}
