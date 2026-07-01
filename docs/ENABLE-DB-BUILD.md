# Activar la generación automática de la base de datos

El repo se publicó **sin** el workflow de GitHub Actions porque el token usado no
tenía el scope `workflow`. Añádelo una sola vez desde la web (tu sesión de
navegador sí tiene permiso):

1. En el repo → **Add file → Create new file**.
2. Nombre del fichero: `.github/workflows/build_db.yml`
3. Pega el contenido de [`build_db.workflow.yml`](build_db.workflow.yml) (en esta
   misma carpeta `docs/`).
4. **Commit** a `main`.

En cuanto se cree, el Action se dispara solo (o desde *Actions → Run workflow*),
escanea el árbol y publica `db/db.json.zip`. A partir de ahí la URL de la base de
datos es:

```
https://raw.githubusercontent.com/jlrh/gaelco-fpga-db/db/db.json.zip
```

> Alternativa: regenerar el PAT de `jlrh` con el scope `workflow` marcado; entonces
> se puede subir el workflow por `git push` normal.
