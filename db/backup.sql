RESTORE FILELISTONLY 
FROM DISK = 'D:\gate211\gate_backup_2019_05_30_030001_8495029.bak'


RESTORE DATABASE gate211 FROM DISK = 'D:\gate211\gate_backup_2019_05_30_030001_8495029.bak' WITH NORECOVERY, REPLACE
, MOVE 'gate' TO 'E:\gate211\gate211.mdf',
MOVE 'gate_log' TO 'E:\gate211\gate211_log.ldf'



RESTORE DATABASE gate211 FROM DISK = 'D:\gate211\diff\gate_backup_2019_05_30_040001_5346379' WITH NORECOVERY


IF DB_ID('gate211') IS NULL 
BEGIN
  RESTORE DATABASE [Northwind]
  FILE = N'gate211_Data'
  FROM DISK = N'D:\gate211\gate_backup_2019_05_30_030001_8495029.bak'
  WITH 
    FILE = 1, NOUNLOAD, STATS = 10,
    MOVE N'YOUR logical name of data file as shown by RESTORE FILELISTONLY command'
    TO N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SS2008\MSSQL\DATA\Northwind.mdf',
    MOVE N'YOUR logical name of Log file as shown by RESTORE FILELISTONLY command'
    TO N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SS2008\MSSQL\DATA\Northwind_0.LDF'
END
