
目前我有使用Azure架設網頁，網址：http://geneweb.net/ <br>
（找不到畫面可能是因為我關掉Azure、執行網站維護，或是網域的合約到期）<br>

-----------------------------------------------------------------------------------------------------------------------------------------

MS SQL 資料庫語法<br>

-----------------------------------------------------------------------------------------------------------------------------------------
CREATE DATABASE geneweb;<br>
USE geneweb;<br>
<br>
--會員系統
<br>
CREATE TABLE UserData(<br>
	mid INT not null PRIMARY KEY IDENTITY(1000,1),<br>
	userAcc NVARCHAR(20) not null,<br>
	userPwd NVARCHAR(20) not null,<br>
	validation BIT DEFAULT 0 not null,<br>
	userName NVARCHAR(50) not null,<br>
	email NVARCHAR(50) not null,<br>
	gender NVARCHAR(5) not null,<br>
	address NVARCHAR(100),<br>
	memberLv INT,<br>
	lotteryTimes INT,<br>
	lastLotteryDate DATE,<br>
	userTel NVARCHAR(20) not null,<br>
	birthday DATE not null,<br>
	userPic VARBINARY(MAX),<br>
	messaging BIT DEFAULT 0 not null,<br>
<br>
);<br>


<br>
INSERT INTO UserData (userAcc, userPwd, userName, email, gender, address, memberLv,lotteryTimes, userTel, birthday) VALUES ('test', '1234', '測試人員', 'test000@gmail.com', '不顯示', '高雄市三民區XX街XX號', '5','5', '0977651010', '1929-10-10');<br>
INSERT INTO UserData (userAcc, userPwd, userName, email, gender, address, memberLv,lotteryTimes, userTel, birthday) VALUES ('peter', '1234', '葉姓一號先生', 'peter999@gmail.com', '男', '高雄市三民區XX街XX號', '5','5', '0977084010', '1919-10-12');<br>
INSERT INTO UserData (userAcc, userPwd, userName, email, gender, address, memberLv,lotteryTimes, userTel, birthday) VALUES ('robert', '1234', '葉姓五號先生', 'robert888@gmail.com', '男', '高雄市前金區XX街XX號', '4','4', '09223044010', '1919-10-10');<br>
INSERT INTO UserData (userAcc, userPwd, userName, email, gender, address, memberLv,lotteryTimes, userTel, birthday) VALUES ('john', '1234', '楊姓三號先生', 'john777@gmail.com', '男', '高雄市前金區XX街XX號', '1','1', '0977085610', '2000-11-10');<br>
INSERT INTO UserData (userAcc, userPwd, userName, email, gender, address, memberLv,lotteryTimes, userTel, birthday) VALUES ('michael ', '1234', '楊姓九號先生', 'michael666@gmail.com', '男', '高雄市小港區XX街XX號', '5','5', '0937084010', '1919-06-10');<br>
INSERT INTO UserData (userAcc, userPwd, userName, email, gender, address, memberLv,lotteryTimes, userTel, birthday) VALUES ('mary', '1234', '楊姓五號小姐', 'mary555@gmail.com', '女', '高雄市小港區XX街XX號', '3','3', '0974123010', '2001-10-10');<br>
INSERT INTO UserData (userAcc, userPwd, userName, email, gender, address, memberLv,lotteryTimes, userTel, birthday) VALUES ('jennifer', '1234', '吳姓六號小姐', 'jennifer333@gmail.com', '女', '高雄市岡山區XX街XX號', '2','2', '0977415010', '1919-12-10');<br>
INSERT INTO UserData (userAcc, userPwd, userName, email, gender, address, memberLv,lotteryTimes, userTel, birthday) VALUES ('jessica ', '1234', '吳姓七號小姐', 'jessica222@gmail.com', '女', '高雄市岡山區XX街XX號', '4','4', '0996358710', '1919-10-20');<br>
INSERT INTO UserData (userAcc, userPwd, userName, email, gender, address, memberLv,lotteryTimes, userTel, birthday) VALUES ('patricia', '1234', '吳姓一百號小姐', 'patricia111@gmail.com', '女', '高雄市岡山區XX街XX號', '5','5', '0903358710', '1919-10-10');<br>
INSERT INTO UserData (userAcc, userPwd, userName, email, gender, address, memberLv,lotteryTimes, userTel, birthday,validation) VALUES ('cool', '1234', '吳姓一百號小姐', 'cool@gmail.com', '女', '高雄市岡山區XX街XX號', '5','5', '0903358710', '1919-10-10','1');<br>
INSERT INTO UserData (userAcc, userPwd, userName, email, gender, address, memberLv,lotteryTimes, userTel, birthday,validation) VALUES ('gene', '1234', '葉先生', 'gne8522@gmail.com', '男', '高雄市三民區XX街XX號', '5','5', '0903358710', '1919-10-10','1');<br>

<br>
SELECT * FROM UserData;<br>
<br>
DROP TABLE UserData;<br>


<br>

CREATE TABLE AdminData(<br>
	adminID INT not null PRIMARY KEY IDENTITY(100,1),<br>
	adminName NVARCHAR(20) not null,<br>
	adminAcc NVARCHAR(20) not null,<br>
	adminPwd NVARCHAR(20) not null,<br>
	adminTel NVARCHAR(20) not null,<br>
	adminEmail NVARCHAR(50) not null,<br>
	oncall BIT DEFAULT 0 not null,<br>
	problemType NVARCHAR(20),<br>
);<br>
<br>

INSERT INTO AdminData (adminName, adminAcc, adminPwd, adminTel,adminEmail) VALUES ('工作人員', 'worker', '1234', '0999000000', 'workertest@gmail.com');<br>
INSERT INTO AdminData (adminName, adminAcc, adminPwd, adminTel,adminEmail) VALUES ('工作人員一號', 'worker01', 'worker01A@', '0999000001', 'worker01@gmail.com');<br>
INSERT INTO AdminData (adminName, adminAcc, adminPwd, adminTel,adminEmail) VALUES ('工作人員二號', 'worker02', 'worker02A@', '0999000002', 'worker02@gmail.com');<br>
INSERT INTO AdminData (adminName, adminAcc, adminPwd, adminTel,adminEmail) VALUES ('工作人員三號', 'worker03', 'worker03A@', '0999000003', 'worker03@gmail.com');<br>
INSERT INTO AdminData (adminName, adminAcc, adminPwd, adminTel,adminEmail) VALUES ('工作人員四號', 'worker04', 'worker04A@', '0999000004', 'worker04@gmail.com');<br>
INSERT INTO AdminData (adminName, adminAcc, adminPwd, adminTel,adminEmail) VALUES ('工作人員五號', 'worker05', 'worker05A@', '0999000005', 'worker05@gmail.com');<br>
INSERT INTO AdminData (adminName, adminAcc, adminPwd, adminTel,adminEmail) VALUES ('工作人員六號', 'worker06', 'worker06A@', '0999000006', 'worker06@gmail.com');<br>

<br>
SELECT * FROM AdminData;<br>
<br>
DROP TABLE AdminData;<br>

<br>

CREATE TABLE UserStorage(<br>
usid INT not null PRIMARY KEY IDENTITY(1000,1),<br>
fk_prizeID INT,<br>
fk_mid INT,<br>
expiration DATE,<br>
FOREIGN KEY (fk_mid) REFERENCES UserData(mid),<br>
FOREIGN KEY (fk_prizeID) REFERENCES Prize(prizeID)<br>
)<br>

<br>
SELECT * FROM UserStorage<br>
<br>
DROP TABLE UserStorage<br>

<br>
CREATE TABLE PrizePool(<br>
    prizepoolID INT NOT NULL PRIMARY KEY,<br>
    fk_prizeID INT<br>
	FOREIGN KEY (fk_prizeID) REFERENCES Prize(prizeID),<br>
);<br>
INSERT INTO PrizePool (prizepoolID,fk_prizeID) VALUES ('1','1');<br>
INSERT INTO PrizePool (prizepoolID,fk_prizeID) VALUES ('2','1');<br>
INSERT INTO PrizePool (prizepoolID,fk_prizeID) VALUES ('3','1');<br>
INSERT INTO PrizePool (prizepoolID,fk_prizeID) VALUES ('4','1');<br>
INSERT INTO PrizePool (prizepoolID,fk_prizeID) VALUES ('5','1');<br>

<br>
SELECT * FROM PrizePool<br>
<br>
DROP TABLE PrizePool <br>



CREATE TABLE Prize(<br>
    prizeID INT NOT NULL PRIMARY KEY IDENTITY(1,1),<br>
    prizeName NVARCHAR(20) NOT NULL,<br>
    discount DECIMAL(5, 2),<br>
    prizePic VARBINARY(MAX)<br>
);<br>

<br>
INSERT INTO Prize (prizeName, discount) VALUES ('無獎品', '0');<br>
INSERT INTO Prize (prizeName, discount) VALUES ('15%', '0');<br>
INSERT INTO Prize (prizeName, discount) VALUES ('20%', '0');<br>
INSERT INTO Prize (prizeName, discount) VALUES ('30%', '0');<br>
INSERT INTO Prize (prizeName, discount) VALUES ('40%', '0');<br>
<br>
SELECT * FROM Prize<br>
<br>
DROP TABLE Prize <br>
<br>

CREATE TABLE ServiceRecord(<br>
    rid INT NOT NULL PRIMARY KEY IDENTITY(1,1),<br>
	serviceTarget NVARCHAR(20) not null,<br>
	recordType NVARCHAR(10) not null,<br>
	recordDate DATETIME not null,<br>
    recordText NVARCHAR(MAX) not null,<br>
);<br>

SELECT * FROM ServiceRecord<br>
<br>
DROP TABLE ServiceRecord<br>
<br>




-----------------------------------------------------------------------------------------------------------------------------------------

網頁介紹<br>

-----------------------------------------------------------------------------------------------------------------------------------------

1. 基礎的前端頁面，我是使用bootstrap做畫面呈現，使用Vue來操縱DOM，使用Axios來實現Ajax非同步技術
![image](https://github.com/gne8522/geneweb/assets/156037229/95afb251-b7ae-46cc-8aad-bf9e5af4a7ec)
<br>
-----------------------------------------------------------------------------------------------------------------------------------------

<br>
2. 基礎的會員資料CRUD<br>
● 註冊表單時，填入的帳號，會跟資料庫做檢查，重複則不能使用 <br>
● 同個登入頁面，輸入工作人員帳號則進入後台管理系統<br>
● 客戶更改大頭照時有簡易預覽畫面<br>
● 後台可對客戶的資料作更動，前台則有限制，像是客戶不能自行調整會員等級跟抽獎次數，這些只能在後台能操作<br>

![image](https://github.com/gne8522/geneweb/assets/156037229/77947525-d8cd-4e72-a1c7-389e422f423a)

![image](https://github.com/gne8522/geneweb/assets/156037229/95cdc4fd-646a-4a36-bfc1-49c326ca2436)

![image](https://github.com/gne8522/geneweb/assets/156037229/885b8437-cf83-484b-9b35-89c8b25c09a2)


---------------------------------------------------------------------------------------------------------
<br>
3. 帳號安全性 - 也就是二次驗證的Email機制<br>
● 操作方式簡單，對使用者友善，用戶只要在會員中心點選開啟，下次登入就可做帳號安全性的Emai二次驗證<br>

![image](https://github.com/gne8522/geneweb/assets/156037229/3fb38e9f-a188-48a4-8817-64f43a7eda72)

![image](https://github.com/gne8522/geneweb/assets/156037229/6d685d38-517c-45d4-8d02-417ce91c6359)


---------------------------------------------------------------------------------------------------------
<br>
4. 完整的抽獎功能<br>
● 簡易調整中獎機率，可新增獎品並快速調整獎池內容<br>
● 可調整獎品庫存量，獎品被抽完，客戶端再次抽中會顯示"此獎項已經發放完畢!!"<br>
● 設計一天只能抽固定次數的抽獎機制，並且是以伺服器的時間為判斷，所以不會有客戶利用更改時間來不法取得抽獎次數<br>
● 給予會員”個人倉庫”收藏獎品，使用者能快速知道自己的獎品內容<br>

![image](https://github.com/gne8522/geneweb/assets/156037229/83b58703-6aad-492d-bfdb-67e5fe31fa43)

![image](https://github.com/gne8522/geneweb/assets/156037229/f5d1bb9a-96cf-42ee-8084-70264d83133e)

![image](https://github.com/gne8522/geneweb/assets/156037229/b6a2df1c-571c-486b-95c0-f7136e0f98ad)

![image](https://github.com/gne8522/geneweb/assets/156037229/3206d3a1-e7cf-4447-aeae-0b38ec860fad)

---------------------------------------------------------------------------------------------------------
<br>
5. 客服即時通訊系統<br>
● 我上網找資料、自學的websocket<br>
● 可以在連接客服前選擇需要的服務類型，並在後台系統會告知工作人員有客戶需要通訊並顯現出問題類型<br>
● 每個用戶離開聊天室都會有完整的對話紀錄作保存，但我設定不能更改對話內容是因為我認為對話內容須保持中立<br>
● 有做基礎防範措施，當A客戶正在跟客服通話時，B客戶不能進入聊天室，並且B客戶會顯示客服忙線中<br>

![image](https://github.com/gne8522/geneweb/assets/156037229/52dff92e-0013-43a6-b365-b2eac8fe03fe)

![image](https://github.com/gne8522/geneweb/assets/156037229/da1b8504-9ff9-41ed-ad11-d298d8cea037)

![image](https://github.com/gne8522/geneweb/assets/156037229/174d36b7-786b-4706-afa4-6b5ad93ae4b2)

![image](https://github.com/gne8522/geneweb/assets/156037229/72936200-1ec3-4662-b9a1-a0bdbc913163)

![image](https://github.com/gne8522/geneweb/assets/156037229/f845034d-dff9-4469-afb8-6742de96927d)




