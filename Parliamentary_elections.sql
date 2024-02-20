SELECT 
	Zaw�d, 
	COUNT(Zaw�d) AS [Liczba kandydat�w], 
	AVG(Liczba_g�os�w) AS [�rednia liczba g�os�w na kandydata], 
	COUNT(CASE WHEN Czy_przyznano_mandat = 'Tak' THEN 1 END) AS [Ilo�� przyznanych mandat�w]
FROM dbo.kandydaci_sejm_2019
GROUP BY Zaw�d
ORDER BY [Ilo�� przyznanych mandat�w] DESC;

SELECT 
	Zaw�d, 
	COUNT(Zaw�d) AS [Liczba kandydat�w], 
	AVG(Liczba_g�os�w) AS [�rednia liczba g�os�w na kandydata], 
	COUNT(CASE WHEN Czy_przyznano_mandat = 'Tak' THEN 1 END) AS [Ilo�� przyznanych mandat�w]
FROM dbo.kandydaci_sejm_2023
GROUP BY Zaw�d
ORDER BY [Ilo�� przyznanych mandat�w] DESC;

SELECT 
	Zaw�d, 
	COUNT(Zaw�d) AS [Liczba kandydat�w], 
	AVG(Liczba_g�os�w) AS [�rednia liczba g�os�w na kandydata], 
	COUNT(CASE WHEN Czy_przyznano_mandat = 'Tak' THEN 1 END) AS [Ilo�� przyznanych mandat�w]
FROM dbo.kandydaci_senat_2019
GROUP BY Zaw�d
ORDER BY [Ilo�� przyznanych mandat�w] DESC;

SELECT 
	Zaw�d, 
	COUNT(Zaw�d) AS [Liczba kandydat�w], 
	AVG(Liczba_g�os�w) AS [�rednia liczba g�os�w na kandydata], 
	COUNT(CASE WHEN Czy_przyznano_mandat = 'Tak' THEN 1 END) AS [Ilo�� przyznanych mandat�w]
FROM dbo.kandydaci_senat_2023
GROUP BY Zaw�d
ORDER BY [Ilo�� przyznanych mandat�w] DESC;

SELECT 
	Siedziba_OKW,
	SUM(Wyborcy) AS [Liczba wyborc�w],
	SUM(Liczba_kandydat�w) AS [Liczba kandydat�w],
	SUM(Liczba_mandat�w) AS [Liczba mandat�w],
	CAST(CAST(SUM(Liczba_kandydat�w) AS FLOAT)/CAST(SUM(Liczba_mandat�w) AS FLOAT) AS DECIMAL(18,2)) AS [Liczba kandydat�w na 1 mandat]
FROM dbo.okregi_sejm_2019
GROUP BY Siedziba_OKW
ORDER BY [Liczba kandydat�w na 1 mandat] DESC;

SELECT 
	Siedziba_OKW,
	SUM(Wyborcy) AS [Liczba wyborc�w],
	SUM(Liczba_kandydat�w) AS [Liczba kandydat�w],
	SUM(Liczba_mandat�w) AS [Liczba mandat�w],
	CAST(CAST(SUM(Liczba_kandydat�w) AS FLOAT)/CAST(SUM(Liczba_mandat�w) AS FLOAT) AS DECIMAL(18,2)) AS [Liczba kandydat�w na 1 mandat]
FROM dbo.okregi_sejm_2023
GROUP BY Siedziba_OKW
ORDER BY [Liczba kandydat�w na 1 mandat] DESC;

SELECT
	Nazwa AS Komitet,
	SUM(CAST(Liczba_kandydat�w AS INT)) AS [Liczba kandydat�w],
	SUM(CAST(Liczba_g�os�w AS INT)) AS [Liczba g�os�w],
	SUM(CAST(Liczba_mandat�w AS INT)) AS [Liczba mandat�w]
FROM dbo.wykaz_list_sejm_2019
GROUP BY Nazwa
ORDER BY [Liczba mandat�w] DESC;

SELECT
	Nazwa_Komitetu AS Komitet,
	SUM(CAST(Liczba_kandydat�w AS INT)) AS [Liczba kandydat�w],
	SUM(CAST(Liczba_g�os�w AS INT)) AS [Liczba g�os�w],
	SUM(CAST(Liczba_mandat�w AS INT)) AS [Liczba mandat�w]
FROM dbo.wykaz_list_sejm_2023
GROUP BY Nazwa_Komitetu
ORDER BY [Liczba mandat�w] DESC;

SELECT 
	Wojew�dztwo,
	SUM(CAST(Liczba_wyborc�w_uprawnionych_do_g�osowania AS INT)) AS [Liczba wyborc�w uprawnionych do g�osowania],
	CAST(SUM(CAST(Liczba_g�os�w_wa�nych_oddanych_��cznie_na_wszystkie_listy_kandydat�w AS FLOAT)) / SUM(CAST(Liczba_wyborc�w_uprawnionych_do_g�osowania AS FLOAT)) AS DECIMAL(15,2)) AS [Frekwencja],
	SUM(CAST(Liczba_g�os�w_wa�nych_oddanych_��cznie_na_wszystkie_listy_kandydat�w AS INT)) AS [Liczba g�os�w wa�nych],
	SUM(CAST(KOMITET_WYBORCZY_BEZPARTYJNI_SAMORZ�DOWCY AS INT)) AS [Bezpartyjni Samorz�dowcy],
	SUM(CAST(KOALICYJNY_KOMITET_WYBORCZY_TRZECIA_DROGA_POLSKA_2050_SZYMONA_HO�OWNI_POLSKIE_STRONNICTWO_LUDOWE AS INT)) AS [Trzecia Droga],
	SUM(CAST(KOMITET_WYBORCZY_NOWA_LEWICA AS INT)) AS [Nowa Lewica],
	SUM(CAST(KOMITET_WYBORCZY_PRAWO_I_SPRAWIEDLIWO�� AS INT)) AS [Prawo i Sprawiedliwo��],
	SUM(CAST(KOMITET_WYBORCZY_KONFEDERACJA_WOLNO��_I_NIEPODLEG�O�� AS INT)) AS [Konfederacja Wolno�� i Niepodleg�o��],
	SUM(CAST(KOALICYJNY_KOMITET_WYBORCZY_KOALICJA_OBYWATELSKA_PO_N_IPL_ZIELONI AS INT)) AS [Koalicja Obywatelska],
	SUM(CAST(KOMITET_WYBORCZY_POLSKA_JEST_JEDNA AS INT)) AS [Polska Jest Jedna],
	SUM(CAST(KOMITET_WYBORCZY_WYBORC�W_RUCHU_DOBROBYTU_I_POKOJU AS INT)) AS [Komitet Wyborczy Wyborc�w Ruchu Dobrobytu I Pokoju],
	SUM(CAST(KOMITET_WYBORCZY_NORMALNY_KRAJ AS INT)) AS [Normalny Kraj],
	SUM(CAST(KOMITET_WYBORCZY_ANTYPARTIA AS INT)) AS [Antypartia],
	SUM(CAST(KOMITET_WYBORCZY_RUCH_NAPRAWY_POLSKI AS INT)) AS [Ruch Naprawy Polski],
	SUM(CAST(KOMITET_WYBORCZY_WYBORC�W_MNIEJSZO��_NIEMIECKA AS INT)) AS [Mniejszo�� Niemiecka]
FROM dbo.wyniki_gl_na_listy_po_obwodach_sejm_2023
WHERE Wojew�dztwo IS NOT NULL
GROUP BY Wojew�dztwo
ORDER BY [Liczba g�os�w wa�nych] DESC;

SELECT 
	Wojew�dztwo,
	SUM(CAST(Liczba_wyborc�w_uprawnionych_do_g�osowania AS INT)) AS [Liczba wyborc�w uprawnionych do g�osowania],
	CAST(SUM(CAST(Liczba_g�os�w_wa�nych_oddanych_��cznie_na_wszystkie_listy_kandydat�w AS FLOAT)) / SUM(CAST(Liczba_wyborc�w_uprawnionych_do_g�osowania AS FLOAT)) AS DECIMAL(15,2)) AS [Frekwencja],
	SUM(CAST(Liczba_g�os�w_wa�nych_oddanych_��cznie_na_wszystkie_listy_kandydat�w AS INT)) AS [Liczba g�os�w wa�nych],
	SUM(CAST(KOALICYJNY_KOMITET_WYBORCZY_KOALICJA_OBYWATELSKA_PO_N_IPL_ZIELONI_ZPOW_601_6_19 AS INT)) AS [Koalicja Obywatelska],
	SUM(CAST(KOMITET_WYBORCZY_AKCJA_ZAWIEDZIONYCH_EMERYT�W_RENCIST�W_ZPOW_601_21_19 AS INT)) AS [Akcja Zawiedzionych Emeryt�w Rencist�w],
	SUM(CAST(KOMITET_WYBORCZY_KONFEDERACJA_WOLNO��_I_NIEPODLEG�O��_ZPOW_601_5_19 AS INT)) AS [Konfederacja Wolno�� i Niepodleg�o��],
	SUM(CAST(KOMITET_WYBORCZY_POLSKIE_STRONNICTWO_LUDOWE_ZPOW_601_19_19 AS INT)) AS [Polskie Stronnictwo Ludowe],
	SUM(CAST(KOMITET_WYBORCZY_PRAWICA_ZPOW_601_20_19 AS INT)) AS [Prawica],
	SUM(CAST(KOMITET_WYBORCZY_PRAWO_I_SPRAWIEDLIWO��_ZPOW_601_9_19 AS INT)) AS [Prawo i Sprawiedliwo��],
	SUM(CAST(KOMITET_WYBORCZY_SKUTECZNI_PIOTRA_LIROYA_MARCA_ZPOW_601_17_19 AS INT)) AS [Skuteczni Piotra Liroya Marca],
	SUM(CAST(KOMITET_WYBORCZY_SOJUSZ_LEWICY_DEMOKRATYCZNEJ_ZPOW_601_1_19 AS INT)) AS [Sojusz Lewicy Demokratycznej],
	SUM(CAST(KOMITET_WYBORCZY_WYBORC�W_KOALICJA_BEZPARTYJNI_I_SAMORZ�DOWCY_ZPOW_601_10_19 AS INT)) AS [Bezpartyjni Samorz�dowcy],
	SUM(CAST(KOMITET_WYBORCZY_WYBORC�W_MNIEJSZO��_NIEMIECKA_ZPOW_601_15_19 AS INT)) AS [Mniejszo�� Niemiecka]
FROM dbo.wyniki_gl_na_listy_po_obwodach_sejm_2019
WHERE Wojew�dztwo IS NOT NULL
GROUP BY Wojew�dztwo
ORDER BY [Liczba g�os�w wa�nych] DESC;