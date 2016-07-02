# IIC2513 - Tecnologías y aplicaciones web

## Heroku
Configurado para hacer deploy automático del branch [`master`](https://github.com/negebauer/nidastore/tree/master) en la [aplicación principal](http://nidastore.herokuapp.com)  
También para hacer deploy automático del branch [`dev`](https://github.com/negebauer/nidastore/tree/dev) en la [aplicación de prueba](http://devnidastore.herokuapp.com)

## Entregas
- [EF](#ef)
- [E7](#e7)
- [E6](#e6)
- [E5](#e5)
- [E4](#e4)

***

### [EF](/A%20Docs%20tareas/EF.pdf)
En construcción...

***

### [E7](/A%20Docs%20tareas/E7.pdf)
**IMPORTANTE** **CORRECCION** [__01/07/16 - 21:41__](https://github.com/negebauer/nidastore/commit/5bda7df79071e7d307d7e67ee532ce533da30178) Esta parte esta desactualizada. Se hicieron cambios que invalidan lo descrito en este README para que las pruebas automatizadas funcionen.

__01/07/16 - 22:00__ Se actualizó el README para que refleje los cambios a la API para la corrección automatizada.

***

**IMPORTANTE** El commit [40c873e](https://github.com/negebauer/nidastore/commit/40c873e) aparece en github como si hubiera sido efectuado a las 00:26:01 del 21 pero en realidad fue hecho a las _Mon, 20 Jun 2016 23:26:01 -0400_  

El commit corriendo en heroku es [558c262](https://github.com/negebauer/nidastore/commit/558c262)

Para poder hacer requests se tiene que estar autentificado  
Unas cuentas para utilizar son las siguientes

| username  | password | admin |
|:----------|:---------|:------|
|admin      |admin     |si     |
|admin2     |admin2    |si     |
|nico       |123456    |no     |

Solo las cuentas de admin pueden modificar datos (`PUT`, `PATCH`, `DELETE`)  
Los usuarios normales solo pueden obtener datos (`GET`)

##### Ayuda corrección - ¿Que tan cumplida fue la tarea? - Requests
Para facilitar lectura se omiten llamados repetidos  
Todo debería funcionar bien

- [Prueba 1: Obtención](../../issues/44)
    - [Listado de productos](../../issues/42). Retorna la lista de los `uuids` de los productos. Solo uno tiene uuid actualmente
    ```
    GET
    http://nidastore.herokuapp.com/api/v1/products
    ```
    - Obtención de un producto al azar del listado. En el link provisto hay un producto sugerido
    ```
    GET
    http://nidastore.herokuapp.com/api/v1/products/e13f2f5fca2b61a446d3354df14962d6
    ```
    - Obtención del encabezado (HEAD)
    - Obtención de un producto al azar (distinto)
    - Obtención del encabezado (HEAD)

- [Prueba 2: Creación](../../issues/43)
    - Listado de productos
    - Creación de un nuevo producto
    ```
    PUT
    http://nidastore.herokuapp.com/api/v1/products/e13f2f5fca2b61a446d3354df14962d5
    {
        "product": {
            "name": "test correccion",
            "price": "140",
            "description": "un test para el 7",
            "image":"http://nidastore.herokuapp.com/assets/logo-80b02a832b0460228f4b45fc3985ce5f804cd94c71857757cdeeb835f41e34ce.png"
        }
    }
    ```
    - Listado de productos (ahora debe aparecer el nuevo producto)
    - Obtención del producto
    - Obtención del encabezado (HEAD)
    - Actualización (PUT) sin cambios (es decir, mismo request de creación)
    - Obtención del encabezado (HEAD) – se espera que no haya cambiado

- [Prueba 3: Actualizacion 1](../../issues/45)
    - Listado de producto
    - Obtención de un producto al azar del listado
    - Obtención del encabezado (HEAD)
    - Actualización (PATCH) de un campo del producto
    ```
    PATCH
    http://nidastore.herokuapp.com/api/v1/products/e13f2f5fca2b61a446d3354df14962d6
    {
        "product": {
            "description": "un patch desde postman"
        }
    }
    ```
    - Obtención del encabezado (HEAD) – se espera que haya cambiado
    - Obtención del producto y comprobación del cambio efectuado
    ```
    GET
    http://nidastore.herokuapp.com/api/v1/products/e13f2f5fca2b61a446d3354df14962d6
    ```

- [Prueba 4: Actualizacion 2](../../issues/43)'
    - Listado de productos
    - Obtención de un producto al azar del listado
    - Obtención del encabezado (HEAD)
    - Actualización (PUT) de uno o más campos del producto
    ```
    PUT
    http://nidastore.herokuapp.com/api/v1/products/e13f2f5fca2b61a446d3354df14962d6
    {
        "product": {
            "name": "test actualizacion PUT",
            "price": 140,
            "description": "un test haciendo PUT",
            "image":"http://nidastore.herokuapp.com/assets/logo-80b02a832b0460228f4b45fc3985ce5f804cd94c71857757cdeeb835f41e34ce.png"
        }
    }
    ```
    - Obtención del encabezado (HEAD) – se espera que haya cambiado
    - Obtención del producto y comprobación del cambio efectuado
    ```
    GET
    http://nidastore.herokuapp.com/api/v1/products/e13f2f5fca2b61a446d3354df14962d6
    ```

- [Prueba 5: Eliminación](../../issues/46)
    - Listado de productos
    - Obtención de un producto al azar del listado
    - Eliminación del producto
    ```
    DELETE
    http://nidastore.herokuapp.com/api/v1/products/e13f2f5fca2b61a446d3354df14962d5
    ```
    - Listado de productos (ya no debe aparecer el producto, pero si los demás K productos).
    - Eliminación del mismo producto (chequeo de idempotencia).
    - Listado de productos (aún no aparece el producto, pero si los mismos otros K productos).

- [Prueba 6: Errores](../../issues/58)
    - Ver el issue referenciado ^

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
