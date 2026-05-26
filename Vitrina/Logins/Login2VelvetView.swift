//
//  Login2VelvetView.swift
//  Vitrina
//
//  Created by mierlin on 26/05/2026.
//

import SwiftUI

// MARK: - Palette
// Todos los colores del login en un solo lugar.
// Si el cliente quiere cambiar el color principal,
// solo cambias aquí y se actualiza toda la pantalla.
private enum Palette {
    
    // Fondo — tres paradas para dar profundidad cinematográfica
    static let bgTop    = Color(red: 0.10, green: 0.04, blue: 0.18) // indigo oscuro
    static let bgMid    = Color(red: 0.04, green: 0.02, blue: 0.07) // casi negro
    static let bgBottom = Color(red: 0.16, green: 0.03, blue: 0.12) // vino oscuro
    
    // Acento — mezcla de rosa y violeta (más cálido que púrpura puro)
    static let accentPink   = Color(red: 1.00, green: 0.31, blue: 0.60)
    static let accentViolet = Color(red: 0.72, green: 0.36, blue: 1.00)
    static let accentIndigo = Color(red: 0.42, green: 0.31, blue: 1.00)
    static let accentSoft   = Color(red: 0.83, green: 0.71, blue: 1.00) // lavanda suave
}

// MARK: - Vista principal

struct Login2VelvetView: View {
    
    @State private var haloAngle: Double = 0
    
    var body: some View {
        ZStack {
            // ─── 🟣 Capa 1: Fondo gradiente ───────────────────────────
            // Tres colores de arriba a abajo — indigo → negro → vino
            LinearGradient(
                colors: [
                    Palette.bgTop,
                    Palette.bgMid,
                    Palette.bgBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea() // Toda la pantalla sin margen
            
            // ─── 🟣 Capa 2: Orbe atmosférico ──────────────────────────
            Circle()
                .fill(
                    AngularGradient(
                        colors: [
                            Palette.accentViolet,
                            Palette.accentPink,
                            Palette.accentIndigo,
                            Palette.accentViolet],
                        center: .center
                    )
                )
                .frame(width: 360, height: 360)
                .blur(radius: 60)  // 👈 difumina el círculo en orbe
                .blendMode(.plusLighter) // 👈 se mezcla con el fondo como luz
                .opacity(0.55)
                .rotationEffect(.degrees(haloAngle / 8)) // rota 8x más lento
                .offset(y: -180)      // 👈 lo sube arriba de la card
                .ignoresSafeArea()
        }
    }
}

#Preview {
    Login2VelvetView()
}
