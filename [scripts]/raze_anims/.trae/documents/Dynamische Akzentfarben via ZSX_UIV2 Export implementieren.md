Ich werde die Akzentfarben im Skript dynamisch gestalten, sodass sie auf den Export von `ZSX_UIV2` reagieren. Dabei werden die Farbunterschiede wie gewünscht beibehalten.

## Geplante Änderungen:

### 1. CSS-Variablen einführen
In der [style.css](file:///c:/Users/Stulle/Documents/Gute%20Scripts/-Raze_anims/raze_anims/html/css/style.css) werde ich CSS-Variablen definieren, um die Farben an einer zentralen Stelle steuerbar zu machen:
- `--accent-main` (Initial `#990D35`)
- `--accent-dark` (Initial `#550d21`)
- `--accent-rgba` (Initial `rgba(216, 17, 90, 0.80)`)

Alle Vorkommen der festen Farbcodes werden durch diese Variablen ersetzt.

### 2. Farben vom Lua-Export abrufen
In der [nui.lua](file:///c:/Users/Stulle/Documents/Gute%20Scripts/-Raze_anims/raze_anims/client/nui.lua) werde ich beim Öffnen des Menüs den Export aufrufen:
- `local accentColor = exports['ZSX_UIV2']:GetColor(rgb)`
- Diese Farbe wird via `SendNUIMessage` an das NUI gesendet.

### 3. Dynamische Farbberechnung im JavaScript
In der [script.js](file:///c:/Users/Stulle/Documents/Gute%20Scripts/-Raze_anims/raze_anims/html/js/script.js) füge ich Logik hinzu, um die empfangene Farbe zu verarbeiten:
- **Hauptfarbe:** Wird direkt für `--accent-main` übernommen.
- **Dunkle Farbe:** Berechnet sich aus der Hauptfarbe minus der Differenz (R:-68, G:0, B:-20).
- **RGBA-Farbe:** Berechnet sich aus der Hauptfarbe plus der Differenz (R:+63, G:+4, B:+37) mit einer Deckkraft von 80%.
- Die CSS-Variablen werden im `document.documentElement` aktualisiert.

## Zusammenfassung der Farblogik:
- `#990D35` -> 1:1 Export-Farbe
- `#550d21` -> Export-Farbe + (Differenz zu #990D35)
- `rgba(216, 17, 90, 0.80)` -> Export-Farbe + (Differenz zu #990D35) bei 0.8 Alpha

Soll ich mit der Umsetzung beginnen?