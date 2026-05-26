//
//  Login1DarkLuxuryView.swift
//  Vitrina
//
//  Created by mierlin on 25/05/2026.
//

import SwiftUI

struct Login1DarkLuxuryView: View {
    // Estados para los campos
    @State private var email = ""
    @State private var password = ""
    @State private var presionado = false
    
    var body: some View {
        ZStack {
            
            // 🟣 Bloque 1 — Fondo base oscuro
            Color(red: 0.05, green: 0.05, blue: 0.10)
                .ignoresSafeArea() //toda la pantalla un solo color
            
            // — Orbe púrpura arriba a la derecha
            RadialGradient(
                colors: [Color(red: 0.47, green: 0.31, blue: 1.0).opacity(0.3),
                         Color.clear],
                center: .topTrailing,
                startRadius: 0,
                endRadius: 350
            )
            .ignoresSafeArea()
            
            // — Orbe azul abajo a la izquierda
            RadialGradient(
                colors: [Color(red: 0.29, green: 0.56, blue: 1.0).opacity(0.18),
                         Color.clear],
                center: .bottomLeading,
                startRadius: 0,
                endRadius: 300
            )
            .ignoresSafeArea()
            
            //MARK: - AQUI empieza el contenido principal
            
            // 🟣 BLOQUE 2 — Contenido principal
            ScrollView {
                VStack(spacing: 0) {
                    
                    // 🟣 BLOQUE 2 — Logo + títulos
                    VStack(spacing:8) {
                        
                        //Logo
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(colors: [Color(red: 0.47, green: 0.31, blue: 1.0),
                                                            Color(red: 0.29, green: 0.26, blue: 1.0)],
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing
                                                  )
                                )
                                .frame(width: 64, height: 64)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white.opacity(0.25))
                                .frame(width: 32, height: 32)
                        }
                        .shadow(
                            color: Color(red: 0.47, green: 0.31, blue: 1.0).opacity(0.5),
                            radius: 20, x: 0, y: 8
                        )
                        .padding(.bottom, 8)
                        
                        // Título
                        Text("Bienvenido")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(.white)
                        
                        // Subtítulo
                        Text("Inicia sesión en tu cuenta")
                            .font(.system(size: 15))
                            .foregroundStyle(.white.opacity(0.45))
                    }
                    .padding(.top, 80)
                    .padding(.bottom, 40)
                    
                    // 🟣 BLOQUE 3 — Campos de texto
                    VStack(spacing: 16) {
                        // Campo Email
                        VStack(alignment: .leading, spacing: 6) {
                            Text("CORREO")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundStyle(.white.opacity(0.35))
                                .kerning(1.2) //separa levemente las letras del label. "CORREO" se vea premiun
                            
                            HStack {
                                Image(systemName: "envelope")
                                    .foregroundStyle(.white.opacity(0.3))
                                    .font(.system(size: 15))
                                TextField("", text: $email)
                                    .placeholder(when: email.isEmpty) {
                                        Text("correo@email.com")
                                            .foregroundStyle(.white.opacity(0.2))
                                    }
                                    .foregroundStyle(.white)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .background(.white.opacity(0.07))
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(.white.opacity(0.12), lineWidth: 1)
                            )
                            .cornerRadius(14)
                        }
                        // Campo Contraseña
                        VStack(alignment: .leading, spacing: 6) {
                            Text("CONTRASEÑA")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundStyle(.white.opacity(0.35))
                                .kerning(1.2) //separa levemente las letras del label."CONTRASEÑA" se vea premiun
                            
                            HStack {
                                Image(systemName: "lock")
                                    .foregroundStyle(.white.opacity(0.3))
                                    .font(.system(size: 15))
                                SecureField("", text: $password)
                                    .placeholder(when: password.isEmpty) {
                                        Text("•••••••••")
                                            .foregroundStyle(.white.opacity(0.2))
                                    }
                                    .foregroundStyle(.white)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .background(.white.opacity(0.07))
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(.white.opacity(0.12), lineWidth: 1)
                            )
                            .cornerRadius(14)
                        }
                        // ¿Olvidaste tu contraseña?
                        HStack {
                            Spacer()
                            Text("¿Olvidaste tu contraseña?")
                                .font(.system(size: 13))
                                .foregroundStyle(
                                    Color(red: 0.47, green: 0.31, blue: 1.0).opacity(0.8)
                                )
                        }
                    }
                    .padding(.bottom, 32)
                    
                    // 🟣 BLOQUE 4 — Botón principal + divider + Apple
                    VStack(spacing: 16) {
                        // Botón principal
                        Button {
                            withAnimation(.spring(response: 0.2, dampingFraction: 0.4)) {
                               presionado = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.spring()) {
                                    presionado = false
                                }
                            }
                        } label: {
                            Text("Iniciar Sesion")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 64)
                                .background(
                                    LinearGradient(colors: [Color(red: 0.47, green: 0.31, blue: 1.0),
                                                            Color(red: 0.29, green: 0.56, blue: 1.0)],
                                                   startPoint: .leading,
                                                   endPoint: .trailing)
                                )
                                .cornerRadius(16)
                                .shadow(
                                    color: Color(red: 0.47, green: 0.31, blue: 1.0).opacity(0.5),
                                    radius: 20, x: 0, y: 8
                                )
                        }
                        .scaleEffect(presionado ? 0.96 : 1.0) // 👈 efecto que late
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .preferredColorScheme(.dark)
    }
}

//MARK: - FUNCION REUTILIZABLE PARA TextFiel

// SwiftUI no tiene placeholder con color personalizado por defecto, así que creamos uno nosotros con un ZStack.
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: .leading) {
            if shouldShow { placeholder() }
            self
        }
    }
}

#Preview {
    Login1DarkLuxuryView()
}
