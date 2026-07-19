# Gaelco Arcade — MiSTer database  ·  ⚠️ MOVIDA

> ## 📦 Esta base de datos se ha unificado en **[`jlrh-misterfpga-db`](https://github.com/jlrh/jlrh-misterfpga-db)**
>
> Ahora hay **un único db por plataforma** con **todos** los cores arcade de jlrh
> (Gaelco, Taito/Seibu, …), no uno por familia. **Cambia tu `db_url`** por el nuevo:
>
> ```
> https://raw.githubusercontent.com/jlrh/jlrh-misterfpga-db/db/db.json.zip
> ```
>
> El MiSTer Downloader **deduplica por hash**: al cambiar la URL no vuelves a
> descargar los cores que ya tienes — el coste es **una línea, una vez**.

---

## Cómo migrar

### Update All
1. `Scripts → update_all` → **Databases**.
2. **Quita** la URL vieja de `gaelco-fpga-db` y **añade** la nueva:
   ```
   https://raw.githubusercontent.com/jlrh/jlrh-misterfpga-db/db/db.json.zip
   ```
3. Guarda y ejecuta.

### Downloader (`downloader.ini`)
Sustituye la sección `[jlrh/gaelco-fpga-db]` por:
```ini
[jlrh/jlrh-misterfpga-db]
db_url = https://raw.githubusercontent.com/jlrh/jlrh-misterfpga-db/db/db.json.zip
```

---

Este repositorio se conserva por compatibilidad (el `db/db.json.zip` antiguo sigue
disponible durante la transición), pero **ya no se actualiza**: los cores Gaelco
nuevos y sus revisiones salen únicamente en `jlrh-misterfpga-db`.

Cores construidos sobre **[JTFRAME](https://github.com/jotego/jtframe)** de
**Jose Tejada (jotego)**. Publicados bajo **GPL-3.0** (ver `LICENSE`).
