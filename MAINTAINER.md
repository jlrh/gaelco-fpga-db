# Mantenimiento del repo-DB (notas internas)

## Qué es este repo

Un repositorio-plantilla de base de datos para el MiSTer Downloader
(theypsilon). GitHub Actions (`.github/workflows/build_db.yml`) escanea el árbol
en cada push a `main`, calcula tamaño + MD5 de cada fichero y publica
`db/db.json.zip`. El árbol del repo = el árbol de la SD del usuario.

Ficheros que el generador EXCLUYE de la BD: `README.md`, `LICENSE`, `.github/`,
`external_files.csv`, y (por el `.gitignore`) logs/temporales. Todo lo demás
(los `.mra` y `.rbf`) entra en la BD.

## Nomenclatura estándar (aplicada 2026-07-01)

- `.rbf`: `corename_YYYYMMDD.rbf`, **sin** prefijo `jt` (el `jt` = marca de
  jotego). MiSTer resuelve `<rbf>corename</rbf>` → `corename_<fecha>.rbf` cogiendo
  la fecha más nueva.
- `<rbf>` dentro del `.mra`: **base corename sin fecha** (como Big Karnak).
  `populate.sh` reescribe el tag automáticamente.
- El `_` como separador evita colisiones de prefijo (`wrally` NO matchea
  `wrally2_*` porque tras "wrally" viene "2", no "_"; ídem `thoop`/`thoop2`).

## Regenerar el contenido

Todo el contenido de `_Arcade/` se genera desde los builds locales con:

```bash
bash populate.sh           # usa SRC=/c/_PROYECTOS/Gaelco/WRally por defecto
SRC=/otra/ruta bash populate.sh
```

El manifiesto (qué core → qué `.rbf` → qué `.mra` → nombre público) vive en el
array `MANIFEST` dentro de `populate.sh`. Para añadir un core nuevo o subir una
versión, edita esa tabla y re-ejecuta. Es idempotente.

## Política de publicación

- **NUNCA** ROMs. Solo `.rbf` + `.mra`. El usuario aporta sus ROMs.
- Solo cores validados en HW. Biomtoy (game-flow WIP) y Glass (cuelgue DS5002
  runtime) quedan FUERA hasta cerrarse.
- Mantener crédito jotego/JTFRAME + GPL-3.0.

## Ficheros grandes (>100 MB)

GitHub rechaza ficheros >100 MB. Si algún día hay un blob (p.ej. gfx de 16 MB
que no quieras versionar), NO lo commitees: añádelo a `external_files.csv`
(Path, URL a un Release, tamaño, MD5) y el downloader lo servirá igual.
Los `.rbf` actuales (~3-4 MB) van directos en el repo.

## Publicar

```bash
git add -A && git commit -m "Release 20260701" && git push origin main
```

Actions genera la rama `db` con `db.json.zip`. Verifica en la pestaña *Actions*.
