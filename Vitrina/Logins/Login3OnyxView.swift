//
//  Login3OnyxView.swift
//  Vitrina
//
//  Created by mierlin on 28/05/2026.
//

import SwiftUI

struct Login3OnyxView: View {
    var body: some View {
        
        ZStack {
            // 🟣 Bloque 1 — Fondo + línea vertical — Fondo negro puro
            Color.black
                .ignoresSafeArea() // sin esto queda un margen blanco arriba y abajo
            
            // — Toque sutil de calidez arriba a la derecha
            RadialGradient(
                colors: [
                    Color(red: 0.70, green: 0.55, blue: 1.0).opacity(0.10),
                    Color.clear
                ],
                center: .topTrailing,
                startRadius: 0,
                endRadius: 300
            )
            .ignoresSafeArea()
            
            // — Línea vertical izquierda — el detalle de lujo
            GeometryReader { geo in    // nos da el tamaño real de la pantalla.
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.clear,
                                Color.white.opacity(0.18),
                                Color.white.opacity(0.18),
                                Color.clear
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 1, height: geo.size.height)
                    .position(x: 28, y: geo.size.height / 2)
                // colocamos la línea exactamente en x = 28 desde el borde izquierdo
            }
            .ignoresSafeArea()
            
            // 🟣 Bloque 02 — Wordmark + título serif  — Contenido principal
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    
                    // 🟣 BLOQUE 2 — Wordmark + título serif
                    VStack(alignment: .leading, spacing: 0) {
                        
                        // Wordmark — pequeño, espaciado, elegante
                        Text("MAISON · EST. 2014")
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundStyle(.white.opacity(0.5))
                            .kerning(3)
                            .padding(.bottom, 80)
                        
                        // Título serif gigante
                        Text("Welcome.")
                            .font(.custom("Times New Roman", size: 56)) // tipo de leta
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.7)
                        
                        // Subtítulo
                        Text("Sign in to continue\nmanaging your studio.")
                            .font(.system(size: 14))
                            .foregroundStyle(.white.opacity(0.55))
                            .lineSpacing(4)
                            .padding(.top, 20)
                            .padding(.bottom,56)
                    }
                    .padding(.top, 110)
                    
                    // 🟣 BLOQUE 3 — Campos (siguiente paso)
                    Text("Campos aquí ✅")
                               .foregroundStyle(.white)
                }
                .padding(.horizontal, 48)
            }
            
        }
    }
}

#Preview {
    Login3OnyxView()
}
