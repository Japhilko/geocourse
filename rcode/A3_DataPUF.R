#' ---
#' title: "Daten beschaffen"
#' author: "Jan-Philipp Kolb"
#' date: "22 Oktober 2018"
#' output:
#'   slidy_presentation: 
#'     highlight: espresso
#'     keep_md: yes
#'   beamer_presentation:
#'     colortheme: beaver
#'     fonttheme: structurebold
#'     highlight: espresso
#'     keep_tex: yes
#'     theme: CambridgeUS
#' ---
#' 
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,cache=T,eval=T,warning=F)
library(knitr)
GESIS <- F
athome <- !GESIS

#' 
#' ## [EU Initiative INSPIRE](http://inspire.ec.europa.eu/reports/Registration_form.pdf)
#' 
#' 
#' <!--
#' ## Datenzugang
#' 
#' - Public-Use-File (PUF) Datei zur öffentlichen Nutzung - meist stark anonymisierte Daten
#' (Beispiele: [FDZ](www.forschungsdatenzentrum.de), [Statistik Portal](www.statistik-portal.de), [Meine Region](www.infothek.statistik.rlp.de/lis/MeineRegion/index.asp) )
#' 
#' - Scientific-Use-File (SUF) - Datei zur wissenschaftlichen Nutzung - anonymisierte Daten, die zu wissenschaftlichen Zwecken und zur Sekundäranalyse genutzt werden können. 
#'  
#' - On-Site-Nutzung - Arbeitsplätze für Gastwissenschaftler - Kontrollierte Datenfernverarbeitung
#' -->
#' 
#' 
#' ![](figure/inspire.PNG)
#' 
#' ### Ziele:
#' 
#' - Räumliche Information zugänglicher und interoperabel machen
#' - Nachhaltige Entwicklung in diesem Bereich unterstützen
#' 
#' ### Entwicklung
#' 
#' - Aufgrund der  Richtlinie sind mehr Daten frei verfügbar.
#' 
#' ## Zensus Atlas
#' 
#' Für den Zensus 2011 kann man Daten herunterladen und/oder diese in Karten visualisieren.
#' 
#' ### https://ergebnisse.zensus2011.de/
#' 
#' ![Zensus Datenbank](figure/Zensusdtb.PNG)
#' 
#' ## [Zensus Gemeindeergebnisse](https://www.destatis.de/DE/Methoden/Zensus_/Zensus.html)
#' 
## ----eval=F,echo=F-------------------------------------------------------
## zen_path <- "D:/GESIS/Vorträge/20171122_userStuttgart/data/"

#' 
## ----eval=F--------------------------------------------------------------
## setwd(zen_path)
## bev_dat <- readxl::read_excel("xlsx_Bevoelkerung.xlsx",3)
## DT::datatable(bev_dat[1:1000,1:20])

#' 
#' ![](figure/ZensusTabEx.PNG)
#' 
#' 
#' 
#' ## A3A Aufgabe: Zensus Ergebnisse für Gemeinden downloaden
#' 
#' - Lade die Zensus Gemeinde Ergebnisse [**hier**](https://www.zensus2011.de/SharedDocs/Aktuelles/Ergebnisse/DemografischeGrunddaten.html) herunter.
#' - Importiere die Daten mit einer geeigneten Funktion in R.
#' - Welche Information ist in den Daten enthalten?
#' 
#' 
#' 
#' ## [Der amtliche Gemeindeschlüssel](https://de.wikipedia.org/wiki/Amtlicher_Gemeindeschl%C3%BCssel)
#' 
#' 
#' ![](figure/ags_beispiele.PNG)
#' 
#' ## AGS - Bundesländer
#' 
#' ![](figure/AGS_BLA.PNG)
#' 
#' 
#' ## A3B Aufgabe 
#' 
#' - Nutze die Gemeindeergebnisse für den Zensus 2011 und erzeuge einen Datensatz, der nur die Ergebnisse für die Saarländischen Gemeinden enthält.
#' - Ermittle aus diesem Datensatz die Gemeinde in der der Anteil der unter 1-jährigen am höchsten ist. 
#' - Speichere einen Datensatz ab, in dem die folgenden Variablen enthalten sind:
#'     - der amtliche Gemeindeschlüssel, 
#'     - die Gemeindenamen,  
#'     - die Bevölkerungszahl insgesamt 
#'     - die Zahl der Einjährigen und 
#'     - die Zahl der Zwanzigjährigen 
#' 
#' 
#' 
#' ## Forschungsdatenzentren
#' 
#' - Bspw. FDZ der statistischen Ämter:
#' 
#' <http://www.forschungsdatenzentrum.de/>
#' 
#' - Es werden hauptsächlich Public Use Files angeboten, 
#' 
#' - Teilweise können Gewichtungsfaktoren verwendet werden um regionale Ergebnisse zu bekommen
#' 
#' - In der Regel ist Darstellung in Karten aber schwierig
#' 
#' ## Weitere Amtliche Datenquellen
#' 
#' - Die Regionaldatenbank [**Genesis**](https://www-genesis.destatis.de/genesis/online)
#' 
#' ![](figure/GENESIS_Datenbank.PNG)
#' 
#' - Daneben gibt es Angebote der Landesämter bspw das Angebot des [**statistischen Landesamts Rheinland-Pfalz**](https://www.statistik.rlp.de/de/regional/meine-heimat/)
#' 
#' ![](figure/Meine_heimat.PNG)
#' 
#' ## Eurostat Daten
#' 
#' ### Beispiel: Principal European Economic Indicators
#' 
#' <http://ec.europa.eu/eurostat/web/euro-indicators/peeis>
#' 
## ----echo=F,eval=GESIS---------------------------------------------------
eurostatpath <- "J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/dataImport/data/"

#' 
## ----echo=F,eval=athome--------------------------------------------------
eurostatpath <- "D:/Eigene Dateien/Dokumente/GitHub/ps_2017_11_user_stuttgart/data/"

#' 
#' 
## ----eval=T--------------------------------------------------------------
library(xlsx)
HHsr<-read.xlsx2(paste0(eurostatpath,"HHsavingRate.xls"),1)

#' 
## ----echo=F,eval=T-------------------------------------------------------
kable(HHsr[1:4,1:5])

#' 
#' 
#' <!--
#' - Laden Sie die Daten für den Inflationsindikator von Eurostat herunter.
#' 
#' <http://ec.europa.eu/eurostat/web/euro-indicators/peeis>
#' -->
#' 
#' 
#' ## A3A Übung: Download von Eurostat Daten
#' 
#' - Gehe auf die Website mit den *Principal European Economic Indicators* und lade die Statistik der Sparquote [**hier**](http://ec.europa.eu/eurostat/web/euro-indicators/peeis) herunter.
#' - Importiere die Daten in R mit einem geeigneten Befehl.
#' 
#' 
#' ## Daten - Institut für ökologische Raumforschung (IÖR)
#' 
#' ![](figure/ioerMonitor.PNG)
#' 
#' - Hier gibt es bspw. Indikatoren zu Nachhaltigkeit, Siedlung, Gebäuden, Verkehr etc. 
#' - Es könnte also interessant sein, diese Daten an das Gesis Panel anzuspielen
#' - Aber dazu später mehr
#' 
#' 
#' 
#' ## Datahub.io
#' 
#' - Auf dieser Plattform sind sehr viele Daten vorhanden, 
#' - bspw. der UNESCO [**Weltkulturerbe**](http://datahub.io/dataset/unesco-world-heritage-sites/resource/d4116195-44d8-4bc1-9f91-9b570870dc19) Datensatz, den ich in der Folge auch in Beispielen verwenden werde. 
#' 
#' ![](figure/datahub_whc.PNG)
#' 
#' <!--
#' - Funktioniert nur im Windows Explorer ?????!!!!
#' -->
#' 
## ----eval=F,echo=F-------------------------------------------------------
## setwd("J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/dataImport/data")

#' 
#' 
## ----echo=F,cache=T,eval=F-----------------------------------------------
## load("whc.RData")

#' 
## ----echo=F,eval=F-------------------------------------------------------
## whc2 <- whc[4:8,c("name_en","longitude","latitude","category_short")]
## whc2$longitude <- round(whc2$longitude,2)
## whc2$latitude <- round(whc2$latitude,2)
## kable(whc2)

#' 
#' |   |name_en                 | longitude| latitude|category_short |
#' |:--|:-----------------------|---------:|--------:|:--------------|
#' |4  |Butrint                 |     20.03|    39.75|C              |
#' |5  |Al Qal'a of Beni Hammad |      4.79|    35.82|C              |
#' |6  |M'Zab Valley            |      3.68|    32.48|C              |
#' |7  |DjÃ©mila                |      5.74|    36.32|C              |
#' |8  |Timgad                  |      6.63|    35.45|C              |
#' 
#' 
#' ## American Community Survey
#' 
#' ### [Die Daten des *American Community Survey:*](http://www.census.gov/acs/www/)
#' 
#' 
#' ![](figure/ACS.PNG)
#' 
#' 
#' 
#' ## [The Humanitarian Data Exchange](data.hdx.rwlabs.org)
#' 
#' ### Zum Beispiel Daten zur [Ebola Epedemie](https://data.hdx.rwlabs.org/dataset/rowca-ebola-cases)
#' 
#' ![](figure/HDx.PNG)
#' 
#' <!--
#' - Zum Beispiel Ebola Fälle
#' -->
#' 
#' 
#' ## Weltbank Daten
#' 
#' - AG.AGR.TRAC.NO - [**Agricultural machinery, tractors**](https://data.worldbank.org/indicator/AG.AGR.TRAC.NO)
#' 
## ----eval=F--------------------------------------------------------------
## library(WDI)
## WDI_dat <- WDI(country="all",
##     indicator=c("AG.AGR.TRAC.NO",
##     "TM.TAX.TCOM.BC.ZS"),
##     start=1990, end=2000)

#' 
#' - Es gibt auch eine Funktion `WDIsearch` mit der man nach Indikatoren suchen kann
#' 
## ----eval=F--------------------------------------------------------------
## head(WDI_dat)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## kable(head(WDI_dat))

#' 
## ----eval=F,echo=F-------------------------------------------------------
## datatable(WDI_dat)

#' 
#' 
#' ## [London Datastore](http://data.london.gov.uk/dataset)
#' 
#' ![](figure/LondonData.PNG)
#' 
#' 
#' ## Ein Beispieldatensatz für London
#' 
## ----eval=F,echo=F,message=F,warning=F-----------------------------------
## st_layers("../data/london_sport.shp")
## london <- st_read("../data/london_sport.shp")
## DT::datatable(london)

#' 
#' ![](figure/LondonExample.PNG)
