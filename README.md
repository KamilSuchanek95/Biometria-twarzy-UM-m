# Biometria twarzy UM m
Projekt na kurs z Uczenia Maszynowego. Zaprojektowanie prototypu rozwiązania biometrii twarzy w środowisku Matlab.

### Wykrywanie twarzy:
W celu wykrywania twarzy póki co, za wystarczające uznano zastosowanie domyślnych klasyfikatorów LBP i CART(oparte na kaskadzie klasyfikatorów haaropodobnych) obiektu vision.CascadeObjectClassificator [doc](https://www.mathworks.com/help/vision/ref/vision.cascadeobjectdetector-system-object.html).

### Rozpoznawanie twarzy:
Rozpoznawanie zamierzam zrealizować przy pomocy ekstrakcji cech algorytmem HOG (bez PCA/LDA) oraz SVM dla wielu klas.
