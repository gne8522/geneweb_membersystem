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
                        <nav aria-label="breadcrumb" class="rounded-3 p-3 mb-4"
                            style="background-color: rgb(228, 237, 234);">
                            <ol class="breadcrumb" style="margin: 10px 100px 10px 500px">
                                <li class="breadcrumb-item active" aria-current="page"><a
                                        :href="newhost + '/memberCenter'">個人檔案</a></li>
                                <li class="breadcrumb-item active" aria-current="page">會員抽獎</li>
                                <li class="breadcrumb-item active" aria-current="page"><a
                                        :href="newhost + '/customerServiceUser'">客服中心</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="rounded-3 p-3 mb-4" style="background-color: rgb(228, 237, 234);height: 500px">
                    <div class="row">
                        <div class="col-md-3 border-right">


                        </div>
                        <div class="col-md-5 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                <p>剩餘次數：{{lotteryTimes}}</p>
                                <button type="button" class="btn btn-success" @click="lottery">抽獎</button>
                                <img :src="lotteryPrize" alt="">


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

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://www.unpkg.com/axios@1.6.7/dist/axios.min.js"></script>
        <script src="/js/url.js"></script>
        <script type="module">
            import { createApp, ref } from "https://www.unpkg.com/vue@3.4.19/dist/vue.esm-browser.prod.js"
            var jsonDataString = sessionStorage.getItem("loginStatus");
            var jsonData = JSON.parse(jsonDataString);
            const app = createApp({
                data: function () {
                    return {
                        lotteryPrize: null,
                        lotteryNumber: null,
                        lotteryTimes: null,
                        prizeName: null,
                        prizePicBase64: null,
                        prizeID: null,
                        memberData: null,
                        mid: jsonData.mid,
                        memberLv: '',
                        lastLotteryDate: new Date().toISOString().split('T')[0],
                        serverTime: '',
                        newhost: newhost,
                        prizeInventory: null,
                        prizepoolID: null,
                    }
                },
                created() {
                    var jsonDataString = sessionStorage.getItem("loginStatus");
                    var jsonData = JSON.parse(jsonDataString);
                    axios.get(newhost + '/getServerTime.controller').then(response => {
                        this.serverTime = response.data.dateString
                    })
                    let request = {
                        mid: jsonData.mid,
                    }
                    axios.post(newhost + '/findMidString.controller', request)
                        .then(response => {
                            this.memberData = response.data.showAll;
                            this.memberLv = this.memberData.memberLv;
                            this.lotteryTimes = this.memberData.lotteryTimes;
                            let lastLotteryDate = this.memberData.lastLotteryDate;
                            let serverTime = this.serverTime
                            if (lastLotteryDate < serverTime) {
                                let lotteryTimesUpdateNoDate = {
                                    lotteryTimes: this.memberLv,
                                    mid: this.mid
                                }
                                axios.post(newhost + '/updatelotteryTimesNoDate.controller', lotteryTimesUpdateNoDate)
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
                },
                methods: {
                    lottery() {
                        if (this.lotteryTimes == 0 || this.lotteryTimes < 0) {
                            Swal.fire({
                                title: "沒有次數了!!",
                                icon: "error",
                                focusConfirm: false,
                                confirmButtonText: '確認',
                            })
                        } else {
                            axios.get(newhost + '/memberLottery.controller').then(response => {
                                this.lotteryNumber = response.data.lotteryResult;
                                let request = {
                                    prizepoolID: this.lotteryNumber
                                }
                                axios.post(newhost + '/findPrizePoolString.controller', request).then(response => {
                                    let responseData = response.data.prizepool;
                                    this.prizeName = responseData.prizeName;
                                    this.prizePicBase64 = responseData.prizePicBase64;
                                    this.prizeID = responseData.prizeID;
                                    this.prizeInventory = responseData.prizeInventory;
                                    this.prizepoolID = responseData.prizepoolID;

                                    console.log(this.prizeID);
                                    if (this.prizeName == '無獎品') {
                                        Swal.fire({
                                            title: "沒中!!",
                                            text: "再試一次!!",
                                            icon: "warning",
                                            focusConfirm: false,
                                            confirmButtonText: '確認',
                                        }).then(() => {
                                            let lotteryTimesUpdate = {
                                                lotteryTimes: this.lotteryTimes - 1,
                                                lastLotteryDate: this.lastLotteryDate,
                                                mid: this.mid
                                            }
                                            axios.post(newhost + '/lotteryTimesUpdate.controller', lotteryTimesUpdate)
                                            this.lotteryTimes = this.lotteryTimes - 1
                                        })


                                    } else {

                                        if (this.prizeInventory == '0') {
                                            Swal.fire({
                                                title: "抱歉!!" + this.prizeName + " - 此獎項已經發放完畢!!",
                                                text: "再試一次!!",
                                                icon: "warning",
                                                focusConfirm: false,
                                                confirmButtonText: '確認',
                                            })

                                        } else {
                                            Swal.fire({
                                                title: '恭喜中獎!!<br>獎品是：' + this.prizeName,
                                                html: '<div id="imageContainer" style="width: 300px; height: auto;"></div>',
                                                text: this.prizeName,
                                                focusConfirm: false,
                                                confirmButtonText: '確認',
                                                didOpen: () => {
                                                    const imageContainer = document.getElementById('imageContainer');
                                                    const img = document.createElement('img');
                                                    img.src = this.prizePicBase64;
                                                    img.style.width = '100%';
                                                    imageContainer.appendChild(img);
                                                }
                                            }).then(() => {
                                                let updateInventory = {
                                                    prizeInventory: this.prizeInventory - 1,
                                                    prizepoolID: this.prizeID,
                                                }
                                                axios.post(newhost + '/updatePrizeInventory.controller', updateInventory)

                                                this.lotteryPrize = this.prizePicBase64;
                                                let request = {
                                                    newPrizeID: this.prizeID,
                                                    newMid: this.mid
                                                }
                                                axios.post(newhost + '/InsertPrizetoUserStorage.controller', request).then(response => {
                                                    let lotteryTimesUpdate = {
                                                        lotteryTimes: this.lotteryTimes - 1,
                                                        lastLotteryDate: this.lastLotteryDate,
                                                        mid: this.mid
                                                    }
                                                    axios.post(newhost + '/lotteryTimesUpdate.controller', lotteryTimesUpdate)
                                                    this.lotteryTimes = this.lotteryTimes - 1
                                                })
                                            });

                                        }
                                    }



                                })



                            })





                        }



                    },
                }
            })
            app.mount("#app");



        </script>



    </body>

    </html>