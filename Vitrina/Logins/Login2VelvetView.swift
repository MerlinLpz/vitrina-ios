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
            // Círculo con gradiente angular, muy difuminado,
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
            
            // ─── Capa 3: Oscurecedor radial ────────────────────────
            // Evita que el orbe tape el contenido del centro
            RadialGradient(
                colors: [.clear, Palette.bgMid.opacity(0.7)],
                center: .center,
                startRadius: 120,
                endRadius: 400
            )
            .ignoresSafeArea()
            .allowsHitTesting(false) // 👈 no bloquea los taps del usuario
            
            // ─── Contenido principal ───────────────────────────────
            VStack(spacing: 0) {
                
                // 🟣 BLOQUE 3 — Brand Header - Logo
                VStack(spacing: 14) {
                    
                    // Logo — cuadrado de vidrio con diamante adentro
                    ZStack {
                        // Fondo del logo — efecto vidrio
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [.white.opacity(0.20), .white.opacity(0.05)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 56, height: 56)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .stroke(.white.opacity(0.15), lineWidth: 1)
                            )
                            .shadow(
                                color: Palette.accentViolet.opacity(0.3),
                                radius: 16, y: 8
                            )
                        
                        // Diamante interior — rotado 45°
                        RoundedRectangle(cornerRadius: 4)
                            .fill(
                                LinearGradient(
                                    colors: [.white, Palette.accentSoft],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 22, height: 22)
                    }
                    // Nombre de la marca
                    Text("LUXURY")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .tracking(0.3) // Espacio entre las letras
                }
                .padding(.top, 24)
                
                Spacer(minLength: 24)
                
                // 🟣 BLOQUE 4 — Glass Card (siguiente paso)
                Text("Card aquí ✅")
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
            }
        }
        .preferredColorScheme(.dark)
        .onAppear {
            // Arranca la rotación infinita cuando aparece la pantalla
            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                haloAngle = 360
            }
        }
    }
}

#Preview {
    Login2VelvetView()
}
