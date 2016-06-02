# IIC2513 - Tecnologías y aplicaciones web

## Heroku
Configurado para hacer deploy automático del branch `master` en la [aplicación principal](http://nidastore.herokuapp.com)  
También para hacer deploy automático del branch `dev` en la [aplicación de prueba](http://devnidastore.herokuapp.com)

## Entregas
- [E6](#e6)
- [E5](#e5)
- [E4](#e4)

***

### [E6](/A%20Docs%20tareas/E6.pdf)
El commit corriendo en heroku es [37488d5](https://github.com/negebauer/nidastore/commit/37488d5a0c90ff5ed38ca028010b5f753de4ac15)  
Todos los productos tienen una misma imagen  
Ahora hay más productos en la familia de computadores para poder probar la paginación  

##### Ayuda corrección - ¿Que tan cumplida fue la tarea?
- Funcionalidad
  - Paginación vía AJAX:
    - La hay en todas las secciones, se puede probar en la sección de computadores
    - Se cargan un máximo de 8 productos por página
    - La lógica está ordenada
  - Vista previa:
    - Hay vista previa de la información de un producto construida con atributos data-X
    - Hay 3 vistas previas: Image, información y más opciones
  - Validación formularios:
    - Todos los formularios (admin y usuario) tienen validación por javascript
    - Usuario:
      - [cambiar mail](https://nidastore.herokuapp.com/profile/edit)
      - [cambiar clave](https://nidastore.herokuapp.com/profile/edit_password)
    - Admin:
      - [editar usuario](https://nidastore.herokuapp.com/admin/users/7/edit)
      - [editar contraseña usuario](https://nidastore.herokuapp.com/admin/users/7/edit_password)
      - [crear usuario](https://nidastore.herokuapp.com/admin/users/new)
      - [crear producto](https://nidastore.herokuapp.com/admin/products/new)
      - [editar producto](https://nidastore.herokuapp.com/admin/products/6/edit)
- Calidad del código
  - No hay javascript en el html
  - Los js son cargados en el head en el [base_layout](https://github.com/negebauer/nidastore/blob/37488d5a0c90ff5ed38ca028010b5f753de4ac15/app/views/layouts/_base_layout.html.erb)
- Layout y diseño
  - Layout mejorado (arreglos)
  - Colores para llamar la atención

***

### [E5](/A%20Docs%20tareas/E5.pdf)
El commit que corre en heroku para esta entrega es [a1b09eb](https://github.com/negebauer/nidastore/commit/a1b09eba625ad41df27d3db5de99c4158cd92c1f)  
El más reciente al momento de terminar de escribir esto (y que corre en el servidor dev) es [04a871a](https://github.com/negebauer/nidastore/commit/04a871ab33244cc6f2718407d4a546f01cd28d33) que tiene un pequeño cambio en como se muestran los detalles del producto.  
Para la corrección de esta entrega se creó el usuario `admin` con clave `admin`, el cual, redoble de tambores, es un admin  
Los datos por defecto están en el archivo [seeds](https://github.com/negebauer/nidastore/blob/0ac04c8fc81616ce8926be471222c2257c51a618/db/seeds.rb)

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
  - Ver detalles de un producto
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
