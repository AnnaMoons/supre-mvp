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
   git clone <repo-url>
   cd Supre
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
| Naranja CTA | `#F59E0B` | Botones de acción |

## Funcionalidades

### Prototipo MVP

1. **Autenticación**
   - Login con correo/identificación
   - Registro de usuario
   - Recuperación de contraseña (con OTP)

2. **Dashboard**
   - Saludo personalizado
   - Carrusel de cuotas por pagar
   - Acceso rápido a créditos

3. **Mis Créditos**
   - Lista de créditos con estado
   - Progreso de cada crédito
   - Detalle de crédito con:
     - Información general
     - Próximos pagos
     - Detalles de cada cuota

4. **Pagos**
   - Selección de crédito
   - Opciones: pago mínimo, saldo vencido, pago total, valor personalizado
   - Integración PSE (mock)

5. **Perfil**
   - Información del usuario
   - Historial de pagos
   - Notificaciones

## Screenshots

Para ver la app:
```bash
flutter run -d chrome
```

## Desarrollo

### Servidor local para Web

```bash
cd build/web
python3 -m http.server 8080
# Abrir http://localhost:8080
```

### Tips

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
