# IIC2513Web - Tecnologías y aplicaciones web

## Heroku
Heroku esta configurado para hacer deploy automático del branch `master`
## Entregas
- [E5](#e5)
- [E4](#e4)

***

### [E5](/A%20Docs%20tareas/E5.pdf)

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