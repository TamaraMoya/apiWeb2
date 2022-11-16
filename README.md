# API REST para el recurso de perfumes
Una API REST sencilla para manejar un CRUD de productos.

## Importar la base de datos
- importar desde PHPMyAdmin (o cualquiera) dataBase/db_perfumes.sql

## Pueba con postman


## Metodo: GET, Url: http://localhost/projects/apiWeb2/api/perfumes
- Trae todos los perfumes de la base de datos ordenados por defecto de forma ascendente y por marca .

```
PAGINACION
Para solicitar todos los perfumes paginados agregamos los parametros query:

?pagina=1&&limite=5


FILTRO
Para solicitar todos los perfumes filtrados por un parametro especifico se agregan parametros query:

?filtrar=marca&valor=PACO RABANNE
?filtrar=precio&valor=16000


ORDEN
Para solicitar todos los perfumes ordenados por un parametro especifico, se agregan los siguientes parametros query. 
En caso de no especificarse el tipo de orden, por defecto, se ordenara en forma ascendete.

?ordenarPor=precio
?ordenarPor=marca&orden=ASC
?ordenarPor=precio&orden=DESC



ACLARACION: La paginacion, los filtros y el orden no son excluyentes. Pueden combinarse agregando: &&.

?filtrar=marca&valor=CAROLINA HERRERA&&ordenarPor=precio&orden=DESC

```



## Metodo: GET, Url: http://localhost/tucarpetalocal/apiRest/api/perfumes/:ID
- Trae de la base de datos solamente el perfume de la :ID asignada.




## Metodo: POST, Url: http://localhost/tucarpetalocal/apiRest/api/perfumes
- Genera un nuevo elemento en la base de datos, para ello utilizar la siguiente plantilla en el body.

```
{
        "nombre": "Wonderlust",
        "marca": "MICHAEL KORS",
        "tipo": "EdT",
        "tamanio": 100,
        "genero": "Femenino",
        "precio": "16000",
        "imagen": ""
    }
```

## Metodo: PUT, Url: http://localhost/tucarpetalocal/apiRest/api/perfumes/:ID
- Actualiza los campos de un elemento en la base de datos, dado un :ID en especifico. Se debe utilizar la siguiente plantilla.

```
{
        "nombre": "Wonderlust",
        "marca": "MICHAEL KORS",
        "tipo": "EdT",
        "tamanio": 100,
        "genero": "Femenino",
        "precio": "16000",
        "imagen": ""
    }
```
## Metodo: DELETE, Url: http://localhost/tucarpetalocal/apiRest/api/perfumes/:ID
- Se elemina un elemento de la base de datos dado un :ID en especifico.