SELECT 
	Zawód, 
	COUNT(Zawód) AS [Liczba kandydatów], 
	AVG(Liczba_g³osów) AS [Œrednia liczba g³osów na kandydata], 
	COUNT(CASE WHEN Czy_przyznano_mandat = 'Tak' THEN 1 END) AS [Iloœæ przyznanych mandatów]
FROM dbo.kandydaci_sejm_2019
GROUP BY Zawód
ORDER BY [Iloœæ przyznanych mandatów] DESC;

SELECT 
	Zawód, 
	COUNT(Zawód) AS [Liczba kandydatów], 
	AVG(Liczba_g³osów) AS [Œrednia liczba g³osów na kandydata], 
	COUNT(CASE WHEN Czy_przyznano_mandat = 'Tak' THEN 1 END) AS [Iloœæ przyznanych mandatów]
FROM dbo.kandydaci_sejm_2023
GROUP BY Zawód
ORDER BY [Iloœæ przyznanych mandatów] DESC;

SELECT 
	Zawód, 
	COUNT(Zawód) AS [Liczba kandydatów], 
	AVG(Liczba_g³osów) AS [Œrednia liczba g³osów na kandydata], 
	COUNT(CASE WHEN Czy_przyznano_mandat = 'Tak' THEN 1 END) AS [Iloœæ przyznanych mandatów]
FROM dbo.kandydaci_senat_2019
GROUP BY Zawód
ORDER BY [Iloœæ przyznanych mandatów] DESC;

SELECT 
	Zawód, 
	COUNT(Zawód) AS [Liczba kandydatów], 
	AVG(Liczba_g³osów) AS [Œrednia liczba g³osów na kandydata], 
	COUNT(CASE WHEN Czy_przyznano_mandat = 'Tak' THEN 1 END) AS [Iloœæ przyznanych mandatów]
FROM dbo.kandydaci_senat_2023
GROUP BY Zawód
ORDER BY [Iloœæ przyznanych mandatów] DESC;

SELECT 
	Siedziba_OKW,
	SUM(Wyborcy) AS [Liczba wyborców],
	SUM(Liczba_kandydatów) AS [Liczba kandydatów],
	SUM(Liczba_mandatów) AS [Liczba mandatów],
	CAST(CAST(SUM(Liczba_kandydatów) AS FLOAT)/CAST(SUM(Liczba_mandatów) AS FLOAT) AS DECIMAL(18,2)) AS [Liczba kandydatów na 1 mandat]
FROM dbo.okregi_sejm_2019
GROUP BY Siedziba_OKW
ORDER BY [Liczba kandydatów na 1 mandat] DESC;

SELECT 
	Siedziba_OKW,
	SUM(Wyborcy) AS [Liczba wyborców],
	SUM(Liczba_kandydatów) AS [Liczba kandydatów],
	SUM(Liczba_mandatów) AS [Liczba mandatów],
	CAST(CAST(SUM(Liczba_kandydatów) AS FLOAT)/CAST(SUM(Liczba_mandatów) AS FLOAT) AS DECIMAL(18,2)) AS [Liczba kandydatów na 1 mandat]
FROM dbo.okregi_sejm_2023
GROUP BY Siedziba_OKW
ORDER BY [Liczba kandydatów na 1 mandat] DESC;

SELECT
	Nazwa AS Komitet,
	SUM(CAST(Liczba_kandydatów AS INT)) AS [Liczba kandydatów],
	SUM(CAST(Liczba_g³osów AS INT)) AS [Liczba g³osów],
	SUM(CAST(Liczba_mandatów AS INT)) AS [Liczba mandatów]
FROM dbo.wykaz_list_sejm_2019
GROUP BY Nazwa
ORDER BY [Liczba mandatów] DESC;

SELECT
	Nazwa_Komitetu AS Komitet,
	SUM(CAST(Liczba_kandydatów AS INT)) AS [Liczba kandydatów],
	SUM(CAST(Liczba_g³osów AS INT)) AS [Liczba g³osów],
	SUM(CAST(Liczba_mandatów AS INT)) AS [Liczba mandatów]
FROM dbo.wykaz_list_sejm_2023
GROUP BY Nazwa_Komitetu
ORDER BY [Liczba mandatów] DESC;

SELECT 
	Województwo,
	SUM(CAST(Liczba_wyborców_uprawnionych_do_g³osowania AS INT)) AS [Liczba wyborców uprawnionych do g³osowania],
	CAST(SUM(CAST(Liczba_g³osów_wa¿nych_oddanych_³¹cznie_na_wszystkie_listy_kandydatów AS FLOAT)) / SUM(CAST(Liczba_wyborców_uprawnionych_do_g³osowania AS FLOAT)) AS DECIMAL(15,2)) AS [Frekwencja],
	SUM(CAST(Liczba_g³osów_wa¿nych_oddanych_³¹cznie_na_wszystkie_listy_kandydatów AS INT)) AS [Liczba g³osów wa¿nych],
	SUM(CAST(KOMITET_WYBORCZY_BEZPARTYJNI_SAMORZ¥DOWCY AS INT)) AS [Bezpartyjni Samorz¹dowcy],
	SUM(CAST(KOALICYJNY_KOMITET_WYBORCZY_TRZECIA_DROGA_POLSKA_2050_SZYMONA_HO£OWNI_POLSKIE_STRONNICTWO_LUDOWE AS INT)) AS [Trzecia Droga],
	SUM(CAST(KOMITET_WYBORCZY_NOWA_LEWICA AS INT)) AS [Nowa Lewica],
	SUM(CAST(KOMITET_WYBORCZY_PRAWO_I_SPRAWIEDLIWOŒÆ AS INT)) AS [Prawo i Sprawiedliwoœæ],
	SUM(CAST(KOMITET_WYBORCZY_KONFEDERACJA_WOLNOŒÆ_I_NIEPODLEG£OŒÆ AS INT)) AS [Konfederacja Wolnoœæ i Niepodleg³oœæ],
	SUM(CAST(KOALICYJNY_KOMITET_WYBORCZY_KOALICJA_OBYWATELSKA_PO_N_IPL_ZIELONI AS INT)) AS [Koalicja Obywatelska],
	SUM(CAST(KOMITET_WYBORCZY_POLSKA_JEST_JEDNA AS INT)) AS [Polska Jest Jedna],
	SUM(CAST(KOMITET_WYBORCZY_WYBORCÓW_RUCHU_DOBROBYTU_I_POKOJU AS INT)) AS [Komitet Wyborczy Wyborców Ruchu Dobrobytu I Pokoju],
	SUM(CAST(KOMITET_WYBORCZY_NORMALNY_KRAJ AS INT)) AS [Normalny Kraj],
	SUM(CAST(KOMITET_WYBORCZY_ANTYPARTIA AS INT)) AS [Antypartia],
	SUM(CAST(KOMITET_WYBORCZY_RUCH_NAPRAWY_POLSKI AS INT)) AS [Ruch Naprawy Polski],
	SUM(CAST(KOMITET_WYBORCZY_WYBORCÓW_MNIEJSZOŒÆ_NIEMIECKA AS INT)) AS [Mniejszoœæ Niemiecka]
FROM dbo.wyniki_gl_na_listy_po_obwodach_sejm_2023
WHERE Województwo IS NOT NULL
GROUP BY Województwo
ORDER BY [Liczba g³osów wa¿nych] DESC;

SELECT 
	Województwo,
	SUM(CAST(Liczba_wyborców_uprawnionych_do_g³osowania AS INT)) AS [Liczba wyborców uprawnionych do g³osowania],
	CAST(SUM(CAST(Liczba_g³osów_wa¿nych_oddanych_³¹cznie_na_wszystkie_listy_kandydatów AS FLOAT)) / SUM(CAST(Liczba_wyborców_uprawnionych_do_g³osowania AS FLOAT)) AS DECIMAL(15,2)) AS [Frekwencja],
	SUM(CAST(Liczba_g³osów_wa¿nych_oddanych_³¹cznie_na_wszystkie_listy_kandydatów AS INT)) AS [Liczba g³osów wa¿nych],
	SUM(CAST(KOALICYJNY_KOMITET_WYBORCZY_KOALICJA_OBYWATELSKA_PO_N_IPL_ZIELONI_ZPOW_601_6_19 AS INT)) AS [Koalicja Obywatelska],
	SUM(CAST(KOMITET_WYBORCZY_AKCJA_ZAWIEDZIONYCH_EMERYTÓW_RENCISTÓW_ZPOW_601_21_19 AS INT)) AS [Akcja Zawiedzionych Emerytów Rencistów],
	SUM(CAST(KOMITET_WYBORCZY_KONFEDERACJA_WOLNOŒÆ_I_NIEPODLEG£OŒÆ_ZPOW_601_5_19 AS INT)) AS [Konfederacja Wolnoœæ i Niepodleg³oœæ],
	SUM(CAST(KOMITET_WYBORCZY_POLSKIE_STRONNICTWO_LUDOWE_ZPOW_601_19_19 AS INT)) AS [Polskie Stronnictwo Ludowe],
	SUM(CAST(KOMITET_WYBORCZY_PRAWICA_ZPOW_601_20_19 AS INT)) AS [Prawica],
	SUM(CAST(KOMITET_WYBORCZY_PRAWO_I_SPRAWIEDLIWOŒÆ_ZPOW_601_9_19 AS INT)) AS [Prawo i Sprawiedliwoœæ],
	SUM(CAST(KOMITET_WYBORCZY_SKUTECZNI_PIOTRA_LIROYA_MARCA_ZPOW_601_17_19 AS INT)) AS [Skuteczni Piotra Liroya Marca],
	SUM(CAST(KOMITET_WYBORCZY_SOJUSZ_LEWICY_DEMOKRATYCZNEJ_ZPOW_601_1_19 AS INT)) AS [Sojusz Lewicy Demokratycznej],
	SUM(CAST(KOMITET_WYBORCZY_WYBORCÓW_KOALICJA_BEZPARTYJNI_I_SAMORZ¥DOWCY_ZPOW_601_10_19 AS INT)) AS [Bezpartyjni Samorz¹dowcy],
	SUM(CAST(KOMITET_WYBORCZY_WYBORCÓW_MNIEJSZOŒÆ_NIEMIECKA_ZPOW_601_15_19 AS INT)) AS [Mniejszoœæ Niemiecka]
FROM dbo.wyniki_gl_na_listy_po_obwodach_sejm_2019
WHERE Województwo IS NOT NULL
GROUP BY Województwo
ORDER BY [Liczba g³osów wa¿nych] DESC;