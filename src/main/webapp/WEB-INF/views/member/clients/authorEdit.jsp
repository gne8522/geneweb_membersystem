<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title></title>


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
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




                <div class="rounded-3 p-3 mb-4" style="background-color: rgb(228, 237, 234);">

                    <div style=" width: 100%; height: 200px; overflow: hidden;">
                        <img id="img" class="" style="width: 100%; height: auto;" :src="photoBase64" alt="your image">
                    </div>


                    <div class="row">
                        <div class="col-md-3 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                <form @submit.prevent="submitForm">
                                    <input accept="image/*" type='file' id="imgNew" name="userPic" style="display: none;" />
                                    <button class="btn btn-outline-primary me-2" type="button"
                                        @click="selectImage">選擇背景</button>
    
                                    <input type="hidden" name="mid" :value="mid">
                                    <input type="submit" value="上傳圖片" style="display: none;">
                                    <button class="btn btn-primary profile-button" type="button"
                                        onclick="document.querySelector('input[type=submit]').click()">上傳</button>
                                    <br>
                                </form>

                                <img id="img" class="rounded-circle mt-5" width="150px" height="150px" :src="photoBase64"
                                    alt="your image">


                                <span class="font-weight-bold"><strong
                                        style="font-size: 20px">作者：{{userAcc}}</strong></span>
                                <span class="font-weight-bold"><span
                                        style="font-size: 15px">會員等級：{{memberLv}}</span></span>
                                <br>
                                <form @submit.prevent="submitForm">
                                    <input accept="image/*" type='file' id="imgNew" name="userPic" style="display: none;" />
                                    <button class="btn btn-outline-primary me-2" type="button"
                                        @click="selectImage">選擇個人圖片</button>
    
                                    <input type="hidden" name="mid" :value="mid">
                                    <input type="submit" value="上傳圖片" style="display: none;">
                                    <button class="btn btn-primary profile-button" type="button"
                                        onclick="document.querySelector('input[type=submit]').click()">上傳</button>
                                    <br>
                                </form>



                            </div>

                        </div>
                        <div class="col-md-5 border-right" style="width: 900px;margin-top: 50px;">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                  <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">自我介紹</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                  <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">文章</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                  <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">留言板</button>
                                </li>
                              </ul>
                              <div class="tab-content" id="myTabContent">

                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">...</div>


                                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>


                                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
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
                        newhost: newhost,
                        sessionData: null,
                        memberData: null,
                        memberPic: '',
                        memberName: '',
                        mid: jsonData.mid,
                        selectedCountry: '台灣',
                        selectedCity: '台北市',
                        userName: '',
                        email: '',
                        gender: '',
                        birthday: '',
                        address: '',
                        userTel: '',
                        photoBase64: '',
                        memberLv: '',
                        userAcc: '',
                    }
                },
                created() {
                    var jsonDataString = sessionStorage.getItem("loginStatus");
                    var jsonData = JSON.parse(jsonDataString);
                    this.sessionData = jsonData.mid
                    let request = {
                        mid: this.sessionData,
                    }
                    axios.post(newhost + '/findMidString.controller', request)
                        .then(response => {
                            this.memberData = response.data.showAll;
                            this.userName = this.memberData.userName;
                            this.memberName = this.memberData.userName;
                            this.email = this.memberData.email;
                            this.gender = this.memberData.gender;
                            this.birthday = this.memberData.birthday;
                            this.address = this.memberData.address;
                            this.userTel = this.memberData.userTel;
                            this.photoBase64 = this.memberData.photoBase64;
                            this.memberLv = this.memberData.memberLv;
                            this.userAcc = this.memberData.userAcc;
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
                },
                methods: {
                    selectImage() {
                        document.querySelector('input[type=file]').click()
                        const img = document.getElementById('img');
                        const imgNew = document.getElementById('imgNew');
                        imgNew.onchange = object => {
                            const [file] = imgNew.files
                            if (file) {
                                img.src = URL.createObjectURL(file)
                            }
                        }
                    },
                    submitForm() {
                        let formData = new FormData();
                        formData.append('userPic', document.querySelector('input[type=file]').files[0]);
                        formData.append('mid', this.mid);
                        axios.post(newhost + '/uploadImage.controller', formData)
                            .then(response => {

                                Swal.fire({
                                    title: response.data.messages,
                                    icon: "success",
                                    showConfirmButton: false,
                                    timer: 1500
                                }).then(function () {
                                    window.location.href = newhost + "/memberCenter"
                                })
                            })
                            .catch(error => {
                                Swal.fire({
                                    title: "上傳失敗!",
                                    text: error,
                                    icon: "error",
                                    showConfirmButton: false,
                                    timer: 1500
                                })
                            });
                    },
                    updateUserData() {
                        let update = {
                            userName: this.userName,
                            email: this.email,
                            gender: this.gender,
                            birthday: this.birthday,
                            address: this.address,
                            userTel: this.userTel,
                            mid: this.mid,
                        }
                        axios.post(newhost + "/userUpdate.controller", update).then(response => {
                            Swal.fire({
                                title: "更新成功!",
                                icon: "success",
                                showConfirmButton: false,
                                timer: 1500
                            }).then(function () {
                                window.location.href = newhost + "/memberCenter"
                            })

                        })

                    },
                    UpdatePassword() {
                        Swal.fire({
                            title: '請輸入舊密碼',
                            input: 'password',
                            showCancelButton: true,
                            confirmButtonText: '確認',
                            cancelButtonText: '取消',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                const data = result.value;
                                let search = {
                                    mid: this.mid,
                                }
                                console.log(search)
                                axios.post(newhost + "/searchPwd.controller", search).then(response => {
                                    console.log(response.data.pwd)
                                    const oldpwd = response.data.pwd
                                    if (data == response.data.pwd) {
                                        Swal.fire({
                                            title: '請輸入新密碼',
                                            input: 'password',
                                            showCancelButton: true,
                                            confirmButtonText: '確認',
                                            cancelButtonText: '取消',
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                const newData = result.value;
                                                let newpwd = {
                                                    mid: this.mid,
                                                    userPwd: newData
                                                }
                                                axios.post(newhost + "/updatePwd.controller", newpwd).then(response => {
                                                    Swal.fire({
                                                        title: "更新成功!",
                                                        text: "請重新登入!!",
                                                        icon: "success",
                                                        showConfirmButton: false,
                                                        timer: 1500
                                                    }).then(function () {
                                                        sessionStorage.clear();
                                                        window.location.href = newhost + "/index"
                                                    })
                                                })
                                            }
                                        })

                                    } else {
                                        Swal.fire({
                                            title: "密碼錯誤!",
                                            icon: "error",
                                            showConfirmButton: false,
                                            timer: 1500
                                        }).then(function () {
                                            window.location.href = newhost + "/memberCenter"
                                        })
                                    }
                                })

                            }
                        });

                    }
                }
            })
            app.mount("#app");



        </script>



    </body>

    </html>