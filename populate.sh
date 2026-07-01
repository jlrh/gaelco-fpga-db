#!/usr/bin/env bash
# Puebla _Arcade/ (mra + cores/rbf) desde los builds locales, aplicando la
# nomenclatura estándar: corename_YYYYMMDD.rbf (sin 'jt') y <rbf>corename</rbf>
# reescrito dentro de cada .mra. Idempotente: re-ejecutable.
#
#   bash populate.sh
#   SRC=/otra/ruta bash populate.sh
set -euo pipefail

DATE=20260701
SRC="${SRC:-/c/_PROYECTOS/Gaelco/WRally}"
DB="$(cd "$(dirname "$0")" && pwd)"
ARC="$DB/_Arcade"
CORES="$ARC/cores"
mkdir -p "$CORES"

# corename | rbf origen (rel. a $SRC) | mra origen (rel. a $SRC) | nombre .mra público
MANIFEST=(
  "bigkarnk|builds/bigkarnk_20260701.rbf|mra/Big Karnak (Gaelco, 1991).mra|Big Karnak (Gaelco, 1991).mra"
  "thoop|builds/jtthoop_V005.rbf|mra/Thunder Hoop (Gaelco, V.013).mra|Thunder Hoop (Gaelco, 1992).mra"
  "squash|builds/jtsquash_V011.rbf|mra/Squash (Gaelco, V.010).mra|Squash (Gaelco, 1992).mra"
  "wrally|builds/wrally_20260701.rbf|mra/World Rally Championship (Gaelco, 1993).mra|World Rally Championship (Gaelco, 1993).mra"
  "aligator|builds/jtaligator_V016.rbf|mra/Alligator Hunt (Gaelco, V.002).mra|Alligator Hunt (Gaelco, 1994).mra"
  "thoop2|builds/jtthoop2_V005.rbf|mra/TH Strikes Back (Gaelco, V.002).mra|TH Strikes Back (Gaelco, 1994).mra"
  "biomtoy|builds/jtbiomtoy_V002.rbf|mra/Biomechanical Toy (Gaelco, V.001).mra|Biomechanical Toy (Gaelco, 1995).mra"
  "wrally2|builds/jtwrally2_V010.rbf|mra/World Rally 2 (Gaelco, 1995, V.014).mra|World Rally 2 (Gaelco, 1995).mra"
)

echo "SRC = $SRC"
echo "DB  = $DB"
echo

for row in "${MANIFEST[@]}"; do
  IFS='|' read -r core rbf mra pubmra <<< "$row"

  [ -f "$SRC/$rbf" ] || { echo "FALTA rbf: $SRC/$rbf" >&2; exit 1; }
  [ -f "$SRC/$mra" ] || { echo "FALTA mra: $SRC/$mra" >&2; exit 1; }

  # 1) rbf -> corename_DATE.rbf
  cp -f "$SRC/$rbf" "$CORES/${core}_${DATE}.rbf"

  # 2) mra -> nombre público. Reescribe <rbf> a la base corename (sin jt/fecha)
  #    y <name> al título público "Nombre del juego (Gaelco, YYYY)".
  title="${pubmra%.mra}"
  sed -E -e "s#<rbf>[^<]*</rbf>#<rbf>${core}</rbf>#" \
         -e "s#<name>[^<]*</name>#<name>${title}</name>#" \
         "$SRC/$mra" > "$ARC/$pubmra"

  printf 'OK  %-9s -> cores/%s_%s.rbf  +  %s\n' "$core" "$core" "$DATE" "$pubmra"
done

echo
echo "Hecho. Revisa _Arcade/ y haz commit."
