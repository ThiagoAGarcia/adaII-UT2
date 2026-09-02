# ADAII UT2 TFU - Tácticas de Arquitectura

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
