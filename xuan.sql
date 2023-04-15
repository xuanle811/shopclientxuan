
CREATE FUNCTION nhapKho_table 
    (@startday DATE, @endday DATE)
    RETURNS TABLE
    AS 
    RETURN 
        SELECT NL.id_nguyenlieu, 
        ten_nguyenlieu, donvitinh, sum(soluongnhan) as tongSL, dongia, (tongSL * dongia) AS thanhtien,
        from NGUYENLIEU NL, PHIEUNHAP PN, CT_PHIEUNHAP CTPN
        WHERE PN.idphieunhap = CTPN.idphieunhap
        AND CTPN.idnguyenlieu=NL.idnguyenlieu
        and ngaynhap BETWEEN @startday AND @endday
        GROUP BY NL.id_nguyenlieu

CREATE FUNCTION nhapKho(@startday DATE, @endday DATE)
RETURNS @nhapKhoTable TABLE (
    id_nguyenlieu Char(10),
    ten_nguyenlieu NvarChar(30), 
    donvitinh Char(5), 
    tongSL INT, 
    dongia FLOAT, 
    thanhtien FLOAT
)
AS
BEGIN
    INSERT INTO @nhapKhoTable
    SELECT NL.id_nguyenlieu, 
        ten_nguyenlieu, donvitinh, sum(soluongnhan) as tongSL, dongia, (tongSL * dongia) AS thanhtien,
        from NGUYENLIEU NL, PHIEUNHAP PN, CT_PHIEUNHAP CTPN
        WHERE PN.idphieunhap = CTPN.idphieunhap
        AND CTPN.idnguyenlieu=NL.idnguyenlieu
        and ngaynhap BETWEEN @startday AND @endday
        GROUP BY NL.id_nguyenlieu ;
    RETURN;
END;

DECLARE @tongchi FLOAT;
SET @tongchi = (SELECT SUM(thanhtien) from @nhapKho_table(@startday, @endday))

SELECT * FROM @nhapKhoTable(@startday, @endday)





CREATE FUNCTION nhapKho(@startday DATE, @endday DATE)
RETURNS @nhapKhoTable TABLE (
    id_nguyenlieu Char(10),
    ten_nguyenlieu NvarChar(30), 
    donvitinh Char(5), 
    tongSL INT, 
    dongia FLOAT, 
    thanhtien FLOAT,
)
AS
BEGIN
    INSERT INTO @nhapKhoTable
    SELECT NL.id_nguyenlieu, 
        ten_nguyenlieu, donvitinh, sum(soluongnhan) as tongSL, dongia, (sum(soluongnhan) * dongia) AS thanhtien,
        from NGUYENLIEU NL, PHIEUNHAP PN, CT_PHIEUNHAP CTPN
        WHERE PN.idphieunhap = CTPN.idphieunhap
        AND CTPN.idnguyenlieu=NL.idnguyenlieu
        and ngaynhap BETWEEN @startday AND @endday
        GROUP BY NL.id_nguyenlieu  
    RETURN;
END;

DECLARE @startday DATE = '2023-01-01';
DECLARE @endday DATE = '2023-01-31';
DECLARE @tongchi FLOAT;

SELECT * FROM nhapKho(@startday, @endday);

SET @tongchi = (SELECT SUM(thanhtien) from nhapKho(@startday, @endday));
SELECT 'Tong chi: ' + CAST(@tongchi AS VARCHAR(10));






