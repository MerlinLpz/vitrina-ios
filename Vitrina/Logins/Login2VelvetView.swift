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
    static let bgTop    = Color(red: 0.20, green: 0.08, blue: 0.35) // indigo oscuro
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
    @State private var email: String = ""       // 👈 agrega
    @State private var password: String = ""     // 👈 agrega
    @State private var showPassword: Bool = false // 👈 agrega
    @State private var isPressed: Bool = false  // 👈 agrega
    @State private var logoFlotando: Bool = false // 👈 agrega
    
    @FocusState private var focusedField: Field? //detecta cuál campo tiene el teclado activo en tiempo real.
    enum Field {  case email, password }  //define los dos campos posibles: .email y .password.
    
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
                .opacity(0.75)
                .rotationEffect(.degrees(haloAngle / 8)) // rota 8x más lento
                .offset(y: -280)      // 👈 lo sube arriba de la card
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
            VStack(spacing: 50) {
                
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
                            .rotationEffect(.degrees(45))
                    }
                    
                    // Nombre de la marca
                    Text("LUXURY")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .tracking(0.3) // Espacio entre las letras
                }
                
                
                .offset(y: logoFlotando ? -6 : 0)            // 👈 todo el VStack flota
                .animation(.easeInOut(duration: 2)
                .repeatForever(autoreverses: true), value: logoFlotando)
                .onAppear {
                    logoFlotando = true             // 👈 los dos juntos aquí
                    withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                        haloAngle = 360
                    }
                }
                .padding(.top, 60)
                
                
                
                // 🟣 BLOQUE 4 — Glass Card (siguiente paso)
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Título
                    Text("Sign in")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(.white)
                        .tracking(-0.4) // Letras esten mas ajustadas
                    
                    // Subtítulo
                    Text("Welcome back, please enter your details.")
                        .font(.system(size: 13))
                        .foregroundStyle(.white.opacity(0.55))
                        .padding(.top, 6)
                        .padding(.bottom, 22)
                    
                    // 🟣 BLOQUE 5 — Floating Fields
                    VStack(spacing: 12) {
                        
                        // Campo Email
                        FloatingField(
                            label: "Email",
                            systemIcon: "envelope",
                            text: $email,
                            isSecure: false,
                            isFocused: focusedField == .email
                        )
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        
                        // Campo Contraseña
                        FloatingField(
                            label: "Password",
                            systemIcon: "lock",
                            text: $password,
                            isSecure: !showPassword,
                            isFocused: focusedField == .password,
                            trailing: {
                                Button {
                                    showPassword.toggle()
                                } label: {
                                    Image(systemName: showPassword ? "eye.slash" : "eye")
                                        .font(.system(size: 16))
                                        .foregroundStyle(.white.opacity(0.45))
                                        .frame(width: 36, height: 36)
                                        .contentShape(Rectangle())
                                }

                            }
                        )
                    }
                    .padding(.bottom, 10)
                    
                    // ¿Olvidaste tu contraseña?
                    HStack {
                        Spacer()
                        Button("Forgot password?") { }
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(Palette.accentSoft.opacity(0.85))
                    }
                    .padding(.bottom, 10)
                    
                    // 🟣 BLOQUE 6 — Botón (siguiente paso)
                    Button {
                        // acción de login aquí
                        
                    } label: {
                        HStack(spacing: 10) {
                            Text("Sign in to Luxuri")
                                .font(.system(size: 15, weight: .semibold))
                                .tracking(0.3)
                            Image(systemName: "arrow.right")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            ZStack {
                                // ─── Halo giratorio ───────────────────────────
                                // Gradiente angular que rota con haloAngle
                                // El blur lo convierte en resplandor, no en rueda
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(
                                        AngularGradient(
                                            colors: [
                                                Palette.accentPink,
                                                Palette.accentViolet,
                                                Palette.accentIndigo,
                                                Palette.accentPink
                                            ],
                                            center: .center
                                        )
                                    )
                                    .blur(radius: 8)
                                    .padding(-2)
                                    .rotationEffect(.degrees(haloAngle)) // 👈 usa el mismo haloAngle del orbe
                                    .opacity(0.7)
                                
                                // ─── Pill oscuro encima ───────────────────────
                                // Tapa el centro del halo dejando solo el borde brillante
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(
                                        LinearGradient(
                                            colors: [Palette.bgTop, Palette.bgMid],
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                                            .stroke(.white.opacity(0.10), lineWidth: 1)
                                            .blendMode(.plusLighter)
                                    )
                            }
                                 // xxxxx
                        )
                        .scaleEffect(isPressed ? 0.98 : 1.0)
                        .animation(.spring(response: 0.25, dampingFraction: 0.7), value: isPressed)
                    }
                    .buttonStyle(PressableButtonStyle(isPressed: $isPressed))
                    
                    // 🟣 BLOQUE 7 — Divider + Apple + Footer ───────────────────────
                    
                    // Divider "OR"
                    HStack(spacing: 12) {
                        Rectangle()
                            .fill(.white.opacity(0.08))
                            .frame(height: 1)
                        Text("OR")
                            .font(.system(size: 11, weight: .semibold))
                            .tracking(1.5)
                            .foregroundStyle(.white.opacity(0.35))
                        Rectangle()
                            .fill(.white.opacity(0.08))
                            .frame(height: 1)
                    }
                    .padding(.vertical, 18)
                    
                    // Botón Apple
                    Button { } label: {
                        HStack(spacing: 18) {
                            Image(systemName: "apple.logo")
                                .font(.system(size: 16))
                            Text("Continue with Apple")
                                .font(.system(size: 14, weight: .medium))
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .fill(.white.opacity(0.05))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .stroke(.white.opacity(0.1), lineWidth: 1)
                                )
                        )
                        
                    }
                    
                    // Footer
                    HStack(spacing: 4) {
                        Text("New here?")
                            .foregroundStyle(.white.opacity(0.45))
                        Button("Create account") { }
                            .foregroundStyle(Palette.accentSoft)
                            .fontWeight(.semibold)
                    }
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity)
                    .padding(.top, 16)
                }
                .padding(.horizontal, 24)
                .padding(.top, 32)
                .padding(.bottom, 48)
                .background(
                    ZStack {
                        // Capa 1 — vidrio con tinte púrpura oscuro
                        RoundedRectangle(cornerRadius: 32, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Palette.accentViolet.opacity(0.15),
                                        Palette.bgMid.opacity(0.6)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        
                        // Capa 2 — material de vidrio encima
                        RoundedRectangle(cornerRadius: 32, style: .continuous)
                            .fill(.ultraThinMaterial.opacity(0.3)) // 👈 menos opaco
                        
                        // Capa 3 —  borde sutil
                        RoundedRectangle(cornerRadius: 32, style: .continuous)
                            .stroke(.white.opacity(0.12), lineWidth: 1)
                        
                        // Capa 4 — brillo en el borde superior
                        // Simula la luz tocando el borde del vidrio
                        RoundedRectangle(cornerRadius: 32, style: .continuous)
                            .strokeBorder(
                                LinearGradient(
                                    colors: [.white.opacity(0.25), .clear, .clear],
                                    startPoint: .top,
                                    endPoint: .bottom
                                ),
                                lineWidth: 1
                            )
                    }
                )
                // xxxxx
                .ignoresSafeArea(edges: .bottom) // 👈 llega hasta el fondo
                .frame(maxHeight: .infinity) // 👈 ocupa todo el espacio restante
                .shadow(color: .black.opacity(0.5), radius: 40, y: 20)
                .padding(.horizontal, 4)
                .padding(.bottom, 0)
                
                Spacer()
            }
            
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Pressable Button Style
// Detecta cuando el botón está físicamente presionado
// y lo comunica al @State isPressed de la vista padre
struct PressableButtonStyle: ButtonStyle {
    @Binding var isPressed: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .onChange(of: configuration.isPressed) { _, newValue in
                isPressed = newValue
            }
    }
}


// MARK: - Floating Field

struct FloatingField<Trailing: View>: View {
    
    let label: String
    let systemIcon: String
    @Binding var text: String
    let isSecure: Bool
    let isFocused: Bool
    @ViewBuilder var trailing: () -> Trailing
    
    @FocusState private var campoActivo: Bool // 👈 CAMBIO 1 — agrega esto
    
    init(
        label: String,
        systemIcon: String,
        text: Binding<String>,
        isSecure: Bool,
        isFocused: Bool,
        @ViewBuilder trailing: @escaping () -> Trailing = { EmptyView() }
    ) {
        self.label = label
        self.systemIcon = systemIcon
        self._text = text
        self.isSecure = isSecure
        self.isFocused = isFocused
        self.trailing = trailing
    }
    
    // El label flota cuando el campo está activo O tiene texto
    private var isFloating: Bool { isFocused || !text.isEmpty || campoActivo } // 👈 CAMBIO 2 — agrega campoActivo
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            // Fondo del campo
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(
                            campoActivo // 👈 CAMBIO 3 — usa campoActivo en vez de isFocused
                    
                            ? Palette.accentSoft.opacity(0.5)
                            : .white.opacity(0.08),
                            lineWidth: 1
                        )
                )
                // Glow suave cuando está activo
                .shadow(
                    color:  campoActivo ? Palette.accentViolet.opacity(0.25) : .clear, // 👈 CAMBIO 4
                    radius: 4
                )
            
            HStack(spacing: 12) {
                
                // Ícono izquierdo — cambia de color al activarse
                Image(systemName: systemIcon)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(
                        campoActivo ? Palette.accentSoft : .white.opacity(0.5) // 👈 CAMBIO 5
                    )
                    .frame(width: 18)
                
                ZStack(alignment: .leading) {
                    
                    // Label flotante
                    Text(label)
                        .font(.system(
                            size: isFloating ? 10 : 14,
                            weight: isFloating ? .semibold : .regular
                        ))
                        .tracking(isFloating ? 1.5 : 0)
                        .foregroundStyle(
                            isFloating
                            ? Palette.accentSoft.opacity(0.8)
                            : .white.opacity(0.5)
                        )
                        .offset(y: isFloating ? -14 : 0)
                        .textCase(isFloating ? .uppercase : nil)
                        .animation(.easeInOut(duration: 0.22), value: isFloating)
                    
                    // Input real — aparece cuando el label sube
                    Group {
                        if isSecure {
                            SecureField("", text: $text)
                        } else {
                            TextField("", text: $text)
                        }
                    }
                    .focused($campoActivo) // 👈 CAMBIO 6 — focus directo al input
                    .font(.system(size: 15))
                    .foregroundStyle(.white)
                    .tint(Palette.accentSoft)
                    .offset(y: 8)
                    .opacity(isFloating ? 1 : 0.01) //xxxxxxxxx
                }
                
                trailing()
            }
            .padding(.horizontal, 16)
        }
        .contentShape(Rectangle()) //xxxxxxxxx
        .frame(height: 60)
        .onTapGesture {
            campoActivo = true // 👈 CAMBIO 7 — al tocar activa el teclado
        }
    }
}

#Preview {
    Login2VelvetView()
}
