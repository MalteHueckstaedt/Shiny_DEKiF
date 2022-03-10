# DZHW Report latex template

FDZ Daten und Methodenbericht template. Grundlage ist der Code von S.Stahlschmidt.

## Nutzung auf OSX

### Vorbereitung

#### Calibri systemweit installieren

Um das `.RMD`-File kompilieren zu können, ist es nötig unter OSX die Schrift `Calibiri` systemweit nutzbar zu machen. Ist **Office Word** bereits installiert, muss hierzu lediglich der entsprechende Schriften-Ordner des Apps aufgerufen werden:

`/Applications/Microsoft Word.app/Contents/Resources/DFonts/`

Anschließend werden sämtliche Varianten von `Calibri` per Doppelklick mittels der Schriftensammlung-App händisch systemweit installiert.

#### Preload Hyphenation Patterns

Damit die Silbentrennung im deutschen funktioniert entsprechende Hyphenation Patterns installieren. Siehe auch [hier](https://github.com/yihui/tinytex/issues/97#issuecomment-480337364) und [hier](https://github.com/yihui/tinytex/issues/97#issuecomment-578994618).

 `tinytex::tlmgr_install("collection-langgerman")`
