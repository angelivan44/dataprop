# README

## Overview

Este documento proporciona instrucciones para configurar y ejecutar la aplicación localmente, así como información sobre cómo desplegarla.

## Requisitos previos

- Ruby `3.0.5`
- postgres

## Configuración local

1. **Clona el repositorio**:
    ```bash
    git clone [URL_del_repositorio]
    ```

2. **Instala las gemas**:
    ```bash
    bundle install
    ```

3. **Configuración del entorno**:
   (Explica cualquier archivo o variable de entorno que necesite ser configurada.)

4. **Creación de la base de datos**:
    ```bash
    rails db:create
    rails db:migrate
    ```

5. **Inicialización de la base de datos**:
   ```bash
    rails db:seed
    ```

6. **Ejecución local**:
    ```bash
    rails server
    ```

   Navega a `http://localhost:3000` en tu navegador para ver la aplicación en acción.

#
## Instrucciones de despliegue

Para desplegar la aplicación, simplemente realiza un push a la rama `main`:
```bash
git push origin main
```
## URL de despliegue

Para desplegar la aplicación, simplemente realiza un push a la rama `main`:
```bash
https://dataprop-i0tx.onrender.com/
```