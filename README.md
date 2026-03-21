# Supre App

Aplicación móvil para gestión de pagos de créditos de motos en Colombia.

## Requisitos

- **Flutter SDK** 3.24 o superior
- **Dart** 3.4 o superior
- **Xcode** (para iOS)
- **Android SDK** (para Android)

## Instalación Rápida

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/AnnaMoons/supre-mvp.git
   cd supre-mvp
   ```

2. **Instalar dependencias:**
   ```bash
   flutter pub get
   ```

3. **Ejecutar en Web:**
   ```bash
   flutter run -d chrome
   # o
   flutter run -d web-server --web-port=8080
   ```

4. **Ejecutar en iOS Simulator:**
   ```bash
   flutter run -d iphone
   ```

5. **Ejecutar en Android:**
   ```bash
   flutter run -d android
   ```

## Build para Producción

### Web
```bash
flutter build web
# Los archivos se generan en build/web/
```

### iOS
```bash
flutter build ios --release
```

### Android
```bash
flutter build apk --release
```

## Estructura del Proyecto

```
Supre/
├── lib/
│   └── main.dart              # Toda la aplicación (prototipo MVP)
├── assets/
│   ├── Logo fondo claro.png
│   ├── Logo fondo naranja.png
│   ├── Logo fondo oscuro.png
│   └── typography/
│       ├── Gilroy-ExtraBold.otf
│       └── Gilroy-Light.otf
├── web/
│   ├── index.html            # Entry point web
│   └── favicon.png           # Favicon
├── build/
│   └── web/                  # Build web production
├── pubspec.yaml              # Dependencias y configuración
└── README.md
```

## Colores de Marca

| Color | Hex | Uso |
|-------|-----|-----|
| Naranja | `#F28D16` | CTAs, elementos destacados |
| Azul Marino | `#1C2546` | Textos, headers |
| Gris | `#575756` | Textos secundarios |
| Azul Navegación | `#306EE8` | Indicadores, progreso |
| Verde Éxito | `#22C55E` | Progreso de crédito |
| Naranja CTA | `#F59E0B` | Botones de acción |

## Pantallas

### 1. WelcomeScreen
Pantalla de inicio con logo, slogan y botones de Login/Registrarse.

### 2. LoginScreen
Autenticación con email y contraseña.

### 3. RegisterScreen
Formulario completo de registro de usuario.

### 4. ForgotPasswordScreen
Recuperación de contraseña con flujo de 4 pasos con OTP.

### 5. DashboardScreen
- Saludo personalizado
- Carrusel de cuotas por pagar
- Acceso rápido a créditos

### 6. CreditsListScreen
Lista de créditos con:
- Nombre y estado del crédito
- Barra de progreso
- Próxima cuota y fecha límite

### 7. CreditDetailScreen
Detalle completo del crédito:
- Nombre, referencia, estado
- Cuota por pagar (destacada en naranja)
- Indicadores: Total pagado y Saldo total por pagar
- Barra de progreso con porcentaje
- Detalles del crédito (expandible)
- Próximos pagos (expandibles)
- CTAs: Pagar cuota actual, Ver historial de pagos

### 8. PaymentScreen
Selección de crédito y opciones de pago:
- Pago mínimo
- Saldo vencido
- Pago total
- Valor personalizado

### 9. PSEScreen
Formulario de pago PSE con:
- Tipo y número de documento
- Selección de banco
- Resumen del pago

### 10. PaymentSuccessScreen
Confirmación de pago exitoso con comprobante.

### 11. PaymentHistoryScreen
Lista de pagos realizados con:
- Modal detallado por cada pago
- Información: factura, fecha, hora, método, montos
- Descarga de comprobante PDF

### 12. NotificationsScreen
Centro de notificaciones con:
- Estados: leído/no leído
- Eliminar notificaciones
- Detalle de cada notificación

### 13. HelpCenterScreen
Centro de ayuda con:
- 8 preguntas frecuentes expandibles
- Opciones de contacto: correo y teléfono

### 14. AboutScreen
Información de la app:
- Versión y datos de la app
- Contacto
- Términos y condiciones

### 15. ProfileScreen
Perfil del usuario con:
- Avatar e información
- Notificaciones
- Ayuda
- Acerca de
- Cerrar sesión (con confirmación)

## Funcionalidades

### Prototipo MVP

1. **Autenticación**
   - Login con correo/identificación
   - Registro de usuario
   - Recuperación de contraseña (con OTP)
   - Logout funcional

2. **Dashboard**
   - Saludo personalizado
   - Carrusel de cuotas por pagar
   - Acceso rápido a créditos

3. **Mis Créditos**
   - Lista de créditos con estado
   - Barra de progreso por crédito
   - Detalle de crédito completo

4. **Pagos**
   - Selección de crédito
   - Opciones: pago mínimo, saldo vencido, pago total, valor personalizado
   - Integración PSE (mock)

5. **Historial de Pagos**
   - Lista de pagos realizados
   - Modal con detalle completo
   - Descarga de comprobante PDF

6. **Centro de Ayuda**
   - Preguntas frecuentes
   - Contacto con soporte

7. **Perfil**
   - Notificaciones
   - Ayuda
   - Acerca de
   - Cerrar sesión

## Servidor local para Web

```bash
cd build/web
python3 -m http.server 8080
# Abrir http://localhost:8080
```

## Tips

- Usar `Cmd+Shift+R` para hard refresh en navegador
- Los cambios en código requieren rebuild: `flutter build web`
- El favicon se encuentra en `web/Isotipo fondo claro.png`

## Equipo

- **Diseño**: Equipo Supre
- **Desarrollo**: Equipo Técnico

## Licencia

Privado - Supre Colombia

---

*"Crecer para ayudar a crecer"*
