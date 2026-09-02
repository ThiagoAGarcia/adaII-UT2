## Inicio

Requiere Docker Desktop (Windows) o Docker Engine con Compose v2.

En Windows PowerShell:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\start.ps1
```

En Linux o macOS:

```bash
bash ./scripts/start.sh
```

La API queda disponible en <http://localhost:8000> y Swagger en
<http://localhost:8000/docs>.

Usuario demo: `demo@adaii.local` / `Demo123!`.

Para detener los servicios:

```bash
docker compose down
```

## Otros comandos

- Iniciar la API y MySQL:
  ```bash
  bash ./scripts/start.sh
  ```
- Construir manualmente una versión:
  ```bash
  bash ./scripts/build_version.sh 1.1 false
  ```
- Desplegar la versión construida:
  ```bash
  bash ./scripts/deploy.sh 1.1
  ```
- Ejecutar la demostración de tácticas:
  ```bash
  bash ./scripts/demo_tacticas.sh
  ```
- Ejecutar la demostración de rollback:
  ```bash
  bash ./scripts/demo_rollback.sh
  ```
- Iniciar directamente en modo desarrollo:
  ```bash
  [ -f .env ] || cp .env.example .env
  docker compose -f docker-compose.dev.yaml up --build
  ```

## Definición de requerimientos

### Rollback

- **RNF-01 - Recuperación ante un despliegue defectuoso:** Se requiere que si se detecta un error en la versión actual al momento del despliegue de una nueva versión de la API, esta sea capaz de restaurar la última versión estable.
- **RNF-02 - Identificación de versión:** Antes de desplegar una nueva versión de la API, el despliegue deberá conservar la identificación y configuración de la última versión, de modo que esta pueda ser restaurada si la nueva versión presenta errores.

### Polimorfismo

- **RNF-03 - Uso del patrón Strategy para el sistema de compra:** El costo de la compra deberá adaptarse a diferentes políticas de cálculo sin modificar la lógica principal de la API. Por ejemplo, durante las festividades de invierno todos los juegos tendrán un 50% de descuento.

### Aspectos

- **RNF-04 - Registro a través de aspecto:** Al ejecutar operaciones en la API, se deberá mantener un registro de cada una de ellas, incluyendo al menos la operación realizada y la fecha y hora de ejecución. El registro deberá almacenarse en un archivo `.txt` persistente mediante un volumen asociado al contenedor.
