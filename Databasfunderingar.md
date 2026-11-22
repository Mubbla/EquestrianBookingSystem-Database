# Databasfunderingar

## Applikationsidé

Jag vill koppla mitt befintliga Java-baserade bokningssystem för en ridskola till en MySQL-databas. Programmet hanterar redan hästar och bokningar, men informationen lagras bara medan programmet körs. Med databasen ska informationen kunna finnas kvar när programmet avslutas.

Jag vill också vidareutveckla bokningarna så att de gäller en bestämd lektionstid. Då går det att se vem som ska rida, vilken häst som används och när lektionen äger rum.

## Användare och syfte

Systemets främsta användare är ridskolans personal, som hanterar hästar, lektioner och bokningar. Ryttare kan registreras och kopplas till lektioner. Systemet ska göra det enklare att planera lektioner och kontrollera vilka hästar som är bokade eller tillgängliga.

## Information databasen hanterar

Databasen behöver spara uppgifter om hästar och deras typ och bokningskrav, ryttare, instruktörer, lektionernas datum och tid samt bokningar. En bokning kopplar ihop en ryttare med en lektion och en häst. Hästar kan bokas för olika lektioner vid olika tider.

## Exempel på vad användaren ska kunna göra

- Lägga till och uppdatera hästar och ryttare.
- Skapa lektioner med tid, instruktör och antal platser.
- Boka en ryttare till en lektion och häst.
- Kontrollera tillgänglighet och visa lektionernas bokningar.
- Avboka en bokning.

## Nästa steg

Rita ett ER/EER-diagram utifrån informationen och relationerna ovan. En möjlig Many-to-Many-relation är ryttare och lektioner, med bokning som kopplingstabell. En lektion kan då ha flera bokningar.
