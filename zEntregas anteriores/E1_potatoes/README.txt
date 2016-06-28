Entrega 1: CRUD sobre PAPAS.

Integrantes: David Ruz y Nicolás Gebauer

Esta entrega fue realizada en una version Ruby 2.1.5p273 y Rails 4.2.5.2.
Fue probada en Ubuntu y Mac OS X 10.11.3

La aplicación funciona de una manera bastante sencilla, al iniciarla, 
la primera ventana que se abre es la lista con todos los elementos creados, 
que en nuestro caso dichos elementos son papas y sus distintas variedades. 
Ademas, la página principal cuenta primera opción de crear una nueva
papa, dicho link nos lleva al formulario donde se rellenaran los datos de 
la papa a crear, estos son su nombre, una breve descripción y un link que 
ilustre la imagen de la papa creada, siendo todos estos atributos parte
necesaria de rellenar en el formulario. En las opciones de la lista de papas, 
por cada una de estas, se nos da la opción de poder editar nuestras papas, 
eliminarla y también poder ver una papa en particular.

Las restricciones que se crearon en el formulario de crear o editar una
papa son:
 - El nombre debe contener mas de 5 caracteres
 - La descripción más de 10.
 - Entregar de forma obligatoria un link de imagen de la papa.
En caso de no cumplirse estos requisitos, la aplicación tira un mensaje de error
avisándole al usuario los parámetros que debe arreglar.

