-- USE testRubicon;

-- SET GLOBAL local_infile='ON';

CREATE TABLE AssetStatus(Id VARCHAR(255),IsDeleted VARCHAR(255),Name VARCHAR(255),CurrencyIsoCode VARCHAR(255),CreatedDate VARCHAR(255),CreatedById VARCHAR(255));

LOAD DATA INFILE '/etc/mysql/tmp/test.csv'
INTO TABLE AssetStatus
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Id,IsDeleted,Name,CurrencyIsoCode,CreatedDate,CreatedById);

