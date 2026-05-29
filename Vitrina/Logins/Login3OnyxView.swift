//
//  Login3OnyxView.swift
//  Vitrina
//
//  Created by mierlin on 28/05/2026.
//

import SwiftUI

struct Login3OnyxView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    
    @FocusState private var focusedField: Field?
    enum Field { case email, password }
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
                    
                    // 🟣 BLOQUE 3 — Campos  de texto
                    VStack(spacing: 28) {
                        
                        // Campo Email
                        OnyxField(
                            label: "EMAIL",
                            text: $email,
                            isSecure: false,
                            isFocused: focusedField == .email
                        )
                        .focused($focusedField, equals: .email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .textContentType(.emailAddress)  // 👈 agrega esto
                        
                        // Campo Password
                        OnyxField(
                            label: "PASSWORD",
                            text: $password,
                            isSecure: !showPassword,
                            isFocused: focusedField == .password,
                            showToggle: true,
                            onToggle: { showPassword.toggle() }
                        )
                        .focused($focusedField, equals: .password)
                        .textContentType(.password) 
                    }
                    .padding(.bottom, 12)
                    
                    // Forgot password
                    Button("Forgot password") { }
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(.white.opacity(0.5))
                        .overlay(
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(height: 1)
                                .offset(y: 10)
                        )
                }
                .padding(.horizontal, 48)
            }
            
        }
    }
}

//MARK: - OnyxField
struct OnyxField: View {
    
    let label: String
    @Binding var text: String
    let isSecure: Bool
    let isFocused: Bool
    var showToggle: Bool = false
    var onToggle: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // Label uppercase
            Text(label)
                .font(.system(size: 10, weight: .semibold))
                .foregroundStyle(
                    isFocused ? .white : .white.opacity(0.4)
                )
                .kerning(2)
                .animation(.easeIn(duration: 0.2), value: isFocused)
            
            // Input + toggle
            HStack {
                Group {
                    if isSecure {
                        SecureField("", text: $text)
                    }else {
                        TextField("", text: $text)
                    }
                }
                .font(.system(size: 17))
                .foregroundStyle(.white)
                .tint(.white)
                
                if showToggle {
                    Button {
                        onToggle?()
                    } label: {
                        Image(systemName: isSecure ? "eye" : "eye.slash")
                            .font(.system(size: 16))
                            .foregroundStyle(.white.opacity(0.4))
                    }
                    
                }
            }
            // Línea animada que barre de izquierda a derecha al enfocar
            // Una sola línea que se ilumina al enfocar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    
                    // Línea base — siempre visible
                    Rectangle()
                        .fill(Color.white.opacity(0.15))
                        .frame(width: geo.size.width, height: 1)
                    
                    // Línea animada encima — barre al enfocar
                    Rectangle()
                        .fill(Color.white.opacity(0.6))
                        .frame(width: isFocused ? geo.size.width : 0, height: 1)
                        .animation(.easeInOut(duration: 0.35), value: isFocused)
                }
            }
            .frame(height: 1)
        }
    }
}
#Preview {
    Login3OnyxView()
}
