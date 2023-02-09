USE [QLKNL]
GO
/****** Object:  StoredProcedure [dbo].[SP_TONGHUYNL]    Script Date: 2/9/2023 4:58:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TONGHUYNL]
       @TUNGAY DATETIME, @DENNGAY DATETIME
AS
BEGIN
	   

	SELECT NL.MANL, TENNL, SUM(SOLUONG) AS SLH
	FROM (SELECT MAPH FROM PHIEUHUYNL WHERE NGAYHUY >= @TUNGAY AND NGAYHUY <= @DENNGAY) PH,CTPH, NGUYENLIEU NL
	WHERE PH.MAPH = CTPH.MAPH AND CTPH.MANL = NL.MANL
	GROUP BY NL.MANL, TENNL
	ORDER BY NL.MANL
END
GO
