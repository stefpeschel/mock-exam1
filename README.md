# Klausur 1

Es gibt 4 Aufgaben, die Sie lösen sollen.

Die Klausur ist ähnlich wie die Übungs-Repositories aufgebaut, mit `.R`-Dateien 
im Verzeichnis `R`. Sie sollen die Aufgaben in diesem Verzeichnis lösen und 
können Ihre Lösungen mit `evaluate_submission.R` testen. 
Beachten Sie, dass nicht immer alle Tests zugänglich sind.  

Aufgabe 01 hat keine Tests.  

Aufgabe 03 wird nur in Bezug auf die Statistiken der zu erstellenden Objekte getestet.  
Das bedeutet, dass diese Tests teilblind sind.  

Die Aufgaben finden Sie in den jeweiligen `.R`-Dateien im Verzeichnis `R`.

### Bearbeiten der Aufgaben

1. Schauen Sie sich die `.R`-Dateien im Verzeichnis `R/` an. Diese sind nach 
steigender Schwierigkeit und in verschiedene Themen unterteilt, die Ihnen 
Hinweise darauf geben, wo Sie im Material nach Unterstützung suchen sollten. 
In jeder Datei finden Sie leere Funktionen, die mit Überschriften wie 
*"Schreiben Sie eine Funktion, die X macht"* versehen sind. Füllen Sie den 
Funktionskörper (d. h. den Teil zwischen den geschweiften Klammern `{ }`) mit 
Code, der das tut, was verlangt wird. Beispiel:

    ```r
    # Schreiben Sie eine Funktion, die x durch y teilt
    ex01Divide <- function(x, y) {
      # TODO
    }
    ```

    sollte so aussehen:

    ```r
    # Schreiben Sie eine Funktion, die x durch y teilt
    ex01Divide <- function(x, y) {
      x / y
    }
    ```

    (Denken Sie daran, dass eine Funktion immer das Ergebnis des letzten ausgeführten Befehls zurückgibt.)

    In diesem Kurs verwenden wir keine anderen Bibliotheken außer `checkmate`, `data.table`, `R6`, und `ggplot2` sowie die Standardpakete von `R`. **Die Bibliotheken werden automatisch geladen, daher brauchen Sie diese nicht mit `library()` in Ihrem Code laden.** (Nach `renv::restore()` müssen Sie möglicherweise Ihre R-Sitzung neu starten, um Zugriff auf die Bibliotheken zu erhalten, siehe oben). Bitte verwenden Sie weder `require(`, `library(` noch `::` / `:::`, um andere Bibliotheken zu laden, und installieren Sie keine weiteren Pakete für diese Aufgabe. Darüber hinaus handelt es sich um einen `R`-Kurs, daher führen Sie keine externe Software aus Ihrem Code aus.

    Denken Sie daran, dass wir auch den **Code-Stil** überprüfen.  
    **Wir überprüfen, dass Sie `checkmate` verwenden.** **Wenn die Aufgabe beispielsweise verlangt, eine einzelne positive ganze Zahl zu erwarten, müssen Sie `assertInt(x, lower = 1)` oder `assertCount(x, positive = TRUE)` für Ihr Funktionsargument verwenden.** (Für `data.table`-Argumente reicht `assertDataTable(<argument>)` aus).

    Es ist nicht erforderlich, Tests im Verzeichnis `tests/` zu schreiben, und deren Inhalt wird nicht bewertet (Sie können dies jedoch gerne für Ihre eigene Kontrolle tun).

2. Arbeiten Sie schrittweise auf eine Lösung hin. Es kann nützlich sein, mit einem 
Arbeits-Skript zu experimentieren, in dem man verschiedene Funktionen mit 
unterschiedlichen Eingaben testet, um zu sehen, wie sie in bestimmten Fällen 
funktionieren und wie sie zusammenarbeiten können. Ein Beispiel dafür ist die 
Datei `working_notebook.Rmd`, die Sie in RStudio öffnen und anschauen können. 
Sie können natürlich auch jede andere Arbeitsweise verwenden, die Sie bevorzugen.

### Überprüfen Sie Ihr Ergebnis regelmäßig

3. Sie können das Skript `evaluate_submission.R` mit folgendem Befehl ausführen:

    ```sh
    Rscript evaluate_submission.R
    ```

    um *alle* Ergebnisse zu überprüfen, oder Sie können

    ```sh
    Rscript evaluate_submission.R --skip-style
    ```

    ausführen, um den style-Test zu überspringen. Verwenden Sie

    ```sh
    # Rscript evaluate_submission.R --exercise=1
    ```

    um nur eine einzelne Aufgabe zu bewerten. Sie können auch Unteraufgaben wie 
    `--exercise=1.1` testen und verschiedene `--exercise`-Argumente mit dem 
    Argument `--skip-style` kombinieren. Beispiel:

    ```sh
    Rscript evaluate_submission.R --exercise=1 --exercise=2.1 --skip-style
    ```

    überprüft alle Aufgaben aus Aufgabe 01 und Aufgabe ex01 von Aufgabe 02 und 
    überspringt die Stil-Prüfungen. Wenn `--exercise=`-Argumente angegeben werden 
    und die Stil-Prüfungen nicht übersprungen werden, dann wird nur der Stil der 
    `R`-Dateien geprüft, die die angeforderten Aufgaben enthalten. Beachten Sie, 
    dass das Auswählen einzelner Aufgaben oft zu detaillierteren Fehlermeldungen führt!

    Sie können `evaluation_notebook.Rmd` öffnen und die Bewertung von dort aus starten. 
    Siehe das Notebook, um zu erfahren, wie Sie die Prüfungen auf bestimmte Aufgaben beschränken können.

    Hinweis: Um sicherzustellen, dass Sie das gleiche Bewertungswerkzeug verwenden 
    wie wir, **ist es wichtig, dass Sie die Datei `evaluate_submission.R` nicht 
    ändern und den Inhalt des `.github`-Ordners nicht verändern!** Wenn Sie diese 
    Dateien bearbeiten, ist es möglich, dass Ihre Abgabe Fehler enthält, die das 
    Skript jedoch nicht anzeigt.
