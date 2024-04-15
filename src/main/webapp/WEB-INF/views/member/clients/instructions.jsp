<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title></title>


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script>
            if (window.self !== window.top) {
                window.top.location.href = window.self.location.href;
            }
        </script>

    </head>

    <body>
        <header>
            <jsp:include page="/components/header.jsp" />
        </header>


        <section id="app">
            <div class="container">
                <div class="row">
                    <div class="col">
                    </div>
                </div>

                <div class="rounded-3 p-3 mb-4" style="background-color: rgb(228, 237, 234);height: 2000px">
                    <div class="row">
                        <div class="col-md-3 border-right">


                        </div>
                        <div class="col-md-5 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                <p><strong>測試用帳號： </strong><br>
                                    <br>
                                    A客戶帳號 - peter<br>
                                    A客戶密碼 - 1234<br>
                                    <br>
                                    B客戶帳號 - gene<br>
                                    B客戶密碼 - 1234<br>
                                    <br>
                                    <strong>※也可自行註冊帳號做登入</strong>
                                    <br>
                                    <br>
                                    後台人員帳號 - worker<br>
                                    後台人員密碼 - 1234<br>
                                    <br>
                                    <br>
                                    ---------------------------------------------------------------
                                    <br>
                                    ※網站主要特點
                                </p>
                                <p style="text-align: left;">
                                    <strong>1. 基礎的會員資料CRUD</strong><br>
                                    <br>
                                    ● 註冊表單時，填入的帳號，會跟資料庫做檢查，重複則不能使用<br>
                                    ● 同個登入頁面，輸入工作人員帳號則進入後台管理系統<br>
                                    ● 客戶更改大頭照時有簡易預覽畫面<br>
                                    ● 後台可對客戶的資料作更動，前台則有限制，像是客戶不能自行調整會員等級跟抽獎次數，這些只能在後台能操作<br>
                                    <br>
                                    <br>
                                    <strong>2. 帳號安全性 - 二次驗證的Email機制</strong><br>
                                    <br>
                                    ● 操作方式簡單，對使用者友善，用戶只要在會員中心點選開啟，下次登入就可做帳號安全性的Email二次驗證<br>
                                    <br>
                                    <br>
                                    <strong>3. 完整的抽獎功能</strong><br>
                                    <br>
                                    ● 簡易調整中獎機率，可新增獎品並快速調整獎池內容<br>
                                    ● 可調整獎品庫存量，獎品被抽完，客戶端再次抽中會顯示"此獎項已經發放完畢!!"<br>
                                    ● 設計一天只能抽固定次數的抽獎機制，並且是以伺服器的時間為判斷，所以不會有客戶利用更改時間來不法取得抽獎次數<br>
                                    ● 給予會員”個人倉庫”收藏獎品，使用者能快速知道自己的獎品內容<br>
                                    <br>
                                    <br>
                                    <strong>4. 客服即時通訊系統</strong><br>
                                    <br>
                                    ● 可以在連接客服前選擇需要的服務類型，並在後台系統會告知工作人員有客戶需要通訊並顯現出問題類型<br>
                                    ● 每個用戶離開聊天室都會有完整的對話紀錄作保存，但我設定不能更改對話內容是因為我認為對話內容須保持中立<br>
                                    ● 有做基礎防範措施，當A客戶正在跟客服通話時，B客戶不能進入聊天室，並且B客戶會顯示客服忙線中<br>
                                    <br>
                                    <br>
                                </p>



                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="p-3 py-5">


                            </div>
                        </div>
                    </div>
                </div>
        </section>

        <footer>
            <jsp:include page="/components/footer.jsp" />
        </footer>




    </body>

    </html>