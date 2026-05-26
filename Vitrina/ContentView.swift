//
//  ContentView.swift
//  Vitrina
//
//  Created by mierlin on 25/05/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Logins") {
                    NavigationLink("01 · Dark Luxury") {
                        Login1DarkLuxuryView()
                    }
                }
            }
            .navigationTitle("Vitrina")
        }
    }
}

#Preview {
    ContentView()
}
