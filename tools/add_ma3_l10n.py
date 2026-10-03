#!/usr/bin/env python3
"""Ajoute les clés l10n du calculateur de paramètres MA3 dans les 6 ARB.

Usage : python3 tools/add_ma3_l10n.py   (depuis la racine du projet)
Idempotent : une clé déjà présente n'est pas réécrite.
"""
import json
import os
from collections import OrderedDict

ARB_DIR = os.path.join(os.path.dirname(__file__), '..', 'lib', 'l10n')
LANGS = ['fr', 'en', 'de', 'es', 'nl', 'pt']

# key: (placeholders {name: type}, fr, en, de, es, nl, pt)
K = OrderedDict()


def add(key, ph, fr, en, de, es, nl, pt):
    K[key] = (ph, dict(fr=fr, en=en, de=de, es=es, nl=nl, pt=pt))


add('ma3CalcTitle', {}, 'Paramètres MA3', 'MA3 parameters', 'MA3-Parameter', 'Parámetros MA3', 'MA3-parameters', 'Parâmetros MA3')
add('ma3CalcTileDescription', {}, 'Combien de paramètres pour ton show, et combien de PU ?', 'How many parameters does your show need, and how many PUs?', 'Wie viele Parameter braucht deine Show – und wie viele PUs?', '¿Cuántos parámetros necesita tu show y cuántas PU?', 'Hoeveel parameters heeft je show nodig, en hoeveel PU\'s?', 'Quantos parâmetros o teu show precisa, e quantas PU?')
add('ma3CalcTabMvr', {}, 'Depuis un MVR', 'From an MVR', 'Aus MVR', 'Desde un MVR', 'Vanuit MVR', 'A partir de MVR')
add('ma3CalcTabList', {}, 'Liste de machines', 'Fixture list', 'Geräteliste', 'Lista de aparatos', 'Armaturenlijst', 'Lista de aparelhos')
add('ma3CalcAddFixture', {}, 'Ajouter une machine', 'Add a fixture', 'Gerät hinzufügen', 'Añadir un aparato', 'Armatuur toevoegen', 'Adicionar aparelho')
add('ma3CalcAddSheetTitle', {}, 'Quelle machine ?', 'Which fixture?', 'Welches Gerät?', '¿Qué aparato?', 'Welk armatuur?', 'Que aparelho?')
add('ma3CalcAddSheetSubtitle', {}, 'Recherche dans GDTF Share, importe un .gdtf ou saisis la valeur toi-même.', 'Search GDTF Share, import a .gdtf or type the value yourself.', 'Suche in GDTF Share, importiere eine .gdtf oder gib den Wert selbst ein.', 'Busca en GDTF Share, importa un .gdtf o escribe el valor tú mismo.', 'Zoek in GDTF Share, importeer een .gdtf of vul de waarde zelf in.', 'Procura no GDTF Share, importa um .gdtf ou escreve o valor tu mesmo.')
add('ma3CalcSearchHint', {}, 'ex. MAC Aura, Robe Spiider…', 'e.g. MAC Aura, Robe Spiider…', 'z. B. MAC Aura, Robe Spiider…', 'p. ej. MAC Aura, Robe Spiider…', 'bv. MAC Aura, Robe Spiider…', 'ex. MAC Aura, Robe Spiider…')
add('ma3CalcSearchFailed', {}, 'Recherche impossible pour le moment. Vérifie ta connexion.', 'Search unavailable right now. Check your connection.', 'Suche gerade nicht möglich. Prüfe deine Verbindung.', 'Búsqueda no disponible ahora. Revisa tu conexión.', 'Zoeken lukt nu niet. Controleer je verbinding.', 'Pesquisa indisponível de momento. Verifica a ligação.')
add('ma3CalcNoResult', {}, 'Aucun résultat. Essaie un autre nom, ou la saisie manuelle.', 'No results. Try another name, or manual entry.', 'Keine Treffer. Versuche einen anderen Namen oder die manuelle Eingabe.', 'Sin resultados. Prueba otro nombre o la entrada manual.', 'Geen resultaten. Probeer een andere naam of handmatige invoer.', 'Sem resultados. Tenta outro nome ou a entrada manual.')
add('ma3CalcImportGdtf', {}, 'Fichier .gdtf', '.gdtf file', '.gdtf-Datei', 'Archivo .gdtf', '.gdtf-bestand', 'Ficheiro .gdtf')
add('ma3CalcManualEntry', {}, 'Saisie manuelle', 'Manual entry', 'Manuelle Eingabe', 'Entrada manual', 'Handmatig', 'Entrada manual')
add('ma3CalcManualName', {}, 'Nom de la machine', 'Fixture name', 'Gerätename', 'Nombre del aparato', 'Naam armatuur', 'Nome do aparelho')
add('ma3CalcChooseMode', {}, 'Quel mode DMX ?', 'Which DMX mode?', 'Welcher DMX-Modus?', '¿Qué modo DMX?', 'Welke DMX-modus?', 'Que modo DMX?')
add('ma3CalcModeSummary', {'params': 'int', 'channels': 'int'}, '{params} param. MA3 · {channels} canaux DMX', '{params} MA3 params · {channels} DMX channels', '{params} MA3-Param. · {channels} DMX-Kanäle', '{params} parám. MA3 · {channels} canales DMX', '{params} MA3-param. · {channels} DMX-kanalen', '{params} parâm. MA3 · {channels} canais DMX')
add('ma3CalcModeUnknown', {}, 'Mode sans canaux lisibles', 'Mode with no readable channels', 'Modus ohne lesbare Kanäle', 'Modo sin canales legibles', 'Modus zonder leesbare kanalen', 'Modo sem canais legíveis')
add('ma3CalcHowMany', {}, 'Combien de machines ?', 'How many fixtures?', 'Wie viele Geräte?', '¿Cuántos aparatos?', 'Hoeveel armaturen?', 'Quantos aparelhos?')
add('ma3CalcDownloadFailed', {}, 'Téléchargement du GDTF impossible.', 'Could not download the GDTF.', 'GDTF konnte nicht geladen werden.', 'No se pudo descargar el GDTF.', 'GDTF downloaden mislukt.', 'Não foi possível descarregar o GDTF.')
add('ma3CalcGdtfUnreadable', {}, 'Ce GDTF est illisible (fichier abîmé ?).', 'This GDTF can\'t be read (damaged file?).', 'Diese GDTF ist nicht lesbar (Datei beschädigt?).', 'Este GDTF no se puede leer (¿archivo dañado?).', 'Deze GDTF is onleesbaar (bestand beschadigd?).', 'Este GDTF está ilegível (ficheiro danificado?).')
add('ma3CalcGdtfNoMode', {}, 'Aucun mode DMX dans ce GDTF.', 'No DMX mode in this GDTF.', 'Kein DMX-Modus in dieser GDTF.', 'No hay modo DMX en este GDTF.', 'Geen DMX-modus in deze GDTF.', 'Nenhum modo DMX neste GDTF.')
add('ma3CalcNotGdtf', {'name': 'String'}, '« {name} » n\'est pas un fichier .gdtf.', '"{name}" is not a .gdtf file.', '„{name}“ ist keine .gdtf-Datei.', '«{name}» no es un archivo .gdtf.', '"{name}" is geen .gdtf-bestand.', '«{name}» não é um ficheiro .gdtf.')
add('ma3CalcNotMvr', {'name': 'String'}, '« {name} » n\'est pas un fichier .mvr.', '"{name}" is not an .mvr file.', '„{name}“ ist keine .mvr-Datei.', '«{name}» no es un archivo .mvr.', '"{name}" is geen .mvr-bestand.', '«{name}» não é um ficheiro .mvr.')
add('ma3CalcPickFailed', {}, 'Impossible d\'ouvrir le fichier.', 'Couldn\'t open the file.', 'Datei konnte nicht geöffnet werden.', 'No se pudo abrir el archivo.', 'Bestand openen mislukt.', 'Não foi possível abrir o ficheiro.')
add('ma3CalcMvrUnreadable', {}, 'Ce MVR est illisible (ce n\'est pas une archive valide).', 'This MVR can\'t be read (not a valid archive).', 'Diese MVR ist nicht lesbar (kein gültiges Archiv).', 'Este MVR no se puede leer (no es un archivo válido).', 'Deze MVR is onleesbaar (geen geldig archief).', 'Este MVR está ilegível (não é um arquivo válido).')
add('ma3CalcMvrNoScene', {}, 'Pas de GeneralSceneDescription.xml dans ce MVR.', 'No GeneralSceneDescription.xml in this MVR.', 'Keine GeneralSceneDescription.xml in dieser MVR.', 'No hay GeneralSceneDescription.xml en este MVR.', 'Geen GeneralSceneDescription.xml in deze MVR.', 'Sem GeneralSceneDescription.xml neste MVR.')
add('ma3CalcMvrNoFixtures', {}, 'Aucune machine dans ce MVR.', 'No fixtures in this MVR.', 'Keine Geräte in dieser MVR.', 'No hay aparatos en este MVR.', 'Geen armaturen in deze MVR.', 'Nenhum aparelho neste MVR.')
add('ma3CalcMvrEmptyTitle', {}, 'Balance ton MVR 🎛️', 'Drop in your MVR 🎛️', 'Her mit deiner MVR 🎛️', 'Carga tu MVR 🎛️', 'Laad je MVR 🎛️', 'Carrega o teu MVR 🎛️')
add('ma3CalcMvrEmptyBody', {}, 'Export Vectorworks, Capture, grandMA3, Depence… On compte les machines, on lit leurs GDTF et on te dit combien de paramètres (et de PU) il te faut.', 'Vectorworks, Capture, grandMA3, Depence export… We count the fixtures, read their GDTFs and tell you how many parameters (and PUs) you need.', 'Export aus Vectorworks, Capture, grandMA3, Depence… Wir zählen die Geräte, lesen ihre GDTFs und sagen dir, wie viele Parameter (und PUs) du brauchst.', 'Exportación de Vectorworks, Capture, grandMA3, Depence… Contamos los aparatos, leemos sus GDTF y te decimos cuántos parámetros (y PU) necesitas.', 'Export uit Vectorworks, Capture, grandMA3, Depence… We tellen de armaturen, lezen hun GDTF\'s en zeggen hoeveel parameters (en PU\'s) je nodig hebt.', 'Exportação do Vectorworks, Capture, grandMA3, Depence… Contamos os aparelhos, lemos os GDTF e dizemos-te quantos parâmetros (e PU) precisas.')
add('ma3CalcPickMvr', {}, 'Choisir un fichier .mvr', 'Choose an .mvr file', '.mvr-Datei wählen', 'Elegir un archivo .mvr', 'Kies een .mvr-bestand', 'Escolher um ficheiro .mvr')
add('ma3CalcChangeFile', {}, 'Changer', 'Change', 'Ändern', 'Cambiar', 'Wijzigen', 'Mudar')
add('ma3CalcListEmptyTitle', {}, 'Ton kit, machine par machine', 'Your rig, fixture by fixture', 'Dein Rig, Gerät für Gerät', 'Tu rig, aparato por aparato', 'Je rig, armatuur per armatuur', 'O teu rig, aparelho a aparelho')
add('ma3CalcListEmptyBody', {}, 'Genre 6 × MAC Aura, 23 × Studio Color… Ajoute tes machines, choisis le mode, et le total s\'affiche tout seul.', 'Like 6 × MAC Aura, 23 × Studio Color… Add your fixtures, pick the mode and the total shows up on its own.', 'Etwa 6 × MAC Aura, 23 × Studio Color… Geräte hinzufügen, Modus wählen – die Summe erscheint von selbst.', 'Tipo 6 × MAC Aura, 23 × Studio Color… Añade tus aparatos, elige el modo y el total aparece solo.', 'Zoals 6 × MAC Aura, 23 × Studio Color… Voeg je armaturen toe, kies de modus en het totaal verschijnt vanzelf.', 'Tipo 6 × MAC Aura, 23 × Studio Color… Adiciona os aparelhos, escolhe o modo e o total aparece sozinho.')
add('ma3CalcYourSystem', {}, 'Ta console', 'Your console', 'Dein Pult', 'Tu consola', 'Je console', 'A tua consola')
add('ma3CalcSafetyMargin', {}, 'Marge de sécurité', 'Safety margin', 'Sicherheitsreserve', 'Margen de seguridad', 'Veiligheidsmarge', 'Margem de segurança')
add('ma3CalcNoMargin', {}, 'Aucune', 'None', 'Keine', 'Ninguno', 'Geen', 'Nenhuma')
add('ma3CalcTotalParams', {}, 'Paramètres MA3', 'MA3 parameters', 'MA3-Parameter', 'Parámetros MA3', 'MA3-parameters', 'Parâmetros MA3')
add('ma3CalcFixturesAndUniverses', {'fixtures': 'int', 'universes': 'int'}, '{fixtures} machines · ≈ {universes} univers DMX', '{fixtures} fixtures · ≈ {universes} DMX universes', '{fixtures} Geräte · ≈ {universes} DMX-Universen', '{fixtures} aparatos · ≈ {universes} universos DMX', '{fixtures} armaturen · ≈ {universes} DMX-universes', '{fixtures} aparelhos · ≈ {universes} universos DMX')
add('ma3CalcWithMargin', {'percent': 'int', 'value': 'String'}, 'Avec {percent} % de marge : {value}', 'With {percent} % margin: {value}', 'Mit {percent} % Reserve: {value}', 'Con {percent} % de margen: {value}', 'Met {percent} % marge: {value}', 'Com {percent} % de margem: {value}')
add('ma3CalcCopySummary', {}, 'Copier le résumé', 'Copy summary', 'Zusammenfassung kopieren', 'Copiar resumen', 'Samenvatting kopiëren', 'Copiar resumo')
add('ma3CalcVerdictSessionMax', {'max': 'String'}, 'Au-delà de {max} paramètres : c\'est le maximum d\'une session grandMA3.', 'Over {max} parameters: that\'s the maximum of a grandMA3 session.', 'Über {max} Parameter: das ist das Maximum einer grandMA3-Session.', 'Más de {max} parámetros: es el máximo de una sesión grandMA3.', 'Meer dan {max} parameters: dat is het maximum van een grandMA3-sessie.', 'Acima de {max} parâmetros: é o máximo de uma sessão grandMA3.')
add('ma3CalcVerdictOnPcTooSmall', {'max': 'String'}, 'onPC plafonne à {max} paramètres', 'onPC tops out at {max} parameters', 'onPC ist bei {max} Parametern am Limit', 'onPC se limita a {max} parámetros', 'onPC stopt bij {max} parameters', 'onPC fica limitado a {max} parâmetros')
add('ma3CalcVerdictOnPcTooSmallSub', {}, 'Il te faut une console grandMA3 (+ PU si besoin) : choisis-la au-dessus pour voir la config.', 'You need a grandMA3 console (+ PUs if needed): pick one above to see the setup.', 'Du brauchst ein grandMA3-Pult (+ PUs bei Bedarf): wähle es oben, um die Konfiguration zu sehen.', 'Necesitas una consola grandMA3 (+ PU si hace falta): elígela arriba para ver la configuración.', 'Je hebt een grandMA3-console nodig (+ PU\'s indien nodig): kies er hierboven een om de setup te zien.', 'Precisas de uma consola grandMA3 (+ PU se necessário): escolhe-a acima para ver a configuração.')
add('ma3CalcVerdictOnPcOk', {}, 'onPC suffit 👌', 'onPC is enough 👌', 'onPC reicht 👌', 'onPC es suficiente 👌', 'onPC volstaat 👌', 'onPC chega 👌')
add('ma3CalcVerdictOnPcOkSub', {'max': 'String'}, 'N\'importe quel matériel onPC (command wing, fader wing, node 4k, rack-unit…) débloque {max} paramètres.', 'Any onPC hardware (command wing, fader wing, node 4k, rack-unit…) unlocks {max} parameters.', 'Jede onPC-Hardware (Command Wing, Fader Wing, Node 4k, Rack-Unit…) schaltet {max} Parameter frei.', 'Cualquier hardware onPC (command wing, fader wing, node 4k, rack-unit…) desbloquea {max} parámetros.', 'Elke onPC-hardware (command wing, fader wing, node 4k, rack-unit…) ontgrendelt {max} parameters.', 'Qualquer hardware onPC (command wing, fader wing, node 4k, rack-unit…) desbloqueia {max} parâmetros.')
add('ma3CalcVerdictBaseOk', {'console': 'String'}, 'Ta {console} suffit, pas besoin de PU 🎉', 'Your {console} is enough, no PU needed 🎉', 'Dein {console} reicht, keine PU nötig 🎉', 'Tu {console} es suficiente, no hace falta PU 🎉', 'Je {console} volstaat, geen PU nodig 🎉', 'A tua {console} chega, não precisas de PU 🎉')
add('ma3CalcVerdictCapacity', {'capacity': 'String'}, 'Capacité totale : {capacity} paramètres.', 'Total capacity: {capacity} parameters.', 'Gesamtkapazität: {capacity} Parameter.', 'Capacidad total: {capacity} parámetros.', 'Totale capaciteit: {capacity} parameters.', 'Capacidade total: {capacity} parâmetros.')
add('ma3CalcVerdictAddPu', {'units': 'String'}, 'Ajoute {units}', 'Add {units}', 'Füge {units} hinzu', 'Añade {units}', 'Voeg {units} toe', 'Adiciona {units}')
add('ma3CalcVerdictXlOnly', {'count': 'int'}, 'Ou, plus simple : {count} × PU XL.', 'Or, simpler: {count} × PU XL.', 'Oder einfacher: {count} × PU XL.', 'O, más sencillo: {count} × PU XL.', 'Of eenvoudiger: {count} × PU XL.', 'Ou, mais simples: {count} × PU XL.')
add('ma3CalcUnknownNotCounted', {'count': 'int'}, '{count} machine(s) sans données ne sont pas comptées : corrige-les ci-dessous.', '{count} fixture(s) without data are not counted: fix them below.', '{count} Gerät(e) ohne Daten werden nicht gezählt: unten korrigieren.', '{count} aparato(s) sin datos no se cuentan: corrígelos abajo.', '{count} armatu(u)r(en) zonder gegevens worden niet meegeteld: corrigeer ze hieronder.', '{count} aparelho(s) sem dados não são contados: corrige-os abaixo.')
add('ma3CalcFixtureTypes', {'count': 'int'}, 'Types de machines ({count})', 'Fixture types ({count})', 'Gerätetypen ({count})', 'Tipos de aparatos ({count})', 'Armatuurtypes ({count})', 'Tipos de aparelhos ({count})')
add('ma3CalcMvrCounts', {'fixtures': 'int', 'unpatched': 'int'}, '{fixtures} machines · {unpatched} non patchées', '{fixtures} fixtures · {unpatched} unpatched', '{fixtures} Geräte · {unpatched} ungepatcht', '{fixtures} aparatos · {unpatched} sin patch', '{fixtures} armaturen · {unpatched} niet gepatcht', '{fixtures} aparelhos · {unpatched} sem patch')
add('ma3CalcMultipatchNote', {'count': 'int'}, 'Dont {count} multipatch, comptés par sécurité.', 'Including {count} multipatch, counted to be safe.', 'Davon {count} Multipatch, sicherheitshalber mitgezählt.', 'De ellos {count} multipatch, contados por seguridad.', 'Waarvan {count} multipatch, voor de zekerheid meegeteld.', 'Dos quais {count} multipatch, contados por segurança.')
add('ma3CalcPerUnit', {'params': 'int'}, '{params} param. par machine', '{params} params per fixture', '{params} Param. pro Gerät', '{params} parám. por aparato', '{params} param. per armatuur', '{params} parâm. por aparelho')
add('ma3CalcUnknownParams', {}, 'Paramètres inconnus', 'Unknown parameters', 'Parameter unbekannt', 'Parámetros desconocidos', 'Parameters onbekend', 'Parâmetros desconhecidos')
add('ma3CalcTapToFix', {}, 'Touche pour saisir la valeur toi-même →', 'Tap to enter the value yourself →', 'Tippen, um den Wert selbst einzugeben →', 'Toca para escribir el valor tú mismo →', 'Tik om de waarde zelf in te vullen →', 'Toca para escrever o valor tu mesmo →')
add('ma3CalcSwipeHint', {}, 'Glisse une ligne vers la gauche pour la supprimer · touche-la pour corriger ses paramètres.', 'Swipe a row left to delete it · tap it to fix its parameters.', 'Zeile nach links wischen zum Löschen · antippen, um Parameter zu korrigieren.', 'Desliza una fila a la izquierda para borrarla · tócala para corregir sus parámetros.', 'Veeg een regel naar links om te verwijderen · tik om de parameters te corrigeren.', 'Desliza uma linha para a esquerda para a apagar · toca para corrigir os parâmetros.')
add('ma3CalcClear', {}, 'Vider', 'Clear', 'Leeren', 'Vaciar', 'Wissen', 'Limpar')
add('ma3CalcClearListTitle', {}, 'Vider la liste ?', 'Clear the list?', 'Liste leeren?', '¿Vaciar la lista?', 'Lijst wissen?', 'Limpar a lista?')
add('ma3CalcClearListBody', {}, 'Toutes les machines de la liste seront supprimées.', 'All fixtures in the list will be removed.', 'Alle Geräte der Liste werden entfernt.', 'Se eliminarán todos los aparatos de la lista.', 'Alle armaturen in de lijst worden verwijderd.', 'Todos os aparelhos da lista serão removidos.')
add('ma3CalcCancel', {}, 'Annuler', 'Cancel', 'Abbrechen', 'Cancelar', 'Annuleren', 'Cancelar')
add('ma3CalcOk', {}, 'OK', 'OK', 'OK', 'OK', 'OK', 'OK')
add('ma3CalcParamsPerUnitTitle', {}, 'Paramètres par machine', 'Parameters per fixture', 'Parameter pro Gerät', 'Parámetros por aparato', 'Parameters per armatuur', 'Parâmetros por aparelho')
add('ma3CalcParamsUnit', {}, 'param.', 'params', 'Param.', 'parám.', 'param.', 'parâm.')
add('ma3CalcGdtfValue', {'value': 'int'}, 'Valeur calculée depuis le GDTF : {value}', 'Value computed from the GDTF: {value}', 'Aus der GDTF berechneter Wert: {value}', 'Valor calculado desde el GDTF: {value}', 'Waarde berekend uit de GDTF: {value}', 'Valor calculado a partir do GDTF: {value}')
add('ma3CalcParamsHelp', {}, 'Astuce : 1 paramètre = 1 canal DMX, les canaux « fine » 16 bits ne comptent pas.', 'Tip: 1 parameter = 1 DMX channel, 16-bit "fine" channels don\'t count.', 'Tipp: 1 Parameter = 1 DMX-Kanal, 16-Bit-„Fine“-Kanäle zählen nicht.', 'Truco: 1 parámetro = 1 canal DMX, los canales «fine» de 16 bits no cuentan.', 'Tip: 1 parameter = 1 DMX-kanaal, 16-bit "fine"-kanalen tellen niet mee.', 'Dica: 1 parâmetro = 1 canal DMX, os canais «fine» de 16 bits não contam.')
add('ma3CalcBackToGdtf', {}, 'Valeur du GDTF', 'Use GDTF value', 'GDTF-Wert', 'Valor del GDTF', 'GDTF-waarde', 'Valor do GDTF')
add('ma3CalcReliabilityOkTitle', {}, 'GDTF complets à première vue ✅', 'GDTFs look complete ✅', 'GDTFs wirken vollständig ✅', 'Los GDTF parecen completos ✅', 'GDTF\'s lijken compleet ✅', 'Os GDTF parecem completos ✅')
add('ma3CalcReliabilityOkBody', {}, 'Tous les modes sont trouvés et cohérents. Le calcul reste basé sur ces GDTF.', 'All modes were found and are consistent. The result is still only as good as these GDTFs.', 'Alle Modi gefunden und stimmig. Das Ergebnis basiert trotzdem auf diesen GDTFs.', 'Todos los modos se encontraron y son coherentes. El cálculo sigue basándose en estos GDTF.', 'Alle modi gevonden en consistent. De berekening blijft gebaseerd op deze GDTF\'s.', 'Todos os modos foram encontrados e são coerentes. O cálculo continua baseado nestes GDTF.')
add('ma3CalcReliabilityWarnTitle', {'count': 'int'}, '{count} type(s) de machine à vérifier', '{count} fixture type(s) to check', '{count} Gerätetyp(en) prüfen', '{count} tipo(s) de aparato por revisar', '{count} armatuurtype(s) te controleren', '{count} tipo(s) de aparelho a verificar')
add('ma3CalcReliabilityWarnBody', {}, 'Certains GDTF semblent incomplets ou incohérents : le total peut être faux. Détails sous chaque machine.', 'Some GDTFs look incomplete or inconsistent: the total may be wrong. Details under each fixture.', 'Manche GDTFs wirken unvollständig oder widersprüchlich: die Summe kann falsch sein. Details unter jedem Gerät.', 'Algunos GDTF parecen incompletos o incoherentes: el total puede ser erróneo. Detalles bajo cada aparato.', 'Sommige GDTF\'s lijken onvolledig of inconsistent: het totaal kan fout zijn. Details onder elk armatuur.', 'Alguns GDTF parecem incompletos ou incoerentes: o total pode estar errado. Detalhes em cada aparelho.')
add('ma3CalcReliabilityBadTitle', {'count': 'int'}, '{count} type(s) de machine sans données', '{count} fixture type(s) without data', '{count} Gerätetyp(en) ohne Daten', '{count} tipo(s) de aparato sin datos', '{count} armatuurtype(s) zonder gegevens', '{count} tipo(s) de aparelho sem dados')
add('ma3CalcReliabilityBadBody', {}, 'GDTF absent ou mode introuvable : ces machines ne sont pas comptées, donc le total est trop bas. Touche-les pour saisir la valeur.', 'Missing GDTF or mode not found: these fixtures aren\'t counted, so the total is too low. Tap them to enter the value.', 'GDTF fehlt oder Modus nicht gefunden: diese Geräte werden nicht gezählt, die Summe ist also zu niedrig. Antippen, um den Wert einzugeben.', 'Falta el GDTF o no se encuentra el modo: estos aparatos no se cuentan, así que el total es demasiado bajo. Tócalos para escribir el valor.', 'GDTF ontbreekt of modus niet gevonden: deze armaturen tellen niet mee, dus het totaal is te laag. Tik erop om de waarde in te vullen.', 'GDTF em falta ou modo não encontrado: estes aparelhos não são contados, por isso o total está baixo demais. Toca neles para escrever o valor.')
add('ma3CalcDisclaimer', {}, 'Le calcul est basé sur les GDTF. Si un GDTF est incomplet ou faux, le résultat le sera aussi. Vérifie toujours dans la grandMA3 (fenêtre System Information ou Patch › DMX Universes, colonne Coarse Params).', 'The result is based on the GDTFs. If a GDTF is incomplete or wrong, so is the result. Always double-check in grandMA3 (System Information window or Patch › DMX Universes, Coarse Params column).', 'Die Berechnung basiert auf den GDTFs. Ist eine GDTF unvollständig oder falsch, ist es das Ergebnis auch. Immer in der grandMA3 prüfen (Fenster System Information oder Patch › DMX Universes, Spalte Coarse Params).', 'El cálculo se basa en los GDTF. Si un GDTF está incompleto o mal, el resultado también. Compruébalo siempre en la grandMA3 (ventana System Information o Patch › DMX Universes, columna Coarse Params).', 'De berekening is gebaseerd op de GDTF\'s. Is een GDTF onvolledig of fout, dan is het resultaat dat ook. Controleer altijd in de grandMA3 (venster System Information of Patch › DMX Universes, kolom Coarse Params).', 'O cálculo baseia-se nos GDTF. Se um GDTF estiver incompleto ou errado, o resultado também estará. Confirma sempre na grandMA3 (janela System Information ou Patch › DMX Universes, coluna Coarse Params).')
add('ma3CalcDisclaimerShort', {}, 'Calcul basé sur les GDTF : à vérifier dans la grandMA3.', 'Based on the GDTFs: double-check in grandMA3.', 'Basiert auf den GDTFs: in der grandMA3 prüfen.', 'Basado en los GDTF: comprobar en la grandMA3.', 'Gebaseerd op de GDTF\'s: controleer in de grandMA3.', 'Baseado nos GDTF: confirmar na grandMA3.')
add('ma3CalcHowTitle', {}, 'Comment c\'est calculé ?', 'How is it calculated?', 'Wie wird gerechnet?', '¿Cómo se calcula?', 'Hoe wordt het berekend?', 'Como é calculado?')
add('ma3CalcHowBody', {}, 'Pour grandMA3, 1 paramètre = 1 attribut piloté = 1 canal DMX « coarse ». Les canaux fine (16/24 bits) sont gratuits et les canaux virtuels (dimmer virtuel…) ne comptent pas pour la licence. Les machines multi-instance (pixels, cellules) sont dépliées instance par instance. La reco privilégie le moins de boîtiers possible.', 'For grandMA3, 1 parameter = 1 controlled attribute = 1 "coarse" DMX channel. Fine channels (16/24-bit) are free and virtual channels (virtual dimmer…) don\'t count towards the licence. Multi-instance fixtures (pixels, cells) are expanded instance by instance. The recommendation favours the fewest units.', 'Bei grandMA3 gilt: 1 Parameter = 1 gesteuertes Attribut = 1 „Coarse“-DMX-Kanal. Fine-Kanäle (16/24 Bit) sind gratis, virtuelle Kanäle (virtueller Dimmer…) zählen nicht für die Lizenz. Multi-Instanz-Geräte (Pixel, Zellen) werden pro Instanz aufgelöst. Die Empfehlung setzt auf möglichst wenige Geräte.', 'En grandMA3, 1 parámetro = 1 atributo controlado = 1 canal DMX «coarse». Los canales fine (16/24 bits) son gratis y los canales virtuales (dimmer virtual…) no cuentan para la licencia. Los aparatos multi-instancia (píxeles, celdas) se despliegan instancia por instancia. La recomendación busca el menor número de equipos.', 'Voor grandMA3 geldt: 1 parameter = 1 aangestuurd attribuut = 1 "coarse" DMX-kanaal. Fine-kanalen (16/24-bit) zijn gratis en virtuele kanalen (virtuele dimmer…) tellen niet voor de licentie. Multi-instance armaturen (pixels, cellen) worden per instance uitgeklapt. Het advies kiest zo weinig mogelijk units.', 'Na grandMA3, 1 parâmetro = 1 atributo controlado = 1 canal DMX «coarse». Os canais fine (16/24 bits) são gratuitos e os canais virtuais (dimmer virtual…) não contam para a licença. Os aparelhos multi-instância (píxeis, células) são desdobrados instância a instância. A recomendação privilegia o menor número de unidades.')
add('ma3CalcHowHardware', {}, 'Paramètres par matériel (doc MA, v2.3)', 'Parameters per hardware (MA docs, v2.3)', 'Parameter pro Hardware (MA-Doku, v2.3)', 'Parámetros por equipo (doc. MA, v2.3)', 'Parameters per hardware (MA-docs, v2.3)', 'Parâmetros por equipamento (doc. MA, v2.3)')
add('ma3CalcHowSessionMax', {'max': 'String'}, 'Maximum par session : {max}', 'Session maximum: {max}', 'Maximum pro Session: {max}', 'Máximo por sesión: {max}', 'Maximum per sessie: {max}', 'Máximo por sessão: {max}')
add('ma3CalcIssueGdtfMissing', {}, 'GDTF absent du MVR : paramètres inconnus.', 'GDTF missing from the MVR: parameters unknown.', 'GDTF fehlt in der MVR: Parameter unbekannt.', 'Falta el GDTF en el MVR: parámetros desconocidos.', 'GDTF ontbreekt in de MVR: parameters onbekend.', 'GDTF em falta no MVR: parâmetros desconhecidos.')
add('ma3CalcIssueUnreadable', {}, 'GDTF illisible.', 'GDTF can\'t be read.', 'GDTF nicht lesbar.', 'GDTF ilegible.', 'GDTF onleesbaar.', 'GDTF ilegível.')
add('ma3CalcIssueModeMissing', {'modes': 'String'}, 'Aucun mode indiqué dans le MVR. Modes du GDTF : {modes}', 'No mode given in the MVR. GDTF modes: {modes}', 'Kein Modus in der MVR angegeben. GDTF-Modi: {modes}', 'El MVR no indica modo. Modos del GDTF: {modes}', 'Geen modus in de MVR. GDTF-modi: {modes}', 'Nenhum modo indicado no MVR. Modos do GDTF: {modes}')
add('ma3CalcIssueModeNotFound', {'mode': 'String', 'modes': 'String'}, 'Mode « {mode} » introuvable dans le GDTF. Modes dispo : {modes}', 'Mode "{mode}" not found in the GDTF. Available: {modes}', 'Modus „{mode}“ nicht in der GDTF. Verfügbar: {modes}', 'Modo «{mode}» no encontrado en el GDTF. Disponibles: {modes}', 'Modus "{mode}" niet gevonden in de GDTF. Beschikbaar: {modes}', 'Modo «{mode}» não encontrado no GDTF. Disponíveis: {modes}')
add('ma3CalcIssueModeGuessed', {}, 'Pas de mode dans le MVR : le seul mode du GDTF a été utilisé.', 'No mode in the MVR: the GDTF\'s only mode was used.', 'Kein Modus in der MVR: der einzige GDTF-Modus wurde verwendet.', 'No hay modo en el MVR: se ha usado el único modo del GDTF.', 'Geen modus in de MVR: de enige GDTF-modus is gebruikt.', 'Sem modo no MVR: foi usado o único modo do GDTF.')
add('ma3CalcIssueModePartial', {'mode': 'String'}, 'Mode trouvé par nom approchant : « {mode} ».', 'Mode matched by similar name: "{mode}".', 'Modus über ähnlichen Namen gefunden: „{mode}“.', 'Modo encontrado por nombre parecido: «{mode}».', 'Modus gevonden via gelijkaardige naam: "{mode}".', 'Modo encontrado por nome parecido: «{mode}».')
add('ma3CalcIssueNoChannels', {}, 'Ce mode ne contient aucun canal DMX.', 'This mode has no DMX channels.', 'Dieser Modus hat keine DMX-Kanäle.', 'Este modo no tiene canales DMX.', 'Deze modus heeft geen DMX-kanalen.', 'Este modo não tem canais DMX.')
add('ma3CalcIssueNoFunction', {'count': 'int'}, '{count} canal(aux) sans fonction ni attribut : GDTF probablement incomplet.', '{count} channel(s) with no function or attribute: GDTF probably incomplete.', '{count} Kanal/Kanäle ohne Funktion oder Attribut: GDTF wohl unvollständig.', '{count} canal(es) sin función ni atributo: GDTF probablemente incompleto.', '{count} kana(a)l(en) zonder functie of attribuut: GDTF waarschijnlijk onvolledig.', '{count} canal(is) sem função nem atributo: GDTF provavelmente incompleto.')
add('ma3CalcIssueOverlap', {'count': 'int'}, '{count} canal(aux) sur une adresse DMX déjà prise : GDTF incohérent.', '{count} channel(s) on an already used DMX address: inconsistent GDTF.', '{count} Kanal/Kanäle auf bereits belegter DMX-Adresse: GDTF widersprüchlich.', '{count} canal(es) en una dirección DMX ya ocupada: GDTF incoherente.', '{count} kana(a)l(en) op een al bezet DMX-adres: inconsistente GDTF.', '{count} canal(is) num endereço DMX já ocupado: GDTF incoerente.')
add('ma3CalcIssueGaps', {'count': 'int'}, '{count} adresse(s) DMX vide(s) dans le mode : canaux manquants ?', '{count} empty DMX address(es) in the mode: missing channels?', '{count} leere DMX-Adresse(n) im Modus: fehlende Kanäle?', '{count} dirección(es) DMX vacía(s) en el modo: ¿faltan canales?', '{count} lege DMX-adres(sen) in de modus: ontbrekende kanalen?', '{count} endereço(s) DMX vazio(s) no modo: canais em falta?')
add('ma3CalcIssueNameMismatch', {'announced': 'int', 'found': 'int'}, 'Le nom du mode annonce {announced} canaux, le GDTF en décrit {found}.', 'The mode name says {announced} channels, the GDTF describes {found}.', 'Der Modusname nennt {announced} Kanäle, die GDTF beschreibt {found}.', 'El nombre del modo indica {announced} canales, el GDTF describe {found}.', 'De modusnaam zegt {announced} kanalen, de GDTF beschrijft er {found}.', 'O nome do modo indica {announced} canais, o GDTF descreve {found}.')
add('ma3CalcIssueUnknownGeometry', {'count': 'int'}, '{count} canal(aux) liés à une géométrie inexistante.', '{count} channel(s) linked to a missing geometry.', '{count} Kanal/Kanäle mit nicht vorhandener Geometrie.', '{count} canal(es) vinculados a una geometría inexistente.', '{count} kana(a)l(en) gekoppeld aan een ontbrekende geometrie.', '{count} canal(is) ligados a uma geometria inexistente.')
add('ma3CalcIssueManual', {}, 'Valeur saisie à la main.', 'Value entered manually.', 'Wert manuell eingegeben.', 'Valor introducido a mano.', 'Waarde handmatig ingevuld.', 'Valor introduzido à mão.')


def main():
    for lang in LANGS:
        path = os.path.join(ARB_DIR, f'app_{lang}.arb')
        with open(path, encoding='utf-8') as f:
            data = json.load(f, object_pairs_hook=OrderedDict)
        added = 0
        for key, (ph, texts) in K.items():
            if key not in data:
                data[key] = texts[lang]
                added += 1
            if lang == 'fr' and ph and f'@{key}' not in data:
                data[f'@{key}'] = {
                    'description': 'Calculateur de paramètres MA3',
                    'placeholders': {n: {'type': t} for n, t in ph.items()},
                }
        with open(path, 'w', encoding='utf-8') as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
            f.write('\n')
        print(f'{lang}: {added} clés ajoutées')


GEN_DIR = os.path.join(os.path.dirname(__file__), '..', 'lib', 'l10n_gen')


def _dart_str(text, ph):
    """Texte ARB → littéral Dart entre apostrophes, placeholders interpolés."""
    out = text.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$')
    for name in ph:
        token = '{' + name + '}'
        while token in out:
            i = out.index(token)
            after = out[i + len(token):i + len(token) + 1]
            rep = '${' + name + '}' if (after.isalnum() or after == '_') else '$' + name
            out = out[:i] + rep + out[i + len(token):]
    return "'" + out + "'"


def _sig(key, ph):
    args = ', '.join(f"{'int' if t == 'int' else 'String'} {n}" for n, t in ph.items())
    return f'String {key}({args})'


def patch_generated():
    """Met aussi à jour lib/l10n_gen (fichiers générés versionnés dans le repo),
    pour que ça compile même sans relancer `flutter gen-l10n`."""
    abstract = os.path.join(GEN_DIR, 'app_localizations.dart')
    src = open(abstract, encoding='utf-8').read()
    if 'ma3CalcTitle' not in src:
        block = ''
        for key, (ph, texts) in K.items():
            fr = texts['fr'].replace('\n', ' ')
            block += f'\n  /// No description provided for @{key}.\n  ///\n  /// In fr, this message translates to:\n  /// **\'{fr}\'**\n'
            block += f'  {_sig(key, ph)};\n' if ph else f'  String get {key};\n'
        marker = '\nclass _AppLocalizationsDelegate'
        idx = src.index(marker)
        end = src.rindex('}', 0, idx)
        src = src[:end] + block + src[end:]
        open(abstract, 'w', encoding='utf-8').write(src)
        print('l10n_gen/app_localizations.dart : clés ajoutées')
    for lang in LANGS:
        path = os.path.join(GEN_DIR, f'app_localizations_{lang}.dart')
        src = open(path, encoding='utf-8').read()
        if 'ma3CalcTitle' in src:
            continue
        block = ''
        for key, (ph, texts) in K.items():
            lit = _dart_str(texts[lang], ph)
            if ph:
                block += f'\n  @override\n  {_sig(key, ph)} {{\n    return {lit};\n  }}\n'
            else:
                block += f'\n  @override\n  String get {key} => {lit};\n'
        end = src.rstrip().rindex('}')
        src = src[:end] + block + src[end:]
        open(path, 'w', encoding='utf-8').write(src)
        print(f'l10n_gen/app_localizations_{lang}.dart : clés ajoutées')


if __name__ == '__main__':
    main()
    patch_generated()
