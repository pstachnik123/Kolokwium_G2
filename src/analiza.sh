#!/usr/bin/env bash
# Kolokwium — plik do samodzielnego uzupełnienia.
# Uruchomienie: bash src/analiza.sh dane
# Wynik: nazwa.log;liczba_ERROR;STATUS
KATALOG="${1:-dane}"
status="OK"
if [[ -d "$KATALOG" ]]; then
for PLIK in "$KATALOG"/*.log; do
[[ -f "$PLIK" ]] || continue
ilee=$(grep  -c "^ERROR" "$PLIK")
ilew=$(grep -c "TIMEOUT" "$PLIK")

if [ "$ilew" -ge 2 ]; then
    status="ALARM"
fi

printf '%s, %s, %s, %s' "$PLIK" "$ilee" "$ilew" "$status"

done
else
echo "Brak katalogu" >&2
exit 2
fi
# TODO 2: if -d; błąd na stderr i exit 2.
# TODO 3: for po *.log; uwzględnij katalog bez plików .log.
# TODO 4: grep i liczenie wierszy ERROR dla każdego pliku.
# TODO 5: if wyznaczający STATUS zgodnie z ZADANIA.md.
# TODO 6: printf trzy pola oddzielone średnikami.
