//
//  Login3OnyxView.swift
//  Vitrina
//
//  Created by mierlin on 28/05/2026.
//

import SwiftUI

struct Login3OnyxView: View {
    var body: some View {
      //"🚧 En construcción"
        ZStack {
            // — Fondo negro puro
            Color.black
                .ignoresSafeArea() //todo el contorno black
            
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
                .frame(width: 1)
                .padding(.leading, 28)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // — Contenido (siguiente bloque)
            Text("Fondo listo ✅")
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    Login3OnyxView()
}
