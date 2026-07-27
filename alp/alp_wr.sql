#FIS WR Data (Final FIS List of Each Year, Last 12 years)
#this IS a CHANGE mya IS testing
SELECT
l.Seasoncode,
b.Recid,
b.Listid,
l.Listnumber,
l.Listname,
l.Printdeadline,
l.Published,
b.Disciplinecode,
c.Gender,
b.Competitorid,
c.Fiscode,
c.Lastname,
c.Firstname,
TIMESTAMPDIFF(
    YEAR,
    c.Birthdate,
    STR_TO_DATE(CONCAT(l.Seasoncode, '-12-31'), '%Y-%m-%d')
)               AS Age,
YEAR(c.Birthdate) AS YOB,
c.Nationcode,
b.Position,
b.Fispoints
FROM A_listresultal b
JOIN A_competitor c ON b.Competitorid = c.Competitorid
JOIN A_listdefal l ON b.Listid = l.Listid
WHERE l.Seasoncode >= 2014
AND l.Listname IN ('13th FIS points list 2013/2014', '13th FIS points list 2014/2015', '13th FIS points list 2015/2016',
'14th FIS points list 2016/2017', '14th FIS points list 2017/2018', '19th FIS points list 2018/2019', '19th FIS points list 2019/2020',
'21st FIS points list 2020/2021', '21st FIS points list 2021/2022', '22nd FIS points list 2022/2023', '22nd FIS points list 2023/2024',
'22nd FIS points list 2024/25', '22nd FIS points list 2025/26')
AND l.Published = 1
ORDER BY l.Seasoncode ASC, b.Disciplinecode ASC, c.Gender ASC, b.Position ASC;


