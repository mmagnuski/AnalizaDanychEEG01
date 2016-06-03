#### Jak wyłączyć w nowym matlabie wygładzanie linii (antialiasing) aby wykresy działały szybciej?
W oknie komend (`command window`) piszemy:
```matlab
set(groot,'DefaultFigureGraphicsSmoothing','off')
```
