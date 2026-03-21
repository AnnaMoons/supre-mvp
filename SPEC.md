# Supre App - Especificación Técnica

## 1. Resumen del Proyecto

**Nombre:** Supre App  
**Tipo:** Aplicación móvil multiplataforma (iOS/Android)  
**Framework:** Flutter  
**Propósito:** Plataforma de gestión de pagos de créditos de motos para clientes de Supre en Colombia

## 2. Funcionalidades del MVP

### 2.1 Autenticación
- **Login:** Correo electrónico o número de identificación + contraseña
- **Registro:** Información básica del usuario
- **Recuperación de contraseña**

### 2.2 Dashboard Principal
- **Resumen de cuentas por pagar:** Muestra la cuota pendiente más cercana
- **Acceso rápido a Mis Créditos**
- **Notificaciones:** Campana de alertas (pagos próximos, morosidad)
- **Navegación inferior:** Inicio, Mis Créditos, Pagar, Perfil

### 2.3 Mis Créditos
- Lista de todos los créditos del usuario (puede tener 1-6+ créditos)
- Información resumida por crédito:
  - Número de cuota actual / total
  - Estado (al día, pendiente, vencido)
  - Monto próximo a pagar
  - Fecha de vencimiento
- Vista detalle del crédito con tabla de amortización

### 2.4 Pago de Cuotas
- **Pago sugerido:** Cuota vencida o próxima a vencer
- **Opciones de pago:** 
  - Pago mínimo (cuota vencida)
  - Pago total (liquidar crédito)
  - Monto personalizado
- Integración con PSE (PSE2)

### 2.5 Historial de Pagos
- Lista de pagos realizados
- Detalle de cada pago con discriminación:
  - Fecha de pago
  - Monto total
  - Distribución: capital, interés corriente, interés de mora

## 3. Consideraciones UX/UI

### 3.1 Principios de Diseño
- **Simplicidad extrema:** Lenguaje coloquial, no corporativo
- **Accesibilidad:** Para usuarios no bancarizados, nivel académico diverso
- **Claridad:** Estados claros (al día, pendiente, vencido)
- **Feedback:** Confirmaciones visuales de acciones

### 3.2 Propuesta de Historial
Para evitar complejidad con 36+ cuotas:
- **Vista simplificada:** Solo cuotas pagadas vs pendientes
- **Progreso visual:** Barra de progreso del crédito
- **Detalle bajo demanda:** Expandir para ver discriminación

### 3.3 Colores y Branding
- Pendiente de recibir manual de marca
- Estados sugeridos:
  - Verde: Al día
  - Naranja/Amarillo: Pendiente
  - Rojo: Vencido/Mora

## 4. Arquitectura Técnica Propuesta

```
lib/
├── main.dart
├── app/
│   ├── app.dart
│   └── routes.dart
├── core/
│   ├── theme/
│   ├── constants/
│   └── utils/
├── features/
│   ├── auth/
│   ├── dashboard/
│   ├── credits/
│   ├── payment/
│   └── profile/
├── data/
│   ├── models/
│   ├── repositories/
│   └── services/
└── shared/
    ├── widgets/
    └── components/
```

## 5. Estado del Proyecto

- [ ] Proyecto Flutter creado
- [ ] Estructura de carpetas implementada
- [ ] Tema y colores configurados
- [ ] Navegación implementada
- [ ] Pantallas del MVP desarrolladas
- [ ] Integración con backend
- [ ] Pruebas

## 6. Pendientes del Equipo Supre

- [ ] Compartir manual de marca
- [ ] Compartir acceso a Figma
- [ ] Proporcionar documentación de API
- [ ] Definir colores oficiales
- [ ] Aportar iconos/logo en múltiples formatos
- [ ] Compartir perfil de usuario/buyer persona
