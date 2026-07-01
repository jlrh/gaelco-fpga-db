# Gaelco Arcade — MiSTer database

Base de datos para el **MiSTer Downloader / Update All** con los cores arcade de
**Gaelco** portados a MiSTer (FPGA). Al añadir esta base de datos, tus `.rbf` y
`.mra` se instalan y **actualizan solos** desde el menú *Scripts*.

> ⚠️ **Solo cores + MRA. Aquí NO hay ROMs.** Los `.mra` son recetas; tú aportas
> tus propias ROMs (colócalas en `games/mame/`). Sin las ROMs correctas el core
> no arranca.

---

## Cómo instalarlo en tu MiSTer

Tienes dos opciones. Con **cualquiera** de las dos, la próxima vez que ejecutes
`update` o `update_all` desde el menú *Scripts* se descargarán los cores.

### Opción A — Update All (recomendada)

1. Abre `Scripts → update_all`.
2. Entra en **Databases** y añade la URL de esta base de datos:
   ```
   https://raw.githubusercontent.com/jlrh/gaelco-fpga-db/db/db.json.zip
   ```
3. Guarda y ejecuta. Update All sincroniza los cores Gaelco junto al resto.

### Opción B — Downloader (manual)

Añade esta sección a tu `downloader.ini` (en la raíz de la SD):

```ini
[jlrh/gaelco-fpga-db]
db_url = https://raw.githubusercontent.com/jlrh/gaelco-fpga-db/db/db.json.zip
```

Luego ejecuta `Scripts → update`.

---

## Cores incluidos

Todos validados en hardware real (MiSTer). Nomenclatura estándar
`corename_YYYYMMDD.rbf`.

| Juego | Año | Core (`.rbf`) | MRA |
|-------|-----|---------------|-----|
| Big Karnak            | 1991 | `bigkarnk_20260701` | Big Karnak (Gaelco, 1991).mra |
| Thunder Hoop         | 1992 | `thoop_20260701`    | Thunder Hoop (Gaelco, 1992).mra |
| Squash               | 1992 | `squash_20260701`   | Squash (Gaelco, 1992).mra |
| World Rally          | 1993 | `wrally_20260701`   | World Rally Championship (Gaelco, 1993).mra |
| Alligator Hunt       | 1994 | `aligator_20260701` | Alligator Hunt (Gaelco, 1994).mra |
| TH Strikes Back      | 1994 | `thoop2_20260701`   | TH Strikes Back (Gaelco, 1994).mra |
| Biomechanical Toy    | 1995 | `biomtoy_20260701`  | Biomechanical Toy (Gaelco, 1995).mra |
| World Rally 2        | 1995 | `wrally2_20260701`  | World Rally 2 (Gaelco, 1995).mra |

*World Rally 2* soporta modo **twin** (2 monitores, 8:3) — se activa por OSD.

### En preparación (aún no incluido)

- **Glass** — bloqueado por un cuelgue de fin de misión (protección DS5002 en
  runtime); no se publica hasta resolverlo.

---

## Estructura del repositorio

La estructura de carpetas se replica **idéntica** en la SD del MiSTer:

```
_Arcade/
├── *.mra              → _Arcade/ en la SD
└── cores/
    └── *.rbf          → _Arcade/cores/ en la SD
```

La base de datos (`db/db.json.zip`) la genera **GitHub Actions** en cada push
(ver la pestaña *Actions*). No hay que construirla a mano.

---

## Créditos y licencia

Cores construidos sobre **[JTFRAME](https://github.com/jotego/jtframe)** de
**Jose Tejada (jotego)**. Publicados bajo **GPL-3.0** (ver `LICENSE`). El prefijo
`jt` se reserva para los cores oficiales de jotego; estos usan `corename` sin `jt`.

Base de datos generada con la
[plantilla DB de theypsilon](https://github.com/theypsilon/DB-Template_MiSTer).
