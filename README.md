# IIC2513 - Tecnologías y aplicaciones web

## Heroku
Configurado para hacer deploy automático del branch `master` en la [aplicación principal](http://nidastore.herokuapp.com)  
También para hacer deploy automático del branch `dev` en la [aplicación de prueba](http://devnidastore.herokuapp.com)

## Entregas
- [E5](#e5)
- [E4](#e4)

***

### [E5](/A%20Docs%20tareas/E5.pdf)
El commit que corre en heroku para esta entrega es [poner commit](https://github.com/negebauer/nidastore)  
Para la corrección de esta entrega se creó el usuario `admin` con clave `admin`, el cual, redoble de tambores, es un admin  
Los datos por defecto están en el archivo [seeds](/db/seeds.rb)

También se completaron los requerimientos de la [E4](#e4) que no fueron cumplidos anteriormente, _excepto_ la recuperación de claves

Nuestro modelo de productos tiene un atributo `family` el cual define la familia del producto. Este se utiliza para filtrar los productos que se muestran en cada catálogo. Para esta entrega las familias son las siguientes

| family  | Familia |
|:--------|:--------|
|0|promocion|
|1|Computadores|
|2|Desodorantes|

##### Ayuda corrección - ¿Que tan cumplida fue la tarea?
- Administración
  - Crear productos
  - Editar productos
  - Eliminar productos
- Catálogos
  - Se pueden ver los 3 catálogos (compus, desodorantes y promociones)
  - Ver detalles de un producto - TODO
- Control de acceso
  - Las páginas de manejo de productos solo son accesibles por el admin. Si un no admin intenta abrir una se redirige a `/profile`
- Localización (administrador, usuario y catalogo)
  - Localización por defecto `es`
  - Creado archivo de localización [`config/locales/es.yml`](/config/locales/es.yml)
  - Todas las páginas tienen su texto en español
- Layout
  - No sabemos mucho de colores

***

### [E4](/A%20Docs%20tareas/E4.pdf)
El commit que corre en heroku corresponde al commit [32ecbf1](https://github.com/negebauer/nidastore/commit/32ecbf19e78fa803145ba67d3b76efb481eeae3c) ya que los commits que le siguen rompieron la aplicación, favor recorregir ahí.  
Los usuarios de prueba para esta entrega son los siguientes (las claves son fáciles a proposito)

| username  | password | admin | activa |
|:----------|:---------|:------|:-------|
|nico|123456|si|si|
|david|123456|no|si|
|diego|123456|no|no|

##### Ayuda corrección - ¿Que tan cumplida fue la tarea?
- Se tiene usuario regular y admin, definidos por el atributo `admin` de usuario.
- El acceso de regular y admin es en la misma página, al admin le aparece un boton para ir al menu de admin
- Las rutas de admin no estan bajo la ruta `/admin`, están bajo la ruta `/users`
- La ruta `/user` solo es accesible para el admin, si un usuario regular ingresa se le redirige a su perfil (`/profile`)
- El admin puede
  - Ver lista usuario
  - Crear usuario (con validadores de datos)
  - Ver datos usuario
  - Editar datos (contraseña y datos todo junto)
  - Bloquear cuenta
  - Reactivar cuenta
- El usuario regular puede
  - Ver sus datos
  - Salir del sistema
  - Puede ir a seccion admin si es admin
- La recuperación de clave no se alcanzo a implementar
- Manejo seguro de claves tampoco
- Usuario regular no puede cambiar sus datos
